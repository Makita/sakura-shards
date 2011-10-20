class AdminController < ApplicationController
  before_filter :is_logged_in, :except => :authenticate

  def index
    @title = "Admin Panel"
  end

  def is_logged_in
    session[:expiry] = Time.now + 20.minutes unless session[:user].nil? or session[:expiry] < Time.now
    return true unless session[:user].blank? or session[:expiry] < Time.now
    reset_session
    @title = "Login"
    render 'login'
  end

  def add_update
    @title = "Add Update"
  end
  
  def make_announcement
    params[:announcements][:body] = params[:announcements][:body].gsub(/\n/, '<br />')
    new = Announcement.create(params[:announcements])
    unless params[:japanese][:body].blank?
      params[:japanese][:announcements_id] = new.id
      params[:japanese][:body] = params[:japanese][:body].gsub(/\n/, '<br />')
      JapaneseVersion.create(params[:japanese])
    end
    redirect_to :action => 'index'
  end

  def create
    Upload.create(params[:uploads])
    redirect_to :action => 'index'
  end

  def authenticate
    require 'yaml'
    userpass = YAML.load(File.open('config/userpass.yml'))
    a = 0
    begin
      a += 1
      check = userpass["user#{a}"]
      break if check.nil?
      if check["username"] == params[:username] and check["password"] == params[:password]
        session[:user] = check["dispname"]
        session[:level] = check["level"]
        session[:expiry] = Time.now + 20.minutes
      end
    end until check.nil?
    redirect_to :action => 'index'
  end
end
