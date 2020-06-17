json.array! @teams do |team|

  json.id team.id
  json.title team.title
  json.creator do
    json.id team.creator.id
    json.first_name team.creator.first_name
    json.last_name team.creator.last_name
    json.phone team.creator.phone
    json.birthdate team.creator.birthdate
    json.arrival team.creator.arrival
  end

  json.coach do
    json.id team.coach.id
    json.first_name team.coach.first_name
    json.last_name team.coach.last_name
    json.phone team.coach.phone
    json.birthdate team.coach.birthdate
    json.arrival team.coach.arrival
  end

end
