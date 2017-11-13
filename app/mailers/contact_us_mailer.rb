class ContactUsMailer < ApplicationMailer
  def thankyou_email(user)
    @user = user

    mail(to: @user.email, subject: 'Thanks for your Time')
  end
end
