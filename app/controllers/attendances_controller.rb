class AttendancesController < ApplicationController
  def index
  end

  def create
    @event = Event.find(params[:event_id])

    # Prix en centimes
    @amount = @event.price * 100

    customer = Stripe::Customer.create({
      email: params[:stripeEmail],
      source: params[:stripeToken],
    })

    charge = Stripe::Charge.create({
      customer: customer.id,
      amount: @amount,
      description: "Paiement de #{current_user.first_name} #{current_user.last_name}",
      currency: 'eur',
    })

    @attendance = Attendance.new(
      stripe_customer_id: customer.id,
      user_id: current_user.id,
      event_id: params[:event_id])
    @attendance.save

    flash[:success] = "Félicitations, tu es inscrit pour participer à l'événement !"
    redirect_to @event

    rescue Stripe::CardError => e
      flash[:error] = e.message
      redirect_to @event

  end

  def edit
  end

  def update
  end

  def destroy
  end
end
