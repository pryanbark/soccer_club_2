# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

owner = Owner.new(email: "testowner@example.com", club_name: Faker::Team.name, password: "123123", password_confirmation: "123123")
owner.save

(1..30).each do |i|
  position = "attack"
  if i%3 == 0
    position = "middle"
  elsif i%2 == 0
    position = "defense"
  end
  email = "testplayer#{i}@example.com"
  owner_id = i<16 ? owner.id : nil
  Player.create(email: email, full_name: Faker::Name.name, is_available: true, position: position, owner_id: owner_id, password: "123123", password_confirmation: "123123")
end