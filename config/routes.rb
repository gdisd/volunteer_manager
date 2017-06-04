Rails.application.routes.draw do
  resources :applications
  resources :events
  devise_for :users, controllers: { registrations: 'users/registrations', passwords: 'users/passwords', sessions: 'users/sessions' }
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  get '/about' => 'about#index'
  get '/dashboard' => 'dashboard#index'
  get '/dashboard/set_user_status_to_approved'
  get 'events/:id/add_ta' => 'events#add_ta'
  get 'events/:id/remove_ta' => 'events#remove_ta'
  get 'get_involved' => 'welcome#get_involved'
  root 'welcome#index'
end
