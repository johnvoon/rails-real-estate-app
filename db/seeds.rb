# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed
# (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

users = (1..5).to_a.map do |_|
  User.create!(
    email: Faker::Internet.email,
    company_name: Faker::Company.name) do |u|
    u.password = 'hello123'
  end
end
users << User.create!(
  email: "johnksvoon@gmail.com",
  company_name: "Voon Pty Ltd") do |u|
  u.password = 'hello123'
end
users << User.create!(
  email: "nathaniel@gmail.com",
  company_name: "Mether Pty Ltd") do |u|
  u.password = 'hello123'
end

puts "Created #{User.all.size} users"

users.each do |u|
  Tenant.create!(user_id: u.id)
end

puts "Created #{Tenant.all.size} tenants"

listings = (1..10).to_a.map do |_|
  Listing.create!(
    title: [
      "Creative space in the city", 
      "Excellent location", 
      "Close to public transport", 
      "Lots of restaurants in the vicinity", 
      "Spacious work area", 
      "Newly refurbished office space"
    ].sample
    deposit_payable: 1000,
    seats: (10..100).to_a.sample,
    size: (100..300).to_a.sample,
    availability_start_date: Date.strptime('05-09-2017', '%d-%m-%Y'),
    availability_end_date: Date.strptime('04-09-2018', '%d-%m-%Y'),
    minimum_term: 28,
    minimum_term_unit: 1,
    # just select a random tenant ID
    tenant_id: Tenant.all.map(&:id).sample
  )
end

puts "Created #{listings.size} listings"

# 1 listing has 1 address
listings.each do |listing|
  Address.create!(
    unit_number: Random.new.rand(5..9).to_s,
    street: ['Collins Street', 'Bourke Street', 'Exhibition Street', 'Spencer Street', 'Lonsdale Street'].sample,
    postcode: '3000',
    city: 'Melbourne',
    state: 'Victoria',
    country: 'Australia',
    listing_id: listing.id
  )
end

puts "Created #{Address.all.size} addresses"

# 1 listing has many rental rates
listings.each do |listing|
  RentalRate.create!(
    rental_rate: 20,
    rental_rate_unit: 0,
    listing_id: listing.id
  )
  RentalRate.create!(
    rental_rate: 150,
    rental_rate_unit: 1,
    listing_id: listing.id
  )
  RentalRate.create!(
    rental_rate: 3600,
    rental_rate_unit: 2,
    listing_id: listing.id
  )
  RentalRate.create!(
    rental_rate: 43200,
    rental_rate_unit: 3,
    listing_id: listing.id
  )
end

puts "Created #{RentalRate.all.size} rental rates"

# 1 listing has many business hours
# 1 business hour has many listings
listings.each do |listing|
  (1..6).to_a.map do |day|
    bh = BusinessHour.create!(
      day: day,
      open_time: Tod::TimeOfDay.parse("8am"),
      close_time: Tod::TimeOfDay.parse("8pm")
    )
    ListingBusinessHour.create!(
      listing_id: listing.id,
      business_hour_id: bh.id
    )
  end
end

puts "Created #{BusinessHour.all.size} business hours"

# 1 listing has many amenities
# 1 amenity has many listings
listings.each do |listing|
  [
    "Wifi",
   "Pantry",
   "Projector",
   "Coffee",
   "Whiteboard"
  ].map do |description|
    a = Amenity.create!(
      description: description,
    )
    ListingAmenity.create!(
      listing_id: listing.id,
      amenity_id: a.id
    )
  end
end

puts "Created #{Amenity.all.size} amenities"

users.each_with_index do |u, idx|
  chat_room = ChatRoom.create!
  ChatRoomUser.create!(
    user_id: u.id,
    chat_room_id: chat_room.id
  )
  ChatRoomUser.create!(
    user_id: users[idx - 1].id,
    chat_room_id: chat_room.id
  )
  10.times do |index|
    if index % 2 == 0
      Message.create!(
        body: Faker::Lorem.sentence,
        user_id: u.id,
        chat_room_id: chat_room.id
      )
    else
      Message.create!(
        body: Faker::Lorem.sentence,
        user_id: users[idx - 1].id,
        chat_room_id: chat_room.id
      )
    end
  end
end

puts "Created #{ChatRoom.all.size} chatrooms"
puts "Created #{Message.all.size} messages"