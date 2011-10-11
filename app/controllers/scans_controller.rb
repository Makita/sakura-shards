class ScansController < ApplicationController
  def index
    @title = "Scanlations"
    @latest = Uploads.find(:all, :order => 'id desc', :limit => 10)
  end

  def download
  end
end
