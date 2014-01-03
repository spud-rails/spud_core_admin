Rails.application.routes.draw do
   namespace :spud do
	   	resource :user_session
	   	resource :user
	   	get 'settings' => "users#settings"
         get 'save_key' => "users#save_setting"
   		namespace :admin do
   			root :to => "dashboard#index"
   			resources :users

            get  'switch' => "dashboard#switch"
            post 'switch' => "dashboard#switch"
   		end
         resource :sitemap,:only => [:show]
         resources :password_resets
	   	get 'setup' => 'setup#index'
         post 'setup' => 'setup#index'
   end

end

