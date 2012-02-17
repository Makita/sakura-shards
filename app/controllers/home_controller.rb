class HomeController < ApplicationController
  before_filter :reset_expiry

  def index
    @title = t :page_title
    @updates = get_updates()
  end

  def faq
    @title = t :faq_page
  end

  def search
    @title = t :search
    array = Upload.explode(params[:search])
    @search = Upload.search do
      fulltext array.first unless array.first.blank?
      with :volume, array.second.first.to_i unless array.second.first.blank?
      with :chapter, array.second.second.to_i unless array.second.second.blank?
      order_by :created_at, :desc
      paginate :per_page => 20, :page => params[:page]
    end
  end

  def comment
    @title = t :comments
    @post = get_updates(params[:id])
    @comments_hook = get_updates(params[:id], :en)
    @comments = @comments_hook.comments.paginate(:page => params[:page], :per_page => 10).order('id desc')
  end

  def get_updates(id = nil, locale = I18n.locale)
    return JapaneseVersion.get_announcements if locale == :jp and id.nil?
    return JapaneseVersion.find_by_announcements_id(id) if locale == :jp
    return Announcement.find(id) unless id.nil?
    return Announcement.get_announcements
  end

  def make_comment
    if not params[:email].blank? or params[:comment][:body].include? '[url=' or params[:comment][:body].include? '<a href='
      redirect_to :action => :comment, :id => params[:comment][:announcement_id]
      return
    end
    Comment.create(params[:comment])
    redirect_to :action => :comment, :id => params[:comment][:announcement_id]
  end

  def edit
    @title = t :edit_title
    @post = Announcement.find_by_id(params[:id])
    @jap_ver = JapaneseVersion.find_by_announcements_id(params[:id])
  end

  def edit_announcement
    params[:announcements][:body] = params[:announcements][:body].gsub(/\n/, '<br />')
    Announcement.find_by_id(params[:id]).update_attributes(params[:announcements])
    params[:japanese][:announcements_id] = params[:id]
    params[:japanese][:body] = params[:japanese][:body].gsub(/\n/, '<br />')
    jap_ver = JapaneseVersion.find_by_announcements_id(params[:id])
    jap_ver.nil? ? JapaneseVersion.create(params[:japanese]) : jap_ver.update_attributes(params[:japanese])
    redirect_to :action => :index
  end

  def destroy
    redirect_to :action => :index if session[:user].nil?
    Announcement.find_by_id(params[:id]).destroy
    jap_ver = JapaneseVersion.find_by_announcements_id(params[:id])
    jap_ver.destroy unless jap_ver.nil?
    redirect_to :action => :index
  end
end
