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

# Helper functions
def open_asset(file_name)
  File.open(Rails.root.join('db', 'seed_assets', file_name))
end

# Only run on development (local) instances not on production, etc.
unless Rails.env.development?
  puts "Development seeds only (for now)!"
  exit 0
end


# Let's do this ...

## CATEGORIES

puts "Finding or Creating Categories ..."

Category.destroy_all

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
cat11 = Category.find_or_create_by! name: 'Sports'
cat12 = Category.find_or_create_by! name: 'Cooking'
cat13 = Category.find_or_create_by! name: 'Games'
cat14 = Category.find_or_create_by! name: 'Shopping'
cat15 = Category.find_or_create_by! name: 'Others'

puts "Clearing old data...."

EventsUser.destroy_all
User.destroy_all
Event.destroy_all

## USERS

puts "Creating users...."

30.times do
  u=User.new
  female_first_name_array = ['Cherrita', 'Barbra', 'Tally', 'Auberta', 'Ingaberg', 'Ameline', 'Melessa', 'Caroline', 'Livvy', 'Dorothee', 'Abbi',
    'Stormi', 'Hermine', 'Fey','Jeanie','Norene','Chastity','Cloris','Liane','Donica','Corina','Tersina','Marylinda','Erminia','Myrlene',
    'Deeann','Melinda','Rani','Malinde']
  female_last_name_array = ['Tullius','Crawford','Colton','Burr','Tolve','Hillenbach','Aijian','Batic','Shearrion','Lesse','Mayman','Abel','Barber',
    'Monien','Dumay','Stokey','Gillis','Pisapio','Sacco','Peckham','Hind','Furno','Anzalone','Rimbach','Peterson','Rosenkrantz','Melinda Beane',
    'Dapice', 'Moura']
  u.first_name = female_first_name_array.shuffle.sample
  u.last_name = female_last_name_array.shuffle.sample
  u.email = u.first_name + "." + u.last_name + "@email.com"
  u.password = '123'
  u.password_confirmation = '123'
  avatar_array = [open_asset('f_av1.jpeg'), open_asset('f_av2.jpeg'), open_asset('f_av3.jpeg'), open_asset('f_av4.jpeg'), 
    open_asset('f_av5.jpeg'), open_asset('f_av6.jpeg'), open_asset('f_av7.jpeg'), open_asset('f_av8.jpeg'), open_asset('f_av9.jpeg'), 
    open_asset('f_av10.jpeg'), open_asset('f_av11.jpeg'), open_asset('f_av12.jpeg'), open_asset('f_av13.jpeg'), open_asset('f_av14.jpeg'), 
    open_asset('f_av15.jpeg')]
  u.avatar = avatar_array.shuffle.sample
  u.gender = "Female"
  u.save
end

30.times do
  f_name = Faker::Name.first_name
  l_name = Faker::Name.last_name
  u.first_name = f_name
  u.last_name = l_name
  u.email = f_name + "." + l_name + "@email.com"
  u.password = '123'
  u.password_confirmation = '123'
  avatar_array = [open_asset('m_av1.jpeg'), open_asset('m_av2.jpeg'), open_asset('m_av3.jpeg'), open_asset('m_av4.jpeg'), 
  open_asset('m_av5.jpeg'), open_asset('m_av6.jpeg'), open_asset('m_av7.jpeg'), open_asset('m_av8.jpeg'), open_asset('m_av9.jpeg'), 
  open_asset('m_av10.jpeg'), open_asset('m_av11.jpeg'), open_asset('m_av12.jpeg'), open_asset('m_av13.jpeg'), open_asset('m_av14.jpeg'), 
  open_asset('m_av15.jpeg')]
  u.avatar = avatar_array.shuffle.sample
  u.gender = "Male"
  u.save
end







## EVENTS

puts "Creating Events ..."

