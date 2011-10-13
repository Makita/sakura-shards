class HomeController < ApplicationController
  before_filter :reset_expiry

  def index
    @title = "Light Shrouded in Darkness"
    @updates = Announcement.get_announcements
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
    @post = Announcement.find_by_id(params[:id])
    @comments = @post.comments.paginate(:page => params[:page], :per_page => 10).order('id desc')
  end

  def make_comment
    unless params[:email].blank? redirect_to :action => 'comment', :id => params[:comment][:announcement_id]
    Comment.create(params[:comment])
    redirect_to :action => 'comment', :id => params[:comment][:announcement_id]
  end

  def edit
    @post = Announcement.find_by_id(params[:id])
  end

  def edit_announcement
    params[:announcements][:body] = params[:announcements][:body].gsub(/\n/, '<br />')
    Announcement.find_by_id(params[:id]).update_attributes(params[:announcements])
    redirect_to :action => 'index'
  end

  def destroy
    Announcement.find_by_id(params[:id]).destroy
    redirect_to :action => 'index'
  end
end
