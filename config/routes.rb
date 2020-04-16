require "api_constraints"

MarketPlaceApi::Application.routes.draw do
  # devise_for :users
  devise_for :users, path: "auth", path_names: { sign_in: "login", sign_out: "logout", password: "secret", confirmation: "verification", unlock: "unblock", registration: "register", sign_up: "cmon_let_me_in" }
  namespace :api, defaults: { format: :json }, path: "/" do
    scope module: :v1, constraints: ApiConstraints.new(version: 1, default: true) do
      resources :users, :only => [:show, :create, :update, :destroy, :index]
    end
  end
end
