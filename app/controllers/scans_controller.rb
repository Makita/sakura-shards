class ScansController < ApplicationController
  before_filter :reset_expiry

  def index
    @title = "Scanlations"
    @latest = Upload.find(:all, :order => 'id desc', :limit => 20)
  end

  def destroy
    redirect_to :action => 'index' if session[:user].nil?
    Upload.find(params[:id]).destroy
    redirect_to :action => 'index'
  end
end
