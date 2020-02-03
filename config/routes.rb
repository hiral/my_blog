Rails.application.routes.draw do
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
