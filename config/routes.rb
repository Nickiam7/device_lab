Rails.application.routes.draw do
	devise_for :users
	resources :users
	resources :links, except: [:show]
	resources :brands

	root to: "links#index"
end
