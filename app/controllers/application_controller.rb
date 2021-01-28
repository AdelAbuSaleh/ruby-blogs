class ApplicationController < ActionController::Base
  # protect_from_forgery with: :exception
  protect_from_forgery with: :null_session

  ## Actions CallBack
  before_action :validate_token!

  include Admin::SessionsHelper

  def validate_token!
    # flash[:error] = 'ير جى تسجيل الدخول !'
    # return redirect_to root_url if session[:token].nil?
    # @token = AuthenticateRequest.get(User, session[:token])
    # flash[:error] = 'ير جى تسجيل الدخول !' unless @token
    # redirect_to(root_url) && return if @token[:user].nil?
    # set_curret_user
  end

  def set_curret_user
    @current_user = @token[:user]
  end
end
