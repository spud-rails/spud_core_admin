Rails.application.routes.draw do
   namespace :spud do
	   	resource :user_session
	   	resource :user
	   	match 'settings' => "users#settings"
   		namespace :admin do
   			root :to => "dashboard#index"
   			resources :users
   		end

	   	match 'setup' => 'setup#index'
   end
   
end

