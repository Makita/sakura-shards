class HomeController < ApplicationController
  def index
    @title = "Light Shrouded in Darkness"
    render 'index'
  end

  def faw
    @title = "FAQ"
    render 'index'
  end
end
