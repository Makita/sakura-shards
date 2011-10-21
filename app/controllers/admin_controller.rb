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

  def create
    Upload.create(params[:uploads])
    redirect_to :action => 'index'
  end

  def add_novel
    @title = "Add Light Novel"
  end

  def create_novel
    params[:light_novels][:body] = params[:light_novels][:body].gsub(/\n/, '<br />')
    LightNovel.create(params[:light_novels])
    redirect_to :action => 'index'
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

  def add_title_relation
    JapaneseTitle.create(params[:titles])
    redirect_to :action => 'index'
  end

  def authenticate
    require 'yaml'
    userpass = YAML.load(File.open('config/userpass.yml'))
    check = userpass[params[:username]]
    redirect_to :action => 'index' if check.nil?
    if check["password"] == params[:password]
      session[:user] = check["dispname"]
      session[:level] = check["level"]
      session[:expiry] = Time.now + 20.minutes
    end
    redirect_to :action => 'index'
  end
end
