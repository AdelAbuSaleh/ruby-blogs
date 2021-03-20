class HomePagesController < ApplicationController
  skip_before_action :validate_token!

  # GET /home_pages/home
  def home
    @posts = Post.all.includes(:category).limit(5)
  end

  def about; end

  def new
    @contact_mailer = ContactMailer.new
  end

  def contact
    @user_mailer = V1::Contact::ParamsValidation.new(contact_params)
    respond_to do |format|
      if @user_mailer.valid?
        ContactMailer.send_mail(contact_params).deliver_later
        flash[:success] = "Thank you for your message! We'll get contact you soon!"
        format.html { render :new }
        format.js { render inline: "location.reload();" }
        format.json { render :show, status: :created, location: @user_mailer }
      else
        flash.now[:error] = 'Please check the form and resubmit.'
        format.html { render :new, notice: @user_mailer.errors.full_messages }
        format.js { render inline: "location.reload();" } 
        format.json { render json: @user_mailer.errors, status: :unprocessable_entity }
      end
    end
  end

  private

  def contact_params
    params.permit(:name, :email, :message)
  end
end
