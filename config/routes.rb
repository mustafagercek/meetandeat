Rails.application.routes.draw do

  get "/pages/:page" => "pages#show"

  resources :bo_tasks
  resources :participants
  post "/login" => "application#check"


  Rails.application.routes.draw do
    namespace :api, :defaults => {:format => :json} do

      resources :tasks

    end
  end

end
