require 'pry'

class UserMailer < ApplicationMailer
  default from: 'tony.stark@yopmail.com'

  def welcome_email(user)
    @user = user
    @url = 'https://eventbrite-12052020.herokuapp.com/users/sign_in'
    mail(to: @user.email, subject: 'Bienvenue chez Eventbrite !')
  end

  def attendance_email(attendance)
    @event = attendance.event
    @user = attendance.user
    binding.pry
    @admin = User.find(@event.user_id)
    mail(to: @admin.email, subject: "Nouvelle inscription à ton événement !")
  end
end
