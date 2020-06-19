Rails.application.routes.draw do
  devise_for :players
  devise_for :coaches

  resources :players, except:[:new, :create]
  resources :coaches, except:[:new, :create]
  resources :clubs do
    resources :teams do
      resources :events
      resources :practices
      resources :games
      resources :players do
        resources :emergency_contacts
      end
    end
  end

  # => ADDITIONNAL GAMES ROUTES
  get '/mygames',            to: 'games#mygames'

  # => ADDITIONNAL CLUB ROUTES
  get '/clubs/:id/admin',            to: 'club#dashboard_admin'
end
