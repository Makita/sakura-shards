class LightNovelController < ApplicationController
  def index
    @title = t(:light_novel_page)
    @latest = LightNovel.get_latest
  end

  def read
    @novel = LightNovel.find(params[:id])
    @title = t :read, :series => @novel.name, :volume => @novel.volume, :chapter => @novel.volume
  end

  def destroy_novel
    redirect_to :action => 'index' if session[:user].nil?
    LightNovel.find(params[:id]).destroy
    redirect_to :action => 'index'
  end
end
