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
cat11 = Category.find_or_create_by! name: 'Cooking'
cat12 = Category.find_or_create_by! name: 'Games'
cat13 = Category.find_or_create_by! name: 'Shopping'
cat14 = Category.find_or_create_by! name: 'Others'

puts "Clearing old data...."

EventsUser.destroy_all
User.destroy_all
Event.destroy_all

## USERS

puts "Creating female users...."

female_first_name_array = ['Cherrita', 'Barbra', 'Tally', 'Auberta', 'Ingaberg', 'Ameline', 'Melessa', 'Caroline', 'Livvy', 'Dorothee', 'Abbi',
                          'Stormi', 'Hermine', 'Fey', 'Jeanie', 'Norene', 'Chastity', 'Cloris', 'Liane', 'Donica', 'Corina', 'Tersina', 'Marylinda', 
                          'Erminia', 'Myrlene', 'Deeann', 'Melinda', 'Rani', 'Malinde', 'Alice']
female_last_name_array = ['Tullius', 'Crawford','Colton','Burr','Tolve','Hillenbach','Aijian','Batic','Shearrion','Lesse','Mayman','Abel','Barber',
                          'Monien','Dumay','Stokey','Gillis','Pisapio','Sacco','Peckham','Hind','Furno','Anzalone','Rimbach','Peterson','Rosenkrantz',
                          'Beane', 'Dapice', 'Moura', 'Brown']
female_avatar_array = [open_asset('f_av1.jpeg'), open_asset('f_av2.jpeg'), open_asset('f_av3.jpeg'), open_asset('f_av4.jpeg'), 
                      open_asset('f_av5.jpeg'), open_asset('f_av6.jpeg'), open_asset('f_av7.jpeg'), open_asset('f_av8.jpeg'), open_asset('f_av9.jpeg'), 
                      open_asset('f_av10.jpeg'), open_asset('f_av11.jpeg'), open_asset('f_av12.jpeg'), open_asset('f_av13.jpeg'), open_asset('f_av14.jpeg'), 
                      open_asset('f_av15.jpeg'), open_asset('f_av16.jpeg'), open_asset('f_av17.jpeg'), open_asset('f_av18.jpeg'), open_asset('f_av19.jpeg'), 
                      open_asset('f_av20.jpeg'), open_asset('f_av21.jpeg'), open_asset('f_av22.jpeg'), open_asset('f_av23.jpeg'), open_asset('f_av24.jpeg'), 
                      open_asset('f_av25.jpeg'), open_asset('f_av26.jpeg'), open_asset('f_av27.jpeg'), open_asset('f_av28.jpeg'), open_asset('f_av29.jpeg'), 
                      open_asset('f_av30.jpeg')]

30.times do
  u=User.new
  first_name = female_first_name_array.shuffle.sample
  u.first_name = first_name
  female_first_name_array = female_first_name_array.select{ |f| f != first_name }
  last_name = female_last_name_array.shuffle.sample
  u.last_name = last_name
  female_last_name_array = female_last_name_array.select{ |l| l != last_name }
  u.email = first_name + "." + last_name + "@email.com"
  u.password = '123'
  u.password_confirmation = '123'
  avatar = female_avatar_array.shuffle.sample
  u.avatar = avatar
  female_avatar_array = female_avatar_array.select{ |a| a != avatar }
  u.gender = "Female"
  u.save
end

puts "Creating male users...."

male_first_name_array = ['Valentine','Abran','Hiram','Virge','Shayne','Frederico','Burnaby','Kean','Em','Corny',
                        'Sawyere','Rouvin','Rice','Sidnee','Gael','Yard','Andrea','Laurens','Barri','Felipe','Bruis',
                        'Brew','Nicolis','Buck','Matias','Garth','Baldo','Leonid','Alfonse', 'Steve']
