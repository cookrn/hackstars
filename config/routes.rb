Hackstars::Application.routes.draw do
  root :to => "static#home"

  namespace :api do
    namespace :v1 do
      match "lists/:remote_action" => "lists#remote" , :as => :remote_list
    end
  end

  resource :list   , :only => :show
  resources :users , :only => %w( edit update )

  match "auth/:provider/callback" => "auth#callback"
  match "auth/failure"            => "auth#failure"
  match "auth/logout"             => "auth#logout"
end
