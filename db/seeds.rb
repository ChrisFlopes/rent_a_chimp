require 'faker'

puts 'Cleaning database...'

puts 'Cleaning Reviews...'
Review.destroy_all
puts 'Cleaning Bookings...'
Booking.destroy_all
puts 'Cleaning Animals...'
Animal.destroy_all
puts 'Cleaning Users...'
User.destroy_all


# IMAGES = ["https://c1.staticflickr.com/3/2616/4054759019_122957f28f_b.jpg", "https://i.pinimg.com/originals/26/82/d2/2682d282465f8dcc352660d8f063535f.jpg", "https://i.kym-cdn.com/photos/images/newsfeed/000/653/755/b18.jpg", "https://i.imgur.com/gdWIxn2.jpg", "http://66.media.tumblr.com/tumblr_lrjz3dnlyt1r36twko1_500.jpg"]

puts 'Creating Admin User...'
admin = User.new
admin.email = 'admin@rentachimp.com'
admin.first_name = 'Mr'
admin.last_name = 'Admin'
admin.password = '123456'
admin.save

puts 'Creating Users...'
5.times do |i|
  user = User.new
  user.email = Faker::Internet.email
  user.first_name = Faker::Movies::LordOfTheRings.character
  user.last_name = Faker::Movies::HarryPotter.spell
  user.password = '123456'
  user.save
end

# puts 'Creating Animals...'
# 25.times do |i|
#   animal = Animal.new
#   animal.species = %w[Chimp Cat Dog Camel].sample
#   animal.name = Faker::TvShows::Simpsons.character
#   animal.age = rand(1..30)
#   animal.owner = User.all.sample
#   animal.remote_photo_url = IMAGES.sample
#   animal.description = "#{animal.name} is a #{animal.species} that was born #{animal.age} years ago. #{animal.name} likes long walks on the beach and pina colada."
#   animal.address = Faker::Address.city
#   animal.save
# end


IMAGES_CATS = ["https://res.cloudinary.com/ddwfkdfyx/image/upload/v1551439643/Cats/lily-banse-348257-unsplash.jpg", "http://res.cloudinary.com/ddwfkdfyx/image/upload/v1551444456/Cats/anton-darius-thesollers-590562-unsplash.jpg", "https://res.cloudinary.com/ddwfkdfyx/image/upload/v1551439635/Cats/halanna-halila-557324-unsplash.jpg", "https://res.cloudinary.com/ddwfkdfyx/image/upload/v1551439627/Cats/dan-wayman-1298943-unsplash.jpg", "http://res.cloudinary.com/ddwfkdfyx/image/upload/w_1000,ar_16:9,c_fill,g_auto,e_sharpen/v1551439611/Cats/max-baskakov-1318019-unsplash.jpg"]
ADRESSES_CATS =["Marquês de Pombal,  Lisbon", "Bairro Alto, Lisbon", "Alfama, Lisbon", "Chiado, Lisbon", "Cais do Sodre, Lisbon"]
puts 'Creating Cats...'
4.times do |i|
  animal = Animal.new
  animal.species = "Cat"
  animal.name = Faker::Creature::Cat.name
  animal.age = rand(1..10)
  animal.owner = User.all.sample
  animal.remote_photo_url = IMAGES_CATS.shift
  animal.description = "#{animal.name} is a #{animal.species} that was born #{animal.age} years ago. #{animal.name} likes long walks on the beach and pina colada."
  animal.address = ADRESSES_CATS.shift
  animal.save
end

