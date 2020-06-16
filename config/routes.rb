Rails.application.routes.draw do
  resources :practices
  resources :emergency_contacts
  devise_for :coaches
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
