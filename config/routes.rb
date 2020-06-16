Rails.application.routes.draw do
  devise_for :players
  devise_for :coaches

  resources :coaches
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
end
