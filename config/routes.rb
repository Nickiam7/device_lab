Rails.application.routes.draw do
	devise_for :users
	resources :users
	resources :links, except: [:show]
	resources :brands, except: [:show]

	root to: "links#index"
end
