Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  get 'riders', to: 'riders#index', as: 'riders'
  get 'riders/:id', to: 'riders#show', as: 'rider'
end
