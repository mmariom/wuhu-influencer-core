class SellerMailer < ApplicationMailer

  def confirmation_instructions(user, otp)
    @user = user
    @otp = otp
    email = @user.email.presence || @user.unconfirmed_email
    mail(to: email, subject: "Your Otp")
  end
end