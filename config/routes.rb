Rails.application.routes.draw do
  get 'landings/index'
  get 'resume' => 'landings#resume'
  root 'landings#index'

  resources :user_settings
  devise_for :users, controllers: {
      registrations: "users/registrations",
      sessions: "users/sessions",
      passwords: "users/passwords"
    }, skip: [
      :sessions,
      :registrations
    ]

  #->Prelang (user_login:devise/stylized_paths)
  devise_scope :user do
    get    "login"   => "users/sessions#new",         as: :new_user_session
    post   "login"   => "users/sessions#create",      as: :user_session
    delete "signout" => "users/sessions#destroy",     as: :destroy_user_session

    get    "signup"  => "users/registrations#new",    as: :new_user_registration
    post   "signup"  => "users/registrations#create", as: :user_registration
    put    "signup"  => "users/registrations#update", as: :update_user_registration
    get    "account" => "users/registrations#edit",   as: :edit_user_registration
  end


  # API_SLUG APP
  namespace :api_slug do
    resources :api_keys do
      member do
        post :reset
      end
    end
  end
  resources :api_slug
  # END API_SLUG
  resources :converters, only: [:index] do
    collection do
      post :xml
    end
  end

end