event1 = cat1.events.create!({
  name: "Hike",
  description: "Going for a hike!",
  cover_img: open_asset('hiking1.jpg'),
  start_date: Date.new(2017,rand(8..12),rand(1..30)),
  time: rand(0000..2359),
  lat: 43.621441,
  lng: -79.395799,
  creator_id: User.all.shuffle.sample.id
})

event2 = cat2.events.create!({
  name: "Drinks",
  description: "Going for a drink (or 10)",
  cover_img: open_asset('drinks1.jpg'),
  start_date: Date.new(2017,rand(8..12),rand(1..30)),
  time: rand(1100..2359),
  lat: 43.644554,
  lng: -79.399919,
  creator_id: User.all.shuffle.sample.id
})

event3 = cat3.events.create!({
  name: "Party",
  description: "Having a party this weekend",
  cover_img: open_asset('party1.jpg'),
  start_date: Date.new(2017,rand(8..12),rand(1..30)),
  time: rand(1100..2359),
  lat: 43.646530,
  lng: -79.390462,
  creator_id: User.all.shuffle.sample.id
})

event4 = cat4.events.create!({
  name: "Coffee",
  description: "Grab a coffee?",
  cover_img: open_asset('coffee1.jpg'),
  start_date: Date.new(2017,rand(8..12),rand(1..30)),
  time: rand(0000..2359),
  lat: 43.645545,
  lng: -79.395432,
  creator_id: User.all.shuffle.sample.id
})

event5 = cat5.events.create!({
  name: "Football",
  description: "Catch a football game at Real Sports",
  cover_img: open_asset('sports2.jpg'),
  start_date: Date.new(2017,rand(8..12),rand(1..30)),
  time: rand(0000..2359),
  lat: 43.642828,
  lng: -79.379593,
  creator_id: User.all.shuffle.sample.id
})

event6 = cat6.events.create!({
  name: "Walk",
  description: "Go for a little stroll before the snow comes...",
  cover_img: open_asset('walk1.jpg'),
  start_date: Date.new(2017,rand(8..12),rand(1..30)),
  time: rand(0000..2359),
  lat: 43.639083,
  lng: -79.382786,
  creator_id: User.all.shuffle.sample.id
})

event7 = cat7.events.create!({
  name: "Dinner",
  description: "Let's grab a bite to eat!",
  cover_img: open_asset('meal1.jpg'),
  start_date: Date.new(2017,rand(8..12),rand(1..30)),
  time: rand(0000..2359),
  lat: 43.645957,
  lng: -79.381032,
  creator_id: User.all.shuffle.sample.id
})

event8 = cat8.events.create!({
  name: "Photography",
  description: "Anyone want to roam the city and snap some pictures!?!",
  cover_img: open_asset('photos5.jpg'),
  start_date: Date.new(2017,rand(8..12),rand(1..30)),
  time: rand(0000..2359),
  lat: 43.637081,
  lng: -79.393291,
  creator_id: User.all.shuffle.sample.id
})

event9 = cat9.events.create!({
  name: "Art",
  description: "Going to AGO this weekend",
  cover_img: open_asset('art2.jpg'),
  start_date: Date.new(2017,rand(8..12),rand(1..30)),
  time: rand(0000..2359),
  lat: 43.653465,
  lng: -79.392430,
  creator_id: User.all.shuffle.sample.id
})

event10 = cat10.events.create!({
  name: "Cultural",
  description: "Checkout the railway museum?",
  cover_img: open_asset('culture1.jpg'),
  start_date: Date.new(2017,rand(8..12),rand(1..30)),
  time: rand(0000..2359),
  lat: 43.640694,
  lng: -79.386078,
  creator_id: User.all.shuffle.sample.id
})

##events_users

200.times do
  eu = EventsUser.new
  e = Event.all.shuffle.sample
  u = User.all.shuffle.sample
  eu.user = u
  eu.event = e
  status_array = ["Going", "Interested"]
  eu.status = status_array.shuffle.sample
  rating_array = [1,2,3,4,5]
  eu.rating = rating_array.shuffle.sample
  eu.save
end

puts "DONE!"



