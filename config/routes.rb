Rails.application.routes.draw do
  root 'tests#index'

  get "up" => "rails/health#show", as: :rails_health_check

  resources :tests do
    resources :questions, shallow: true
  end
end
