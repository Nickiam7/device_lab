Rails.application.routes.draw do
	devise_for :users
	resources :users
	resources :links, except: [:show]

	root to: "links#index"
end