male_last_name_array = ['Mcgill','Nychka','Cingolani','Delmon','Dangora','Ohare','Sargentich','Dubois','Alexis','Mcdaniel','Stuber',
                        'Hanreddy','Berrizbeitia','Boossarangsi','Santo','Packer','Grabar','Weissbourd','Pliego','Huber','Bolafka',
                        'Tennyson','Tootell','Messere', 'Davisson','Morvay','Labunka','Ducharme','Quinn', 'Castellino']
male_avatar_array = [open_asset('m_av1.jpg'), open_asset('m_av2.jpg'), open_asset('m_av3.jpeg'), open_asset('m_av4.jpeg'), 
                    open_asset('m_av5.jpeg'), open_asset('m_av6.jpeg'), open_asset('m_av7.jpeg'), open_asset('m_av8.jpeg'), open_asset('m_av9.jpeg'), 
                    open_asset('m_av10.jpeg'), open_asset('m_av11.jpeg'), open_asset('m_av12.jpeg'), open_asset('m_av13.jpeg'), open_asset('m_av14.jpeg'), 
                    open_asset('m_av15.jpeg'), open_asset('m_av16.jpeg'), open_asset('m_av17.jpeg'), open_asset('m_av18.jpeg'), open_asset('m_av19.jpeg'), 
                    open_asset('m_av20.jpeg'), open_asset('m_av21.jpeg'), open_asset('m_av22.jpeg'), open_asset('m_av23.jpeg'), open_asset('m_av24.jpeg'), 
                    open_asset('m_av25.jpeg'), open_asset('m_av26.jpeg'), open_asset('m_av27.jpeg'), open_asset('m_av28.jpeg'), open_asset('m_av29.jpeg'), 
                    open_asset('m_av30.jpeg')]

30.times do
  first_name = male_first_name_array.shuffle.sample
  u.first_name = first_name
  male_first_name_array = male_first_name_array.select{ |f| f != first_name }
  last_name = male_last_name_array.shuffle.sample
  u.last_name = last_name
  male_last_name_array = male_last_name_array.select{ |l| l != last_name }
  u.email = first_name + "." + last_name + "@email.com"
  u.password = '123'
  u.password_confirmation = '123'
  avatar = male_avatar_array.shuffle.sample
  u.avatar = avatar
  male_avatar_array = male_avatar_array.select{ |a| a != avatar }
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

event16 = cat1.events.create!({
  name: "Hiking through Riverdale",
  description: "Let's go explore Riverdale!",
  cover_img: open_asset('hiking4.jpg'),
  start_date: Date.new(2017,rand(8..12),rand(1..30)),
  time: rand(0000..2359),
  lat: 43.670367,
  lng: -79.356343,
  creator_id: User.all.shuffle.sample.id
})

event17 = cat1.events.create!({
  name: "Hike @ the park!",
  description: "Let's checkout Tommy Thompson Park!",
  cover_img: open_asset('hiking3.jpg'),
  start_date: Date.new(2017,rand(8..12),rand(1..30)),
  time: rand(0000..2359),
  lat: 43.629181,
  lng: -79.327854,
  creator_id: User.all.shuffle.sample.id
})

event2 = cat2.events.create!({
  name: "Drinks",
  description: "Going for a drink (or 10)",
  cover_img: open_asset('drinks5.jpg'),
  start_date: Date.new(2017,rand(8..12),rand(1..30)),
  time: rand(0000..2359),
  lat: 43.644554,
  lng: -79.399919,
  creator_id: User.all.shuffle.sample.id
})

event18 = cat2.events.create!({
  name: "Quick pint?!",
  description: "Anyone want to grab a quick pint at the Irish Embassy?!",
  cover_img: open_asset('drinks1.jpg'),
  start_date: Date.new(2017,rand(8..12),rand(1..30)),
  time: rand(0000..2359),
  lat: 43.647967,
  lng: -79.377248,
  creator_id: User.all.shuffle.sample.id
})

