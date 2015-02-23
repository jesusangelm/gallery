Rails.application.routes.draw do

  resources :categories, only: [ :index, :show ] do
    resources :pictures, only: :show
  end

  root to: "categories#index"

end
