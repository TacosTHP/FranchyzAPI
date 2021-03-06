json.array! @games do |game|

  json.id game.id
  json.title game.title
  json.start game.starting_date_time
  json.description game.long_description
  json.address game.address
  json.city game.city
  json.country game.country
  json.zip_code game.zip_code
  json.duration game.duration
  json.home_team_score game.home_team_score
  json.away_team_score game.away_team_score
  json.canceled game.canceled

  json.players game.players, :id, :email, :first_name, :last_name, :phone, :birthdate, :arrival, :availability?, :height, :weight, :gender, :jersey_number, :position, :team

end
