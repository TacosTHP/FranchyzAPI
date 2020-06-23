json.array! @clubs do |club|

  json.id club.id
  json.name club.name
  json.logo_url club.logo_url
  json.address club.address
  json.country club.country
  json.description club.description
  json.city club.city
  json.date_of_creation club.date_of_creation
  json.league club.league
  json.conference club.conference
  json.pool club.pool
  
  json.creator do
    json.id club.creator.id
    json.first_name club.creator.first_name
    json.last_name club.creator.last_name
    json.phone club.creator.phone
    json.birthdate club.creator.birthdate
    json.arrival club.creator.arrival
  end
end
