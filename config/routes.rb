Rails.application.routes.draw do
  resources :events
  devise_for :users, controllers: { registrations: 'users/registrations', passwords: 'users/passwords', sessions: 'users/sessions' }
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  get 'about/index'
  get '/dashboard' => 'dashboard#index'
  get 'events/:id/add_ta' => 'events#add_ta'
  root 'welcome#index'
end
