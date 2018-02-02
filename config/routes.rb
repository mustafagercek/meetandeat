Rails.application.routes.draw do

  get "/pages/:page" => "pages#show"

  resources :bo_tasks
  post "/login" => "application#check"


  Rails.application.routes.draw do
    namespace :api, :defaults => {:format => :json} do

      resources :participants
      resources :tasks
      resources :attendances
      resources :preferences
      resources :roles
      resources :noshows

    end
  end

end
