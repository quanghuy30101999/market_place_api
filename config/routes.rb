require "api_constraints"

MarketPlaceApi::Application.routes.draw do
  namespace :api, defaults: { format: :json }, path: "/" do
    scope module: :v1, constraints: ApiConstraints.new(version: 1, default: true) do
      resources :sessions, :only => [:create, :destroy]
      devise_for :users
      resources :users, :only => [:show, :create, :update, :destroy, :index]
    end
  end
end
