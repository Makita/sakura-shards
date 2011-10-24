class ApplicationController < ActionController::Base
  protect_from_forgery

  before_filter :set_locale

  def set_locale
    I18n.default_locale = :en
    I18n.locale = params[:locale].to_sym unless params[:locale].nil?
  end

  def reset_expiry
    session[:expiry] = Time.now + 20.minutes unless session[:user].nil? or session[:expiry] < Time.now
    return true unless session[:user].blank? or session[:expiry] < Time.now
    reset_session
  end

  def logout
    reset_session
    redirect_to :controller => 'home', :action => 'index'
  end

  def default_url_options(options={})
    { :locale => I18n.locale }
  end
end
