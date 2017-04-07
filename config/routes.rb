Rails.application.routes.draw do
    root 'welcome#index', as: 'welcome'
    resources :drivers
    resources :riders
    resources :trips, only: [:show, :edit, :destroy, :update]

    post 'riders/:id/new_trip', to: 'riders#new_trip', as: 'new_trip'
    patch 'trips/:id/update_rating', to: 'trips#update_rating', as: 'update_rating'
end
