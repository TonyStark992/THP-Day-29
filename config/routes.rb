Rails.application.routes.draw do
  devise_for :users
  get 'events/index'
  get 'events/show'
  get 'events/new'
  get 'events/create'
  get 'events/edit'
  get 'events/update'
  get 'events/destroy'
  root 'events#index'
  get 'events/index'
end
