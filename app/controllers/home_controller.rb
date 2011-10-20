class HomeController < ApplicationController
  before_filter :reset_expiry

  def index
    @title = "Light Shrouded in Darkness"
  end

  def faq
    @title = "FAQ"
  end

  def search
    @title = "Search"
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
    @post = get_updates(I18n.locale, params[:id])
    @comments = @post.comments.paginate(:page => params[:page], :per_page => 10).order('id desc')
  end

  def make_comment
    redirect_to :action => 'comment', :id => params[:comment][:announcement_id] unless params[:email].blank?
    Comment.create(params[:comment])
    redirect_to :action => 'comment', :id => params[:comment][:announcement_id]
  end

  def edit
    @post = Announcement.find_by_id(params[:id])
    @jap_ver = JapaneseVersion.find_by_announcements_id(params[:id])
  end

  def edit_announcement
    params[:announcements][:body] = params[:announcements][:body].gsub(/\n/, '<br />')
    Announcement.find_by_id(params[:id]).update_attributes(params[:announcements])
    params[:japanese][:announcements_id] = params[:id]
    params[:japanese][:body] = params[:japanese][:body].gsub(/\n/, '<br />')
    jap_ver = JapaneseVersion.find_by_announcements_id(params[:id])
    if jap_ver.nil?
      JapaneseVersion.create(params[:japanese])
    else
      jap_ver.update_attributes(params[:japanese])
    end
    redirect_to :action => 'index'
  end

  def destroy
    redirect_to :action => 'index' if session[:user].nil?
    Announcement.find_by_id(params[:id]).destroy
    jap_ver = JapaneseVersion.find_by_announcements_id(params[:id])
    jap_ver.destroy unless jap_ver.nil?
    redirect_to :action => 'index'
  end
end
