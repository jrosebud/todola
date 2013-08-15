Todola::Application.routes.draw do
  devise_for :users
  root :to => 'places#index'
  resources :places
  resources :categories
  resources :areas
  post "/search", to: "places#search", as: "place_search" 
end
