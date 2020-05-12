class UserMailer < ApplicationMailer
  default from: 'tony.stark@yopmail.com'

  def welcome_email(user)
    @user = user
    @url = 'https://eventbrite-12052020.herokuapp.com/users/sign_in'
    mail(to: @user.email, subject: 'Bienvenue chez Eventbrite !')
  end
end
