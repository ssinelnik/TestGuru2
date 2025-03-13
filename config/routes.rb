# frozen_string_literal: true

Rails.application.routes.draw do
  root 'tests#index'

  devise_for :users, path: :gurus, path_names: { sign_in: :login, sign_out: :logout },
                     controllers: { sessions: 'sessions' }

  # destroy_user_session DELETE /users/sign_out(.:format) devise/sessions#destroy

  # Паша
  # devise_for :users, path: :gurus, controllers: { sessions: 'sessions' }

  # devise_scope :user do
  #  get "signup", to: "devise/registrations#new"
  #  get "login", to: "devise/sessions#new"
  #  get "logout", to: "devise/sessions#destroy"
  # end

  # delete '/gurus/logout', to: 'sessions#destroy', as: :destroy_user_session
  # get '/gurus/logout', to: 'sessions#destroy', as: :guru_logout

  # get "logout", to: "devise/sessions#destroy"

  resources :tests, only: :index do
    post :start, on: :member
  end

  resources :gists, only: :create

  resources :test_passages, only: %i[show update] do
    member do
      get :result
    end
  end

  namespace :admin do
    resources :gists, shallow: true, only: :index
    resources :tests do
      patch :update_inline, on: :member

      resources :questions, shallow: true, except: [:index] do
        resources :answers, shallow: true, except: [:index]
      end
    end
  end
end
