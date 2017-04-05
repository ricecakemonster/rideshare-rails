Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :riders

  post 'riders/:id/new_trip', to: 'riders#new_trip', as: 'new_trip'
end
