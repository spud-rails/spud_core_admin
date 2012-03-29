Rails.application.routes.draw do
   namespace :spud do
	   	resource :user_session
	   	resource :user
	   	match 'settings' => "users#settings"
   		namespace :admin do
   			root :to => "dashboard#index"
   			resources :users
            match 'switch' => "dashboard#switch"
   		end
         resource :sitemap,:only => [:show]
	   	match 'setup' => 'setup#index'
   end
   
end

