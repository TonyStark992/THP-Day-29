module AttendancesHelper

  def check_if_admin
    puts "$" * 60
    puts "Je suis dans la méthode check_if_admin de AttendancesHelper"
    puts "$" * 60
    @event = Event.find(params[:event_id])
    unless @event.user_id == current_user.id
      flash[:danger] = "Action impossible : Tu n'es pas l'organisateur de cet événement !"
      redirect_to @event
    end
  end

end
