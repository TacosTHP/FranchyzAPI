json.array! @teams do |team|

  json.id team.id
  json.title team.title
  json.creator team.creator do |creator|
    json.id creator.id
    json.first_name creator.first_name
    json.last_name creator.last_name
    json.phone creator.phone
    json.birthdate creator.birthdate
    json.arrival creator.arrival
  end

  json.coach team.coach do |coach|
    json.id coach.id
    json.first_name coach.first_name
    json.last_name coach.last_name
    json.phone coach.phone
    json.birthdate coach.birthdate
    json.arrival coach.arrival
  end

end
