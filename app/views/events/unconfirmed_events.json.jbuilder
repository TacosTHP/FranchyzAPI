json.array! @events do |event|

  json.id event.id

  if event.practice_id != nil
    json.title event.practice.title
    json.start event.practice.starting_date_time
    json.type "Practice"
  end

  if event.game_id != nil
    json.title event.game.title
    json.start event.game.starting_date_time
    json.type "Game"
  end

end
