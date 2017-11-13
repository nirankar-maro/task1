class ContactEmail

  def thankyou_mail(user)
      ContactUsMailer.thankyou_email(user).deliver_now
  end
end
