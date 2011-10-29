class LightNovelController < ApplicationController
  def index
    @title = t :light_novel_page
    @latest = LightNovel.get_latest
  end

  def read
    @novel = LightNovel.find(params[:id])
    @title = t :read, :series => JapaneseTitle.translate_title(@novel.name), :volume => @novel.volume, :chapter => @novel.volume
  end

  def edit
    @title = t :edit_title
    @novel = LightNovel.find(params[:id])
  end

  def edit_light_novel
    params[:light_novels][:body] = params[:light_novels][:body].gsub(/\n/, '<br />')
    LightNovel.find(params[:id]).update_attributes(params[:light_novels])
    redirect_to :action => :read, :id => params[:id]
  end

  def destroy_novel
    redirect_to :action => :index if session[:user].nil?
    LightNovel.find(params[:id]).destroy
    redirect_to :action => :index
  end
end
