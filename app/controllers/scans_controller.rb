class ScansController < ApplicationController
  before_filter :reset_expiry

  def index
    @title = t :scanlations_page
    @latest = Upload.paginate(:page => params[:upload], :per_page => 10).order('id desc')
    @latest2 = Translation.paginate(:page => params[:translation], :per_page => 10).order('id desc')
  end

  def read
    @translation = Translation.find(params[:id])
    @title = t :read, :series => JapaneseTitle.translate_title(@translation.name), :volume => @translation.volume, :chapter => @translation.chapter
  end

  def edit
    @title = t :edit_title
    @translation = Translation.find(params[:id])
  end

  def edit_translation
    params[:translations][:body] = params[:translations][:body].gsub(/\n/, '<br />')
    Translation.find(params[:id]).update_attributes(params[:translations])
    redirect_to :action => :read, :id => params[:id]
  end

  def destroy
    redirect_to :action => :index if session[:user].nil?
    Upload.find(params[:id]).destroy
    redirect_to :action => :index
  end

  def destroy_translation
    redirect_to :action => :index if session[:user].nil?
    Translation.find(params[:id]).destroy
    redirect_to :action => :index
  end
end
