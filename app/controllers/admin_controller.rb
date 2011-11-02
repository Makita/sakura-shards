class AdminController < ApplicationController
  before_filter :is_logged_in, :except => :authenticate

  def index
    @title = t :admin_panel
  end

  def is_logged_in
    session[:expiry] = Time.now + 20.minutes unless session[:user].nil? or session[:expiry] < Time.now
    return true unless session[:user].blank? or session[:expiry] < Time.now
    reset_session
    @title = t :login_button
    render 'login'
  end

  def add_update
    @title = t(:add_new_scanlation).titleize
  end

  def add_translation
    @title = t(:add_new_translation).titleize
  end

  def view_title_rel
    @title = t(:view_rels).titleize
    @rels = JapaneseTitle.get_all
  end

  def create
    Upload.create(params[:uploads])
    redirect_to :action => :index
  end

  def add_novel
    @title = t(:add_new_novel).titleize
  end

  def create_novel
    params[:light_novels][:body] = params[:light_novels][:body].gsub(/\n/, '<br />')
    LightNovel.create(params[:light_novels])
    redirect_to :action => :index
  end

  def create_translation
    params[:translations][:body] = params[:translations][:body].gsub(/\n/, '<br />')
    Translation.create(params[:translations])
    redirect_to :action => :index
  end

  def announce
    @title = t(:add_new_announcement).titleize
  end
  
  def make_announcement
    params[:announcements][:body] = params[:announcements][:body].gsub(/\n/, '<br />')
    new = Announcement.create(params[:announcements])
    unless params[:japanese][:body].blank?
      params[:japanese][:announcements_id] = new.id
      params[:japanese][:body] = params[:japanese][:body].gsub(/\n/, '<br />')
      JapaneseVersion.create(params[:japanese])
    end
    redirect_to :action => :index
  end

  def title_relation
    @title = t(:add_title_relation).titleize
  end

  def add_title_relation
    unless params[:titles][:eng_title].blank? or params[:titles][:jp_title].blank?
      JapaneseTitle.create(params[:titles])
      redirect_to :action => :index
    end
  end

  def edit_title_rel
    @rel = JapaneseTitle.find(params[:id])
  end

  def do_edit_rel
    JapaneseTitle.find(params[:id]).update_attributes(params[:titles])
    redirect_to :action => :view_title_rel
  end

  def destroy_title_rel
    JapaneseTitle.find(params[:id]).destroy
    redirect_to :action => :view_title_rel
  end

  def authenticate
    require 'yaml'
    require 'bcrypt'
    userpass = YAML.load(File.open('config/userpass.yml'))
    check = userpass[params[:username]]
    if check.nil?
      redirect_to :action => :index
      return
    end
    if BCrypt::Password.new(check["password"]) == params[:password]
      session[:user] = check["dispname"]
      session[:level] = check["level"]
      session[:expiry] = Time.now + 20.minutes
    end
    redirect_to :action => :index
  end
end
