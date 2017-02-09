Rails.application.routes.draw do

  resources :visualisations
  
  root 'home#index'
end