IMAGES_CAMELS = ["https://res.cloudinary.com/ddwfkdfyx/image/upload/v1551440004/Camel/cal-engel-531472-unsplash.jpg", "https://res.cloudinary.com/ddwfkdfyx/image/upload/v1551440003/Camel/briana-tozour-759206-unsplash.jpg", "https://res.cloudinary.com/ddwfkdfyx/image/upload/v1551439999/Camel/kristian-egelund-707664-unsplash.jpg", "https://res.cloudinary.com/ddwfkdfyx/image/upload/v1551439997/Camel/roxanne-desgagnes-287104-unsplash.jpg", "https://res.cloudinary.com/ddwfkdfyx/image/upload/v1551439987/Camel/shefali-sinha-423701-unsplash.jpg"]
ADRESSES_CAMELS =["Marvila,  Lisbon", "Beato, Lisbon", "Braço de Prata, Lisbon", "Marvila, Lisbon", "São João de Brito, Lisbon"]
puts 'Creating Camels...'
4.times do |i|
  animal = Animal.new
  animal.species = "Camel"
  animal.name = Faker::FunnyName.name
  animal.age = rand(20..45)
  animal.owner = User.all.sample
  animal.remote_photo_url = IMAGES_CAMELS.shift
  animal.description = "#{animal.name} is a #{animal.species} that was born #{animal.age} years ago. #{animal.name} likes long walks on the beach and pina colada."
  animal.address = ADRESSES_CAMELS.shift
  animal.save
end

IMAGES_DOGS = ["https://res.cloudinary.com/ddwfkdfyx/image/upload/v1551439768/Dogs/tamara-bellis-267349-unsplash.jpg", "https://res.cloudinary.com/ddwfkdfyx/image/upload/v1551439767/Dogs/matthew-henry-8824-unsplash.jpg", "https://res.cloudinary.com/ddwfkdfyx/image/upload/v1551439742/Dogs/dominik-lange-251366-unsplash.jpg", "https://res.cloudinary.com/ddwfkdfyx/image/upload/v1551439727/Dogs/marcus-wallis-471436-unsplash.jpg", "https://res.cloudinary.com/ddwfkdfyx/image/upload/v1551439678/Dogs/alexis-chloe-534920-unsplash.jpg"]
ADRESSES_DOGS =["Amadora,  Lisbon", "Queluz, Lisbon", "Chelas, Lisbon", "Olaias, Lisbon", "Xabregas, Lisbon"]
puts 'Creating Dogs...'
5.times do |i|
  animal = Animal.new
  animal.species = "Dog"
  animal.name = Faker::Creature::Dog.name
  animal.age = rand(1..15)
  animal.owner = User.all.sample
  animal.remote_photo_url = IMAGES_DOGS.shift
  animal.description = "#{animal.name} is a #{animal.species} that was born #{animal.age} years ago. #{animal.name} likes long walks on the beach and pina colada."
  animal.address = ADRESSES_DOGS.shift
  animal.save
end

IMAGES_CHIMP = ["https://res.cloudinary.com/ddwfkdfyx/image/upload/v1551439929/Chimps/francesco-ungaro-738063-unsplash.jpg", "https://res.cloudinary.com/ddwfkdfyx/image/upload/v1551439929/Chimps/jamie-haughton-1120556-unsplash.jpg", "https://res.cloudinary.com/ddwfkdfyx/image/upload/v1551439928/Chimps/vincent-van-zalinge-407198-unsplash.jpg", "https://res.cloudinary.com/ddwfkdfyx/image/upload/v1551439920/Chimps/laura-cros-974638-unsplash.jpg", "https://res.cloudinary.com/ddwfkdfyx/image/upload/v1551439915/Chimps/ed-van-duijn-1269692-unsplash.jpg"]
ADRESSES_CHIMP =["Almada, Lisbon", "Joinal , Lisbon", "Santa Maria de Belém, Lisbon", "Carcavelos, Lisbon", "Outeiro da Polima, Lisbon"]
puts 'Creating Chimps...'
5.times do |i|
  animal = Animal.new
  animal.species = "Chimp"
  animal.name = Faker::Name.name
  animal.age = rand(1..15)
  animal.owner = User.all.sample
  animal.remote_photo_url = IMAGES_CHIMP.shift
  animal.description = "#{animal.name} is a #{animal.species} that was born #{animal.age} years ago. #{animal.name} likes long walks on the beach and pina colada."
  animal.address = ADRESSES_CHIMP.shift
  animal.save
end

puts 'Finished!'
