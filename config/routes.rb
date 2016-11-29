Rails.application.routes.draw do
	devise_for :users
	get "/users/admin", to: "users#admin", as: :admin
	resources :users
	resources :links, except: [:show]
	resources :brands, except: [:show]

	root to: "links#index"
end
