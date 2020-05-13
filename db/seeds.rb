require 'faker'

# Génération de 10 users
# 10.times do
#   user = User.create!(first_name: Faker::Name.first_name, last_name: Faker::Name.last_name, description: Faker::TvShows::GameOfThrones.quote, email: Faker::Internet.email(domain: 'yopmail.com'), password: Faker::Lorem.characters(number: 10))
# end

# Bornes dates_times
d1 = Time.now + 36000
d2 = d1 + 36000000

# Génération de 10 events
10.times do
  event = Event.create!(
    start_date: rand(d1..d2),
    duration: 5 * rand(1..100),
    title: Faker::Lorem.sentence(word_count: 3),
    description: Faker::Lorem.paragraph(sentence_count: 8),
    price: rand(1..1000),
    location: Faker::Address.city,
    )
end
