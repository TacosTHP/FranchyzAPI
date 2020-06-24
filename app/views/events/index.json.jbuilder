
json.array! @confirmed_events do |event|

  json.id event.id

  if event.practice_id != nil
    json.title event.practice.title
    json.start event.practice.starting_date_time
    json.type "Practice"
    json.backgroundColor '#ffa800'
    json.borderColor '#ffa800'
    json.textColor '#ffffff'

  end

  if event.game_id != nil
    json.title event.game.title
    json.start event.game.starting_date_time
    json.type "Game"
    json.backgroundColor '#d741a5'
    json.borderColor '#d741a5'
    json.textColor '#ffffff'
  end
end

json.array! @unconfirmed_events do |event|

  json.id event.id

  if event.practice_id != nil
    json.title event.practice.title
    json.start event.practice.starting_date_time
    json.type "Practice"
    json.backgroundColor '#ffffff'
    json.borderColor '#ffa800'
    json.textColor '#ffa800'
  end

  if event.game_id != nil
    json.title event.game.title
    json.start event.game.starting_date_time
    json.type "Game"
    json.backgroundColor '#ffffff'
    json.borderColor '#d741a5'
    json.textColor '#d741a5'
  end

end
