Spud::Core::Engine.routes.draw do
  scope :module => "spud" do
    resource :user_session
    resource :user
    match 'settings' => "users#settings"
    match 'save_key' => "users#save_setting"
    namespace :admin do
      root :to => "dashboard#index"
      resources :users
      match 'switch' => "dashboard#switch"
    end
    resource :sitemap,:only => [:show]
    resources :password_resets
    match 'setup' => 'setup#index'
  end
end

Rails.application.routes.draw do
  if Spud::Core.config.automount
    mount Spud::Core::Engine, :at => "/spud"
  end
end

