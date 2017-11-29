Rails.application.routes.draw do
  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
  resources :galleries
  resources :contact_details,:except => [:new, :show, :delete,:edit,:update]
  devise_for :users, :skip => [:registration]
  as :user do
    get 'users/edit' => 'devise/registrations#edit', :as => 'edit_user_registration'
    put 'users' => 'devise/registrations#update', :as => 'user_registration'
  end

  root to: "static#index"

    namespace :api do
        namespace :v1 do
         post 'contact_us' => 'contact_details#create'
         post 'user_create' => 'user#create'
       end
     end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
