class EventsController < ApplicationController
  before_action :authenticate_user!, only: [:new, :create]
  before_action only: [:edit, :update, :destroy] do |controller|
    controller.check_if_admin
  end

  def index
    @events = Event.all
  end

  def show
    @event = Event.find(params[:id])
    @admin = User.find(@event.user_id)
    @end_date = @event.start_date + @event.duration * 60
  end

  def new
  end

  def create
    @event = Event.new(
      start_date: params[:start_date],
      duration: params[:duration],
      title: params[:title],
      description: params[:description],
      price: params[:price],
      location: params[:location],
      user_id: current_user.id)
    if @event.save
      flash[:success] = "Evénement bien créé !"
      redirect_to event_path(@event.id)
    else
      flash[:danger] = "Veuillez vérifier le formulaire !"
      render :new
    end
  end

  def edit
  end

  def update
  end

  def destroy
      Event.find(params[:id]).destroy
      flash[:success] = "Evénement supprimé !"
      redirect_to events_path
  end
end
