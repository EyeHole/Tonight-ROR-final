Rails.application.routes.draw do
  get 'add_visitor/event_registration'
  resources :events
  devise_for :users
  root :to => 'static_pages#home'
  get 'static_pages/home'
  get 'static_pages/profile'
  get 'static_pages/user_events'
  get 'static_pages/user_visitor'
  get 'static_pages/about'

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
