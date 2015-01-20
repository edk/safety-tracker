Rails.application.routes.draw do
  resources :test_runs, only: [ :index, :show, :create, :destroy ]

end
