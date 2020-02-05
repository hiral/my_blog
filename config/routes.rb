Rails.application.routes.draw do
<<<<<<< HEAD
  devise_for :login_users, controllers: { sessions: 'login_users/sessions', registrations: "login_users/registrations", passwords: "login_users/passwords" }
=======
>>>>>>> master
  root 'users#index'
  resources :cities
  resources :states
  resources :countries
  resources :users do
  	collection do
  		post "get_states_from_country", to: "users#get_states_from_country", as: :get_states_from_country
  	end
    resources :posts do
    	resources :comments
    end
  end
end
