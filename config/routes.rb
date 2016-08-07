Rails.application.routes.draw do
  devise_for :users
  get 'visitors/index'
  root to: 'visitors#index'
  resources :students do
    get :subjects
  end
  resources :teachers do
    get :subjects
  end
  get 'reports/subjects', to: 'reports#subjects'
end
