class UsersController < ApplicationController
  before_action :authenticate_user!, only: [:show]

  def show
    @user = User.find(params[:id])
    @user_events = @user.events
    if current_user == @user
      render 'show'
    else
      redirect_to root_path
    end
  end
end
