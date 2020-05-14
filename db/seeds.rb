require 'faker'

User.destroy_all
Event.destroy_all
Attendance.destroy_all

puts "Seeding database"

# Génération des users
5.times do
  first_name = Faker::Name.first_name
  last_name = Faker::Name.last_name
  User.create!(
    email: "#{first_name}@yopmail.com",
    first_name: first_name,
    last_name: last_name,
    description: Faker::Lorem.paragraph(sentence_count: 5),
    password: first_name+"."+last_name)
end
puts "-> some users have been generated "

# Génération des events
10.times do
  event = Event.create!(
    start_date: Time.now+(rand(1..9999)*3600),
    duration: 5 * rand(1..50),
    title: Faker::DcComics.title,
    description: Faker::Lorem.paragraph(sentence_count: 8),
    price: rand(1..1000),
    location: Faker::Address.city,
    user_id: User.all.sample.id)
end
puts "-> some events have been generated "

# Génération des attendances
5.times do
  attendance = Attendance.new
  attendance.user = User.all.sample
  attendance.event = Event.all.sample
  attendance.stripe_customer_id = 0
  attendance.save
end
puts "-> some attendances have been generated "

puts "Done !"