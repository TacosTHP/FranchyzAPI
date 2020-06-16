json.extract! game, :id, :title, :description, :street, :street_number, :country, :zip_code, :starting_date_time, :duration, :home_team_score, :away_team_score, :canceled, :created_at, :updated_at
json.url game_url(game, format: :json)
