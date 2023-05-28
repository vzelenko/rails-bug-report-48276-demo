Rails.application.routes.draw do
  namespace :real_estate do
    resources :deals do
      resources :payments, shallow: true
    end
  end
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  root "real_estate/deals#index"
end
