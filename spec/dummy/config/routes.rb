Rails.application.routes.draw do

  # mount SpudCore::Engine => "/spud_core"
    root :to => "pages#show", :id => "home"
end
