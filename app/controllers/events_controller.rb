class EventsController < ApplicationController
  before_action :authenticate_user!, only: [:new, :create]

  def index
    @events = Event.all
  end

  def show
  end

  def new
  end

  def create
    @event = Event.new(start_date: params[:start_date], duration: params[:duration], title: params[:title], description: params[:description], price: params[:price], location: params[:location])
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
  end
end
