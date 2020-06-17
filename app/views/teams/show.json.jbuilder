json.id @team.id
json.title @team.title
json.club do
  json.name @club.name
  json.logo_url @club.logo_url
  json.zip_code @club.zip_code
  json.address @club.address
  json.country @club.country
  json.description @club.description
  json.city @club.city
  json.date_of_creation @club.date_of_creation
  json.league @club.league
  json.conference @club.conference
  json.pool @club.pool
  json.creator do
    json.id @team.creator.id
    json.first_name @team.creator.first_name
    json.last_name @team.creator.last_name
    json.phone @team.creator.phone
    json.birthdate @team.creator.birthdate
    json.arrival @team.creator.arrival
  end
end
json.players @team.players, :id, :email, :first_name, :last_name, :phone, :birthdate, :arrival, :availability?, :height, :weight, :gender, :jersey_number, :position
json.games @games, :id, :title, :long_description, :address, :city, :country, :zip_code, :starting_date_time, :duration, :home_team_score, :away_team_score, :canceled
json.practices @practices, :id, :title, :long_description, :address, :city, :country, :zip_code, :starting_date_time, :duration, :canceled
