class ScansController < ApplicationController
  before_filter :reset_expiry

  def index
    @title = "Scanlations"
    @latest = Upload.find(:all, :order => 'id desc', :limit => 20)
  end

  def download
  end
end
