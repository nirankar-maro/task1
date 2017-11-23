Rails.application.routes.draw do
  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
  resources :galleries
  resources :contact_details,:except => [:new, :show, :delete,:edit,:update]
  devise_for :users, :skip => [:registration]
  root to: "static#index"
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