event19 = cat2.events.create!({
  name: "Get sloppy at Sneaky's",
  description: "You know the drill....",
  cover_img: open_asset('drinks2.jpg'),
  start_date: Date.new(2017,rand(8..12),rand(1..30)),
  time: rand(0000..2359),
  lat: 43.656304,
  lng: -79.407481,
  creator_id: User.all.shuffle.sample.id
})

event3 = cat3.events.create!({
  name: "Party",
  description: "Having a party this weekend",
  cover_img: open_asset('party1.jpg'),
  start_date: Date.new(2017,rand(8..12),rand(1..30)),
  time: rand(0000..2359),
  lat: 43.646530,
  lng: -79.390462,
  creator_id: User.all.shuffle.sample.id
})

event20 = cat3.events.create!({
  name: "Free Party!",
  description: "Open access to party @ Nathan Phillips",
  cover_img: open_asset('party2.jpg'),
  start_date: Date.new(2017,rand(8..12),rand(1..30)),
  time: rand(0000..2359),
  lat: 43.652374,
  lng: -79.383553,
  creator_id: User.all.shuffle.sample.id
})

event21 = cat3.events.create!({
  name: "Music and dancing!",
  description: "Let's go boogie-down at the Phoenix",
  cover_img: open_asset('party5.jpg'),
  start_date: Date.new(2017,rand(8..12),rand(1..30)),
  time: rand(0000..2359),
  lat: 43.664664,
  lng: -79.373971,
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

event22 = cat4.events.create!({
  name: "Cup of tea",
  description: "Anyone want to checkout Dineen? I've heard good things...",
  cover_img: open_asset('coffee5.jpg'),
  start_date: Date.new(2017,rand(8..12),rand(1..30)),
  time: rand(0000..2359),
  lat: 43.651141,
  lng: -79.378927,
  creator_id: User.all.shuffle.sample.id
})

event23 = cat4.events.create!({
  name: "Best coffee in town",
  description: "Come try some and tell me I'm wrong",
  cover_img: open_asset('coffee3.jpg'),
  start_date: Date.new(2017,rand(8..12),rand(1..30)),
  time: rand(0000..2359),
  lat: 43.651249,
  lng: -79.384229,
  creator_id: User.all.shuffle.sample.id
})

event5 = cat5.events.create!({
  name: "Football",
  description: "Catch a football game at Real Sports",
  cover_img: open_asset('sports4.jpg'),
  start_date: Date.new(2017,rand(8..12),rand(1..30)),
  time: rand(0000..2359),
  lat: 43.642828,
  lng: -79.379593,
  creator_id: User.all.shuffle.sample.id
})

event24 = cat5.events.create!({
  name: "Toss the pigskin around in the park for a bit",
  description: "Just an excuse to get outside and enjoy the weather while it lasts.",
  cover_img: open_asset('sports2.jpg'),
  start_date: Date.new(2017,rand(8..12),rand(1..30)),
  time: rand(0000..2359),
  lat: 43.664105,
  lng: -79.392079,
  creator_id: User.all.shuffle.sample.id
})

event38 = cat5.events.create!({
  name: "Kayaking!!! ",
  description: "Or something? ",
  cover_img: open_asset('sports1.jpg'),
  start_date: Date.new(2017,rand(8..12),rand(1..30)),
  time: rand(0000..2359),
  lat: 43.637925,
  lng: -79.381383,
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

event25 = cat6.events.create!({
  name: "Let's go enjoy the sun",
  description: "Wander through the city!",
  cover_img: open_asset('walk4.jpg'),
  start_date: Date.new(2017,rand(8..12),rand(1..30)),
  time: rand(0000..2359),
  lat: 43.650944,
  lng: -79.376133,
  creator_id: User.all.shuffle.sample.id
})

event39 = cat6.events.create!({
  name: "Heading to the park ",
  description: "Gonna take a walk to check out Trinity Bellwoods",
  cover_img: open_asset(' '),
  start_date: Date.new(2017,rand(8..12),rand(1..30)),
  time: rand(0000..2359),
  lat: 43.646650,
  lng: -79.413460,
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

event26 = cat7.events.create!({
  name: "Need a guest for dinner at my club",
  description: "Any interest? Soho house has great food... ",
  cover_img: open_asset('meal4.jpg'),
  start_date: Date.new(2017,rand(8..12),rand(1..30)),
  time: rand(0000..2359),
  lat: 43.648794,
  lng: -79.386431,
  creator_id: User.all.shuffle.sample.id
})
 
event40 = cat7.events.create!({
  name: "New restaurant @ Kensington Market",
  description: "I've heard good things...",
  cover_img: open_asset('meal2.jpg'),
  start_date: Date.new(2017,rand(8..12),rand(1..30)),
  time: rand(0000..2359),
  lat: 43.649007,
  lng: -79.371775,
  creator_id: User.all.shuffle.sample.id
})

event8 = cat8.events.create!({
  name: "Photography",
  description: "Anyone want to roam the city and snap some pictures?",
  cover_img: open_asset('photos5.jpg'),
  start_date: Date.new(2017,rand(8..12),rand(1..30)),
  time: rand(0000..2359),
  lat: 43.637081,
  lng: -79.393291,
  creator_id: User.all.shuffle.sample.id
})

event27 = cat8.events.create!({
  name: "Photography by the lake",
  description: "Want to test out my new lenses - who's in?",
  cover_img: open_asset('photos3.jpg'),
  start_date: Date.new(2017,rand(8..12),rand(1..30)),
  time: rand(0000..2359),
  lat: 43.638068,
  lng: -79.388308,
  creator_id: User.all.shuffle.sample.id
})
 
event41 = cat8.events.create!({
  name: "Architectural Admiration",
  description: "Planning to go take some photos of the unique buildings around UofT",
  cover_img: open_asset('photos1.jpg'),
  start_date: Date.new(2017,rand(8..12),rand(1..30)),
  time: rand(0000..2359),
  lat: 43.660232,
  lng: -79.394733,
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

event28 = cat9.events.create!({
  name: "Art Battle Time",
  description: "Dying to checkout Art Battle International!!! ",
  cover_img: open_asset('art5.jpg'),
  start_date: Date.new(2017,rand(8..12),rand(1..30)),
  time: rand(0000..2359),
  lat: 43.646882,
  lng:  -79.405493,
  creator_id: User.all.shuffle.sample.id
})

event42 = cat9.events.create!({
  name: "Painting Classes",
  description: "Would love to attend some beginner painting classes",
  cover_img: open_asset('art3.jpg'),
  start_date: Date.new(2017,rand(8..12),rand(1..30)),
  time: rand(0000..2359),
  lat: 43.644231,
  lng: -79.386989,
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

event15 = cat10.events.create!({
  name: "Cultural",
  description: "Want to go see the Toronto Necropolis?",
  cover_img: open_asset('culture2.jpg'),
  start_date: Date.new(2017,rand(8..12),rand(1..30)),
  time: rand(0000..2359),
  lat: 43.667657,
  lng: -79.361570,
  creator_id: User.all.shuffle.sample.id
})

event11 = cat11.events.create!({
  name: "Cooking class",
  description: "Let's try the free cooking class @ Longos!",
  cover_img: open_asset('cooking1.jpg'),
  start_date: Date.new(2017,rand(8..12),rand(1..30)),
  time: rand(0000..2359),
  lat: 43.642459,
  lng: -79.380840,
  creator_id: User.all.shuffle.sample.id
})

event30 = cat11.events.create!({
  name: "Cooking Classes",
  description: "I've heard great things - anyone want to checkout a class? ",
  cover_img: open_asset('cooking3.jpg'),
  start_date: Date.new(2017,rand(8..12),rand(1..30)),
  time: rand(0000..2359),
  lat: 43.649043,
  lng: -79.371775,
  creator_id: User.all.shuffle.sample.id
})

event12 = cat12.events.create!({
  name: "Games & beers?",
  description: "Wanna go see what the rec room is all about",
  cover_img: open_asset('games1.jpg'),
  start_date: Date.new(2017,rand(8..12),rand(1..30)),
  time: rand(0000..2359),
  lat: 43.641194,
  lng: -79.386770,
  creator_id: User.all.shuffle.sample.id
})

event31 = cat12.events.create!({
  name: "NHL Tourney",
  description: "EB Games is having an open NHL tourney with prizes",
  cover_img: open_asset('games2.jpg'),
  start_date: Date.new(2017,rand(8..12),rand(1..30)),
  time: rand(0000..2359),
  lat: 43.655308,
  lng: -79.38027,
  creator_id: User.all.shuffle.sample.id
})

event35 = cat12.events.create!({
  name: "Board Game Challenge ",
  description: "Open challenge to anyone willing to try and beat me at board games",
  cover_img: open_asset(' '),
  start_date: Date.new(2017,rand(8..12),rand(1..30)),
  time: rand(0000..2359),
  lat: 43.650120,
  lng: -79.390615,
  creator_id: User.all.shuffle.sample.id
})

event13 = cat13.events.create!({
  name: "Shopping for shoes!",
  description: "Let's go shoe shopping at the Eaton Centre!",
  cover_img: open_asset('shopping1.jpg'),
  start_date: Date.new(2017,rand(8..12),rand(1..30)),
  time: rand(0000..2359),
  lat: 43.654011,
  lng: -79.380574,
  creator_id: User.all.shuffle.sample.id
})

event32 = cat13.events.create!({
  name: "Kensington Market Blitz",
  description: "Let's snag some deals at the market ",
  cover_img: open_asset('shopping4.jpg'),
  start_date: Date.new(2017,rand(8..12),rand(1..30)),
  time: rand(0000..2359),
  lat: 43.654797,
  lng: -79.400127,
  creator_id: User.all.shuffle.sample.id
})

event36 = cat13.events.create!({
  name: "Queen West Window Shopping Spree ",
  description: "Might find a few deals?!",
  cover_img: open_asset('shopping2.jpg'),
  start_date: Date.new(2017,rand(8..12),rand(1..30)),
  time: rand(0000..2359),
  lat: 43.647433,
  lng: -79.402948,
  creator_id: User.all.shuffle.sample.id
})

event14 = cat14.events.create!({
  name: "Let's aimlessly roam",
  description: "Anyone want to just roam around or hang on a park bench?",
  cover_img: open_asset('other5.jpg'),
  start_date: Date.new(2017,rand(8..12),rand(1..30)),
  time: rand(0000..2359),
  lat: 43.640694,
  lng: -79.386078,
  creator_id: User.all.shuffle.sample.id
})

event33 = cat14.events.create!({
  name: "Ronald McDonald House",
  description: "Going to do some charity work - all welcome.",
  cover_img: open_asset('other2.jpg'),
  start_date: Date.new(2017,rand(8..12),rand(1..30)),
  time: rand(0000..2359),
  lat: 43.658192,
  lng: -79.393354,
  creator_id: User.all.shuffle.sample.id
})

event37 = cat14.events.create!({
  name: "Sick Kids Hospital",
  description: "Putting some volunteer time in @ sick kids, would love some company",
  cover_img: open_asset('party3.jpg'),
  start_date: Date.new(2017,rand(8..12),rand(1..30)),
  time: rand(0000..2359),
  lat: 43.656219,
  lng: -79.388482,
  creator_id: User.all.shuffle.sample.id
})


##events_users

puts "Creating event attendees..."

180.times do
  eu = EventsUser.new
  e = Event.all.shuffle.sample
  u = User.all.shuffle.sample
  eu.user = u
  eu.event = e
  status_array = ["Attending", "Interested"]
  eu.status = status_array.shuffle.sample
  eu.save
end

puts "DONE!"



