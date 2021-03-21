class ApplicationController < ActionController::Base
  # protect_from_forgery with: :exception
  protect_from_forgery with: :null_session

  ## Actions CallBack
  before_action :validate_token!

  include Admin::SessionsHelper

  def validate_token!
    flash[:error] = 'ير جى تسجيل الدخول !' and redirect_to(adminlogin_url) if !logged_in? || session[:token].nil?
  end
end
