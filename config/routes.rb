Rails.application.routes.draw do
  get 'reviews/new'
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
  resources :restaurants do
    resources :reviews, only: %i[new create]
  end
  resources :reviews, only: [:destroy]
end


# RestaurantsController
#   GET index
#     routes to #index (FAILED - 11)
#     assigns all restaurants as @restaurants (FAILED - 12)
#   GET show
#     routes to #show (FAILED - 13)
#     assigns the requested restaurant as @restaurant (FAILED - 14)
#   GET new
#     routes to #new (FAILED - 15)
#     assigns a new restaurant as @restaurant (FAILED - 16)
#   POST create
#     routes to #create (FAILED - 17)
#     with valid params
#       creates a new Restaurant (FAILED - 18)
#       assigns a newly created restaurant as @restaurant (FAILED - 19)
#       redirects to the created restaurant (FAILED - 20)
#     with invalid params
#       assigns a newly created but unsaved restaurant as @restaurant (FAILED - 21)
#       re-renders the 'new' template (FAILED - 22)
