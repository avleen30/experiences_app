require 'faker'
require 'date'
# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

puts "Seeding Data ..."


# Let's do this ...

## CATEGORIES

Category.destroy_all

puts "Finding or Creating Categories ..."

cat1 = Category.find_or_create_by! name: 'Trip'
cat2 = Category.find_or_create_by! name: 'Drinks'
cat3 = Category.find_or_create_by! name: 'Party'
cat4 = Category.find_or_create_by! name: 'Coffee'
cat5 = Category.find_or_create_by! name: 'Sports'
cat6 = Category.find_or_create_by! name: 'Walk'
cat7 = Category.find_or_create_by! name: 'Meal'
cat8 = Category.find_or_create_by! name: 'Photography'
cat9 = Category.find_or_create_by! name: 'Art'
cat10 = Category.find_or_create_by! name: 'Cultural'
cat11 = Category.find_or_create_by! name: 'Cooking'
cat12 = Category.find_or_create_by! name: 'Games'
cat13 = Category.find_or_create_by! name: 'Shopping'
cat14 = Category.find_or_create_by! name: 'Others'

puts "Clearing old data...."

EventsUser.destroy_all
User.destroy_all
Event.destroy_all

## USERS

puts "Creating users...."

100.times do
  u=User.new
  u.first_name = Faker::Name.first_name
  u.last_name = Faker::Name.last_name
  u.email = Faker::Internet.email
  u.password = '123'
  u.password_confirmation = '123'
  u.avatar = Faker::Avatar.image
  gender_array = ["Male", "Female"]
  u.gender = gender_array.shuffle.sample
  u.save
end

## EVENTS

puts "Creating Events ..."

event1 = cat1.events.create!({
  name: "Hike",
  description: "Going for a hike!",
  cover_img: Faker::Avatar.image,
  start_date: DateTime.new(2017,rand(9..12),rand(1..30)),
  time: rand(0000..2359),
  lat: 43.621441,
  lng: -79.395799,
  creator_id: User.all.shuffle.sample.id
})

event2 = cat2.events.create!({
  name: "Drinks",
  description: "Going for a drink (or 10)",
  cover_img: Faker::Avatar.image,
  start_date: DateTime.new(2017,rand(9..12),rand(1..30)),
  time: rand(0000..2359),
  lat: 43.644554,
  lng: -79.399919,
  creator_id: User.all.shuffle.sample.id
})

event3 = cat3.events.create!({
  name: "Party",
  description: "Having a party this weekend",
  cover_img: Faker::Avatar.image,
  start_date: DateTime.new(2017,rand(9..12),rand(1..30)),
  time: rand(0000..2359),
  lat: 43.646530,
  lng: -79.390462,
  creator_id: User.all.shuffle.sample.id
})

event4 = cat4.events.create!({
  name: "Coffee",
  description: "Grab a coffee?",
  cover_img: Faker::Avatar.image,
  start_date: DateTime.new(2017,rand(9..12),rand(1..30)),
  time: rand(0000..2359),
  lat: 43.645545,
  lng: -79.395432,
  creator_id: User.all.shuffle.sample.id
})

event5 = cat5.events.create!({
  name: "Football",
  description: "Catch a football game at Real Sports",
  cover_img: Faker::Avatar.image,
  start_date: DateTime.new(2017,rand(9..12),rand(1..30)),
  time: rand(0000..2359),
  lat: 43.642828,
  lng: -79.379593,
  creator_id: User.all.shuffle.sample.id
})

event6 = cat6.events.create!({
  name: "Walk",
  description: "Go for a little stroll before the snow comes...",
  cover_img: Faker::Avatar.image,
  start_date: DateTime.new(2017,rand(9..12),rand(1..30)),
  time: rand(0000..2359),
  lat: 43.639083,
  lng: -79.382786,
  creator_id: User.all.shuffle.sample.id
})

event7 = cat7.events.create!({
  name: "Dinner",
  description: "Let's grab a bite to eat!",
  cover_img: Faker::Avatar.image,
  start_date: DateTime.new(2017,rand(9..12),rand(1..30)),
  time: rand(0000..2359),
  lat: 43.645957,
  lng: -79.381032,
  creator_id: User.all.shuffle.sample.id
})

