# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

require 'faker'

Player.destroy_all
Coach.destroy_all
Game.destroy_all
Team.destroy_all
Club.destroy_all
Practice.destroy_all
Event.destroy_all
# Emergency_contact.destroy_all

puts "Destruction of BDD done"

5.times do
    Game.create!(title: Faker::Sports::Football.competition, long_description: Faker::Lorem.paragraph_by_chars(number: 400, supplemental: false),
zip_code: Faker::Address.zip_code, country: "France", street: Faker::Address.street_name, 
    street_number: Faker::Address.building_number, starting_date_time: Faker::Date.forward(days: 10), duration: Faker::Number.between(from: 1, to: 3), home_team_score: Faker::Number.between(from: 0, to: 100), 
    away_team_score: Faker::Number.between(from: 0, to: 100), canceled: Faker::Boolean.boolean(true_ratio: 0.9))
  end
  
  puts "Games have been created"

  5.times do
    Player.create!(first_name: Faker::Name.male_first_name, last_name: Faker::Name.last_name, email: Faker::Internet.email, phone: Faker::PhoneNumber.cell_phone, birthdate: Faker::Date.birthday(min_age: 15, max_age: 65),
    password: "password", availiability?: Faker::Boolean.boolean(true_ratio: 0.8), height: Faker::Measurement.height, weight: Faker::Measurement.metric_weight, jersey_number: Faker::Number.between(from: 1, to: 99), position: Faker::Number.between(from: 1, to: 11), arrival: Faker::Date.backward(days: 60))
  end
    
  puts "Players have been created"

  5.times do
    Coach.create!(email: Faker::Internet.email, password: "password")
  end


  2.times do
    Coach.create!(email: Faker::Internet.email, password: "password", first_name: Faker::Name.male_first_name, admin?: Faker::Boolean.boolean)
  end
# joseadmin = Coach.create(email:"jose@admin.de", password: "password")
# joseadmin.first_name = "jose"
# joseadmin.admin? = true

# raf = Coach.create(email:"raf@admin.de", password: "password")
# raf.first_name = "raf"
# raf.admin? = true

#add club_id to coach
# first_name: Faker::Name.male_first_name, last_name: Faker::Name.last_name,
# phone: Faker::PhoneNumber.cell_phone
# birthdate: Faker::Date.birthday(min_age: 20, max_age: 79)
# arrival: Faker::Date.backward(days: 60)
# admin?: Faker::Boolean.boolean
    
  puts "Coaches have been created"

  #wait for coach merge
   #club: Club.all.sample
  5.times do
    Team.create!(title: Faker::Team.name, creator: Coach.all.sample, coach: Coach.all.sample)
  end
    
  puts "Teams have been created"

  2.times do
    Club.create!(name: Faker::Sports::Football.team, creator: Coach.all.sample, logo_url: "logo", zip_code: Faker::Address.zip_code, description: Faker::Lorem.paragraph_by_chars(number: 600, supplemental: false), city: Faker::Address.city, date_of_creation: Faker::Date.backward(days: 14), league: Faker::Games::LeagueOfLegends.rank, pool: "pool", conference: "conference Sud")
  end
    
  puts "Clubs have been created"

#add address fields
puts "Practice have been created"
5.times do
    Practice.create!(duration: Faker::Number.between(from: 1, to: 3), zip_code: Faker::Address.zip_code, city: Faker::Address.city, starting_date_time: Faker::Date.forward(days: 7))
  end
    
  

#   5.times do
#     Event.create!(duration: Faker::Number.between(from: 1, to: 3), zip_code: Faker::Address.zip_code, city: Faker::Address.city, starting_date_time: Faker::Date.forward(days: 7))
#   end
    
#   puts "Event have been created"
