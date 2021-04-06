Rails.application.routes.draw do
  resources :projects
  devise_for :users
  root 'welcome#index'
  get '/projects' => 'project#index', :as => :user_root
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