event8 = cat8.events.create!({
  name: "Photography",
  description: "Anyone want to roam the city and snap some pictures!?!",
  cover_img: Faker::Avatar.image,
  start_date: DateTime.new(2017,rand(9..12),rand(1..30)),
  time: rand(0000..2359),
  lat: 43.637081,
  lng: -79.393291,
  creator_id: User.all.shuffle.sample.id
})

event9 = cat9.events.create!({
  name: "Art",
  description: "Going to AGO this weekend",
  cover_img: Faker::Avatar.image,
  start_date: DateTime.new(2017,rand(9..12),rand(1..30)),
  time: rand(0000..2359),
  lat: 43.653465,
  lng: -79.392430,
  creator_id: User.all.shuffle.sample.id
})

event10 = cat10.events.create!({
  name: "Cultural",
  description: "Checkout the railway museum?",
  cover_img: Faker::Avatar.image,
  start_date: DateTime.new(2017,rand(9..12),rand(1..30)),
  time: rand(0000..2359),
  lat: 43.640694,
  lng: -79.386078,
  creator_id: User.all.shuffle.sample.id
})


event11 = cat11.events.create!({
  name: "Cooking",
  description: "Checkout the railway museum?",
  cover_img: Faker::Avatar.image,
  start_date: DateTime.new(2017,rand(9..12),rand(1..30)),
  time: rand(0000..2359),
  lat: 43.640694,
  lng: -79.386078,
  creator_id: User.all.shuffle.sample.id
})

event12 = cat12.events.create!({
  name: "Games",
  description: "Checkout the railway museum?",
  cover_img: Faker::Avatar.image,
  start_date: DateTime.new(2017,rand(9..12),rand(1..30)),
  time: rand(0000..2359),
  lat: 43.640694,
  lng: -79.386078,
  creator_id: User.all.shuffle.sample.id
})

event13 = cat13.events.create!({
  name: "Shopping",
  description: "Checkout the railway museum?",
  cover_img: Faker::Avatar.image,
  start_date: DateTime.new(2017,rand(9..12),rand(1..30)),
  time: rand(0000..2359),
  lat: 43.640694,
  lng: -79.386078,
  creator_id: User.all.shuffle.sample.id
})

event14 = cat14.events.create!({
  name: "Other",
  description: "Anyone want to just roam around or hang on a park bench?",
  cover_img: Faker::Avatar.image,
  start_date: DateTime.new(2017,rand(9..12),rand(1..30)),
  time: rand(0000..2359),
  lat: 43.640694,
  lng: -79.386078,
  creator_id: User.all.shuffle.sample.id
})

event15 = cat15.events.create!({
  name: "Cultural",
  description: "Want to go see the Toronto Necropolis?",
  cover_img: Faker::Avatar.image,
  start_date: DateTime.new(2017,rand(9..12),rand(1..30)),
  time: rand(0000..2359),
  lat: 43.667657,
  lng: -79.361570,
  creator_id: User.all.shuffle.sample.id
})

event16 = cat1.events.create!({
  name: "Hiking",
  description: "Let's go explore Riverdale!",
  cover_img: Faker::Avatar.image,
  start_date: DateTime.new(2017,rand(9..12),rand(1..30)),
  time: rand(0000..2359),
  lat: 43.670367,
  lng: -79.356343,
  creator_id: User.all.shuffle.sample.id
})

event17 = cat1.events.create!({
  name: "Hiking",
  description: "Let's go explore Riverdale!",
  cover_img: Faker::Avatar.image,
  start_date: DateTime.new(2017,rand(9..12),rand(1..30)),
  time: rand(0000..2359),
  lat: 43.629181,
  lng: -79.327854,
  creator_id: User.all.shuffle.sample.id
})


##events_users

puts "Creating the table of attendees..."

300.times do
  eu = EventsUser.new
  e = Event.all.shuffle.sample
  u = User.all.shuffle.sample
  eu.user = u
  eu.event = e
  status_array = ["Attending", "Interested"]
  eu.status = status_array.shuffle.sample
  # rating_array = [1,2,3,4,5]
  # eu.rating = rating_array.shuffle.sample
  eu.save
end

