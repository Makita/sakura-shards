class AdminController < ApplicationController
  before_filter :is_logged_in, :except => :authenticate

  def index
    @title = "Admin Panel"
  end

  def is_logged_in
    session[:expiry] = Time.now + 20.minutes unless session[:user].nil? or session[:expiry] < Time.now
    return true unless session[:user].blank? or session[:expiry] < Time.now
    @title = "Login"
    render 'login'
  end

  def add_update
    @title = "Add Update"
  end
  
  def make_announcement
    params[:announcements][:body] = params[:announcements][:body].gsub(/\n/, '<br />')
    Announcement.create(params[:announcements])
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
        session[:expiry] = Time.now + 20.minutes
      end
    end until check.nil?
    puts "-------------------------------"
    puts session[:user]
    puts "-------------------------------"
    redirect_to :action => 'index'
  end

  def logout
    reset_session
    redirect_to :action => 'index'
  end
end
