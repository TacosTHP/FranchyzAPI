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

puts "Destruction of BDD done"

5.times do
    Game.create!(title: Faker::Sports::Football.competition, long_description: Faker::Lorem.paragraph_by_chars(number: 1400, supplemental: false),
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

#add club_id to coach
# first_name: Faker::Name.male_first_name, 
# first_name: Faker::Name.male_first_name, last_name: Faker::Name.last_name,
# phone: Faker::PhoneNumber.cell_phone
# birthdate: Faker::Date.birthday(min_age: 20, max_age: 79)
# arrival: Faker::Date.backward(days: 60)
# admin?: Faker::Boolean.boolean
    
  puts "Coaches have been created"
