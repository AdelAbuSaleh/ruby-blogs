module Admin::SessionsHelper
  # Logs in the given user.
  def save_token(token)
    session[:token] = token
  end

  # Returns the current logged-in user (if any).
  def current_user
    @current_user ||= AdminUser.find(decoded_auth_token['id']) if decoded_auth_token
    # @current_user ||= User.find_by(id: 1)
  end

  # Returns true if the user is logged in, false otherwise.
  def logged_in?
    !current_user.nil?
  end

  # decode authentication token
  def decoded_auth_token
    @decoded_auth_token ||= JsonWebToken.decode(session[:token])
  rescue
    nil
  end

  # Logs out the current user.
  def log_out
    session.delete(:token)
    @current_user = nil
  end
end
