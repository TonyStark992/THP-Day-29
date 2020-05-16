module ApplicationHelper

    def check_if_admin
      if params[:id]
        @event = Event.find(params[:id])
      elsif params[:event_id]
        @event = Event.find(params[:event_id])
      end
      unless @event.user_id == current_user.id
        flash[:danger] = "Action impossible : Tu n'es pas l'organisateur de cet événement !"
        redirect_to @event
      end
    end

end
