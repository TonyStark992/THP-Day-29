class UserMailer < ApplicationMailer
  default from: 'tony.stark@yopmail.com'

  def welcome_email(user)
    @user = user
    @url = 'http://eventbrite-12052020.herokuapp.com/login'
    mail(to: @user.email, subject: 'Bienvenue chez Eventbrite !')
  end
end
