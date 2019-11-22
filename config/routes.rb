Rails.application.routes.draw do
	namespace :api, defaults: { format: 'json' } do
		namespace :v1 do
			resource :sign_up, only: [:create]
			resources :users, only: [:show] do
				collection do
					get :search
					get :men
					get :women
					resource :chatrooms, only: [:create]
				end
				member do
					post :report
					post :blocking
					resources :requests, only: [:create]
					resource :favorites, only: [:create, :destroy]
				end
			end
			resource :me, only: [:show, :update] do
				collection do
					put :upload_image
					resources :favorites, only: [:index]
					resources :requests, only: [:index]
					resources :notifications, only: [:index]
					resources :chatrooms, only: [:index, :show] do
						resources :messages, only: [:create, :index]
					end
				end
			end
			resources :requests, only: [:show] do
				member do
					post :accept
					post :skip
				end
			end
		end
	end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
