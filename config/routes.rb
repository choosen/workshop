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
  get 'report/subjects', to: 'reports#subjects'
  #resources :reports, as: 'report'
end
