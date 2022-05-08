Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"

  resources :plants do 
    match '/scrape', to: 'plants#scrape', via: :post, on: :collection
  end

  root to: 'plants#index'
end
