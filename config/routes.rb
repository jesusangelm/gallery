Rails.application.routes.draw do

  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
  resources :categories, only: [ :index, :show ] do
    resources :pictures, only: :show
  end

  root to: "categories#index"

end
