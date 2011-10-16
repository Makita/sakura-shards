class ApplicationController < ActionController::Base
  protect_from_forgery

  def reset_expiry
    session[:expiry] = Time.now + 20.minutes unless session[:user].nil? or session[:expiry] < Time.now
    return true unless session[:user].blank? or session[:expiry] < Time.now
    reset_session
  end
end
