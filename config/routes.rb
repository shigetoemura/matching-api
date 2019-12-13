Rails.application.routes.draw do
	namespace :api, defaults: { format: 'json' } do
		namespace :v1 do
			resource :sign_up, only: [:create]
			resources :users, only: [:show] do
				collection do
					get :search
					get :men
					get :women
				end
				member do
					post :report
					post :blocking
					resources :match_requests, only: [:create]
					resource :favorite, only: [:create, :destroy]
					resource :matches, only: [:create, :destroy]
				end
			end
			resource :me, only: [:show, :update] do
				collection do
					put :upload_image
					resources :favorites, only: [:index]
					resources :requests, only: [:index]
					resources :notifications, only: [:index]
					resources :matchs, only: [:index, :show] do
						resources :chats, only: [:create, :index]
					end
				end
			end
			resources :match_requests, only: [:show, :index] do
				member do
					post :accept
					post :skip
				end
			end
			resources :matches, only: [:index] do
	        	member do
	          		resources :chats, only: [:create, :index]
	        	end
	        end
		end
	end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
