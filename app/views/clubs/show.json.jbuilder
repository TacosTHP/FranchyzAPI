json.id @club.id
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
json.games @games do |game|
  json.title game.title
  json.start game.starting_date_time
  json.end game.starting_date_time + game.duration*60
  json.backgroundColor '#d741a5'
  json.borderColor '#d741a5'
  json.textColor '#ffffff'
  json.allDay false
end
json.practices @practices do |practice|
  json.title practice.title
  json.start practice.starting_date_time
  json.end practice.starting_date_time + practice.duration*60
  json.backgroundColor '#ffa800'
  json.borderColor '#ffa800'
  json.textColor '#ffffff'
  json.allDay false
end
json.players @players
json.teams @teams
