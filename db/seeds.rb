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
cat11 = Category.find_or_create_by! name: 'Sports'
cat12 = Category.find_or_create_by! name: 'Cook'
cat13 = Category.find_or_create_by! name: 'Games'
cat14 = Category.find_or_create_by! name: 'Shopping'
cat15 = Category.find_or_create_by! name: 'Others'

## USERS

User.destroy_all

User.populate 50 do |person|
  person.first_name = Faker::Name.first_name
  person.last_name = Faker::Name.last_name
  person.email = Faker::Internet.email
  person.password_digest = '123'
  # person.password_confirmation = '123'
  person.avatar = Faker::Avatar.image
  gender_array = ["Male", "Female"]
  person.gender = gender_array.shuffle.sample
end

## EVENTS

puts "Re-creating Events ..."

Event.destroy_all

event1 = cat1.events.create!({
  name: "Hike",
  description: "Going for a hike this weekend",
  cover_img: Faker::Avatar.image,
  start_date: DateTime.new(2017,9,1),
  end_date: DateTime.new(2017,9,10),
  lng: rand(43.63..43.67),
  lat: rand(79.23..79.49)*(-1),
  creator_id: rand(1..50)
})

event2 = cat2.events.create!({
  name: "Drinks",
  description: "Going for a drink this weekend",
  cover_img: Faker::Avatar.image,
  start_date: DateTime.new(2017,9,1),
  end_date: DateTime.new(2017,9,10),
  lng: rand(43.63..43.67),
  lat: rand(79.23..79.49)*(-1),
  creator_id: rand(1..50)
})

event3 = cat3.events.create!({
  name: "Party",
  description: "Going for a party this weekend",
  cover_img: Faker::Avatar.image,
  start_date: DateTime.new(2017,9,1),
  end_date: DateTime.new(2017,9,10),
  lng: rand(43.63..43.67),
  lat: rand(79.23..79.49)*(-1),
  creator_id: rand(1..50)
})

event4 = cat4.events.create!({
  name: "Coffee",
  description: "Going for a Coffee this weekend",
  cover_img: Faker::Avatar.image,
  start_date: DateTime.new(2017,9,1),
  end_date: DateTime.new(2017,9,10),
  lng: rand(43.63..43.67),
  lat: rand(79.23..79.49)*(-1),
  creator_id: rand(1..50)
})

event5 = cat5.events.create!({
  name: "Football",
  description: "Going for Football this weekend",
  cover_img: Faker::Avatar.image,
  start_date: DateTime.new(2017,9,1),
  end_date: DateTime.new(2017,9,10),
  lng: rand(43.63..43.67),
  lat: rand(79.23..79.49)*(-1),
  creator_id: rand(1..50)
})

event6 = cat6.events.create!({
  name: "Walk",
  description: "Going for a Walk this weekend",
  cover_img: Faker::Avatar.image,
  start_date: DateTime.new(2017,9,1),
  end_date: DateTime.new(2017,9,10),
  longitude: rand(43.63..43.67),
  lng: rand(79.23..79.49)*(-1),
  creator_id: rand(1..50)
})

event7 = cat7.events.create!({
  name: "Dinner",
  description: "Going for a Meal this weekend",
  cover_img: Faker::Avatar.image,
  start_date: DateTime.new(2017,9,1),
  end_date: DateTime.new(2017,9,10),
  longitude: rand(43.63..43.67),
  lng: rand(79.23..79.49)*(-1),
  creator_id: rand(1..50)
})

event8 = cat8.events.create!({
  name: "Photography",
  description: "Photography this weekend",
  cover_img: Faker::Avatar.image,
  start_date: DateTime.new(2017,9,1),
  end_date: DateTime.new(2017,9,10),
  lng: rand(43.63..43.67),
  lat: rand(79.23..79.49)*(-1),
  creator_id: rand(1..50)
})

event9 = cat9.events.create!({
  name: "Art",
  description: "Going to AGO this weekend",
  cover_img: Faker::Avatar.image,
  start_date: DateTime.new(2017,9,1),
  end_date: DateTime.new(2017,9,10),
  lng: rand(43.63..43.67),
  lat: rand(79.23..79.49)*(-1),
  creator_id: rand(1..50)
})

event10 = cat10.events.create!({
  name: "Cultural",
  description: "Going to the mueseum this weekend",
  cover_img: Faker::Avatar.image,
  start_date: DateTime.new(2017,9,1),
  end_date: DateTime.new(2017,9,10),
  lng: rand(43.63..43.67),
  lat: rand(79.23..79.49)*(-1),
  creator_id: rand(1..50)
})

##events_users

# Events_user.populate 50 do |person|
#   status_array = ["Going", "Interested"]
#   person.status = status_array.shuffle.sample
#   rating_array = [1,2,3,4,5]
#   person.rating = rating_array.shuffle.sample
# end


# user1 = User.create!({
#   first_name: 'Ruby',
#   last_name: 'Gem',
#   email: 'ruby.gem@gmail.com',
#   password: '123',
#   password_confirmation: '123',
#   gender: 'female',
#   avatar: open_asset('apparel1.jpg')
#   })

# user2 = User.create!({
#   first_name: 'Avi',
#   last_name: 'Sings',
#   email: 'Avi@gmail.com',
#   password: '123',
#   password_confirmation: '123',
#   gender: 'female',
#   avatar:
#   })

# user3 = User.create!({
#   first_name: 'Bob',
#   last_name: 'Marley',
#   email: 'iamcool@gmail.com',
#   password: '123',
#   password_confirmation: '123',
#   gender: 'male'
#   })

# user4 = User.create!({
#   first_name: 'Mahatma',
#   last_name: 'Gandhi',
#   email: 'peace@gmail.com',
#   password: '123',
#   password_confirmation: '123',
#   gender: 'male'
#   })

# user5 = User.create!({
#   first_name: 'Mary',
#   last_name: 'Poppins',
#   email: 'Supercalafajalistickexpialadojus@gmail.com',
#   password: '123',
#   password_confirmation: '123',
#   gender: 'female'
#   })


# ## POSTS

# user1.posts.create!({
#   line_items: [line_item1],
#   total_cents: 3000,
#   stripe_charge_id: 12345,
#   email: 'ruby.gem@gmail.com',
#   user_id: 1
#   })

#REVIEWS

# puts "Re-creating Reviews ..."

# Review.destroy_all

# Review.create!({
#   user: User.first,
#   product: Product.second,
#   rating: 5,
#   description: 'Curious....very Curious!!'
# })

# Review.create!({
#   user: User.second,
#   product: Product.first,
#   rating: 1,
#   description: 'Dear god why?'
# })

# Review.create!({
#   user: User.third,
#   product: Product.first,
#   rating: 3,
#   description: 'Dude yess'
# })

# Review.create!({
#   user: User.fifth,
#   product: Product.last,
#   rating: 5,
#   description: 'LOVE this?'
# })

# Review.create!({
#   user: User.fourth,
#   product: Product.fourth,
#   rating: 2,
#   description: 'I am not sure why I bought this'
# })

# Review.create!({
#   user: User.sixth,
#   product: Product.fifth,
#   rating: 4,
#   description: 'this made my day!'
# })

# Review.create!({
#   user: User.seventh,
#   product: Product.fifth,
#   rating: 4,
#   description: 'this made my day!'
# })

# Review.create!({
#   user: User.ninth,
#   product: Product.fifth,
#   rating: 4,
#   description: 'this made my day!'
# })


