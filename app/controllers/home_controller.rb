class HomeController < ApplicationController
  def index
    @title = "Light Shrouded in Darkness"
    render 'index'
  end

  def faq
    @title = "FAQ"
  end

  def search
    array = Uploads.explode(params[:search])
    @search = Uploads.search do
      fulltext array.first unless array.first.blank?
      with :volume, array.second.first.to_i unless array.second.first.blank?
      with :chapter, array.second.second.to_i unless array.second.second.blank?
      order_by :created_at, :desc
      paginate :per_page => 20, :page => params[:page]
    end
  end
end
