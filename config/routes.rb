Rails.application.routes.draw do
  devise_for :players
  devise_for :coaches

  resources :coaches, except:[:new, :create]
  resources :clubs do
    resources :teams do
      resources :practices
      resources :games
      resources :players do
        resources :events
        resources :emergency_contacts
      end
    end
  end

    # => ADDITIONNAL CLUB ROUTES
  get '/clubs/:id/admin',            to: 'club#dashboard_admin'

  # => ADDITIONNAL EVENTS ROUTES
  get '/clubs/:club_id/teams/:team_id/players/:player_id/mygames',                to: 'events#mygames'
  get '/clubs/:club_id/teams/:team_id/players/:player_id/mypractices',            to: 'events#mypractices'
end
