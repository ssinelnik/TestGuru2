# frozen_string_literal: true

Rails.application.routes.draw do
  root to: 'tests#index'

  devise_for :users, path: :gurus, 
                     path_names: { sign_in: :login, sign_out: :logout },
                     controllers: { sessions: 'sessions' }

  # get :signup, to: 'users#new'
  # get :login,  to: 'sessions#new'

  # resources :users, only: %i[create]
  # resource :sessions, only: %i[create destroy]

  resources :tests do
    resources :questions, shallow: true, except: [:index] do
      resources :answers, shallow: true, except: [:index]
    end
    post :start, on: :member
  end

  resources :test_passages, only: %i[show update] do
    member do
      get :result
    end
  end
end
