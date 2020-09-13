Rails.application.routes.draw do

  scope 'api/v1', :defaults => { :format => 'json' } do
    devise_for :players
    devise_for :coaches
  end

  namespace :api do
    namespace :v1 do
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
  end
end
