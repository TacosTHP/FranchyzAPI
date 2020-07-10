Rails.application.routes.draw do
  devise_for :players
  devise_for :coaches

  resources :coaches, except: [:new, :create, :destroy]
  resources :attendances
  resources :practices
  resources :games
  resources :clubs do
    resources :teams do
      resources :players, except: [:new, :create, :destroy] do
        resources :emergency_contacts
      end
    end
  end
end
