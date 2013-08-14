Todola::Application.routes.draw do
  devise_for :users
  root :to => 'places#index'
  resources :places
  resources :categories
end
