class ContactMailer < ApplicationMailer
  def send_mail(params)
    @params = params
    mail(
      to: 'adel@jisr.net',
      subject: 'Sending From SimpleBlog App!',
      from: params[:email],
      # reply_to: 'adelsaleh46@gmail.com',
      cc_to: 'adelsaleh46@gmail.com'
    )
  end
end
