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
json.teams @teams do |team|
  json.id team.id
  json.title team.title
  json.creator_id team.creator_id
  json.club_id team.club_id
  json.coach team.coach
  json.players team.players
  json.attendances team.retrieve_attendances
end
