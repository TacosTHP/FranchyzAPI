require 'faker'

Player.destroy_all
Coach.destroy_all
Game.destroy_all
Team.destroy_all
Club.destroy_all
Practice.destroy_all
Event.destroy_all
Emergency_contact.destroy_all

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
    password: "password", availiability?: Faker::Boolean.boolean(true_ratio: 0.8), height: Faker::Number.between(from: 170, to: 200), weight: Faker::Number.between(from: 70, to: 90), jersey_number: Faker::Number.between(from: 1, to: 99), position: Faker::Number.between(from: 1, to: 11), arrival: Faker::Date.backward(days: 60), gender: Faker::Gender.short_binary_type, team: Player.all.sample)
  end
    
  puts "Players have been created"

  5.times do
    Coach.create!(email: Faker::Internet.email, password: "password")
  end

  puts "Coaches have been created"
  2.times do
    Coach.create!(email: Faker::Internet.email, password: "password", first_name: Faker::Name.male_first_name, admin?: true)
  end
  puts "Coaches admin have been created"
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
    

  5.times do
    Team.create!(title: Faker::Team.name, creator: Coach.all.sample, coach: Coach.all.sample, club: Club.all.sample)
  end
    
  puts "Teams have been created"

  2.times do
    Club.create!(name: Faker::Sports::Football.team, creator: Coach.all.sample, logo_url: "logo", zip_code: Faker::Address.zip_code, street: Faker::Address.street_name, 
    street_number: Faker::Address.building_number, country: "France", description: Faker::Lorem.paragraph_by_chars(number: 600, supplemental: false), city: Faker::Address.city, date_of_creation: Faker::Date.backward(days: 14), league: Faker::Games::LeagueOfLegends.rank, pool: "pool", conference: "conference Sud")
  end
    
  puts "Clubs have been created"

5.times do
    Practice.create!(title: "training session", long_description: Faker::Lorem.paragraph_by_chars(number: 400, supplemental: false), duration: Faker::Number.between(from: 1, to: 3), zip_code: Faker::Address.zip_code, city: Faker::Address.city, country: "France", street: Faker::Address.street_name, street_number: Faker::Address.building_number, starting_date_time: Faker::Date.forward(days: 7), canceled: Faker::Boolean.boolean(true_ratio: 0.9))
  end
  puts "Practices have been created"  

  5.times do
    Emergency_contact.create!(first_name: Faker::Name.first_name, last_name: Faker::Name.last_name, phone: Faker::PhoneNumber.cell_phone, player: Player.all.sample)
  end
  puts "Emergency contacts have been created"  

  5.times do
    Event.create!(player: Player.all.sample, game: Game.all.sample, practice: Practice.all.sample)
  end
    
  puts "Events have been created"
