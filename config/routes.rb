Rails.application.routes.draw do
  resources :contact_details,:except => [:new, :show, :delete,:edit,:update]
  devise_for :users
  root to: "static#index"
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
