Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"

  root                to: 'home#index'
  #get 'receitas/:id', to: 'recipes#show', as: 'recipe'
  resources :recipes do
    patch :publish, on: :member 
  end



  resources :recipe_types, only: [:new, :create]
  
  get '/draft', to: 'home#draft'

end
