class Admin::SessionsController < ApplicationController
  skip_before_action :validate_token!

  # GET /admin/sessions/new
  def new; end

  # POST /admin/sessions
  # POST /admin/sessions.json
  def create
    respond_to do |format|
      if authorized_user?
        token = generate_token(user)
        save_token(token)
        flash[:success] = 'You are logined successfully., Welcome back'
        format.html { redirect_to(root_url, notice: 'You are logined successfully.') }
        # format.js { render inline: "location.reload();" }
        format.js { render(js: "window.location = '/'") }
        format.json { render(:show, status: :created, location: user) }
      else
        flash[:success] = 'Invalid Login Check your creduntionls or you are not authorized'
        format.html { redirect_to(adminlogin_url, alert: 'خطأ في التسجيل.') }
        format.js { render(inline: 'location.reload();') }
        format.json { render(json: user.errors, status: :unprocessable_entity) }
      end
    end
  end

  # DELETE /admin/sessions/1
  # DELETE /admin/sessions/1.json
  def destroy
    log_out
    redirect_to(root_url, notice: 'Goodbye, I wish you a good time.')
  end

  private

  def authorized_user?
    user&.authenticate(params[:password])
  end

  def user
    @user ||= AdminUser.find_by('user_name =:login OR email =:login', login: params[:login])
  end

  # Session Meta Payload (token )
  def generate_token(_user)
    JsonWebToken.encode(login_payload, 3.days.from_now)
  end

  # JWT payload
  def login_payload
    { id: user.id, user_name: user.user_name }
  end

  # Only allow a list of trusted parameters through.
  def session_params
    params.permit(:login, :password)
  end
end
