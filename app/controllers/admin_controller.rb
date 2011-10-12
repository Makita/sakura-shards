class AdminController < ApplicationController
  before_filter :is_logged_in, :except => :authenticate

  def index
    @title = "Admin Panel"
  end

  def is_logged_in
    return true unless session[:user].blank? or session[:expiry] < Time.now
    @title = "Login"
    render 'login'
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
        session[:user] = params[:username]
        session[:expiry] = Time.now + 20.minutes
      end
    end until check.nil?
    redirect_to :action => 'index'
  end
end
