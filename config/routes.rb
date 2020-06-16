Rails.application.routes.draw do
<<<<<<< HEAD
  resources :games
=======
  devise_for :players
>>>>>>> 5907a25935d3f7d314218d22afa0f04c8cf535ef
  devise_for :coaches
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

    # => ADDITIONNAL GAMES ROUTES
    get '/mygames',            to: 'games#mygames'
end
