Rails.application.routes.draw do

  #note that site is the namespace, home is the controller, index is the action
  root :to => "site/home#index"

  devise_for :users, :path => '', :controllers => {:sessions => 'sessions', :registrations => 'registrations'}, :path_names => { :sign_in => 'login', :password => 'forgot', :confirmation => 'confirm', :unlock => 'unblock', :registration => 'register', :sign_up => 'new', :sign_out => 'logout'}
  as :user do
    # get 'register', :to => 'devise/registrations#new'
    delete 'logout', :to => 'sessions#destroy'
  end
  

  namespace :admin do 
    resources :posts
    resources :users
    resources :students
    get 'settings', to: 'settings#index'
  end

  get 'who_passed', to: 'site/who_passed#index'
end
