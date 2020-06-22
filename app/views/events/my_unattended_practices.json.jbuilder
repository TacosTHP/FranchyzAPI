json.array! @my_unattended_practices do |practice|

  json.id practice.id
  json.title practice.title
  json.start practice.starting_date_time

  json.description practice.long_description
  json.address practice.address
  json.city practice.city
  json.country practice.country
  json.zip_code practice.zip_code
  json.duration practice.duration
  json.canceled practice.canceled

  json.color '#ffa800'

end
