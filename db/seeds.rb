require 'faker'

puts 'Cleaning database...'
puts 'Cleaning Animals...'
Animal.destroy_all
puts 'Cleaning Users...'
User.destroy_all
puts 'Cleaning Bookings...'
Booking.destroy_all
puts 'Cleaning Reviews...'
Review.destroy_all

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

puts 'Creating Animals...'
25.times do |i|
  animal = Animal.new
  animal.species = %w[Chimp Cat Dog Camel].sample
  animal.name = Faker::TvShows::Simpsons.character
  animal.age = rand(1..30)
  animal.owner = User.all.sample
  animal.remote_photo_url = "https://c1.staticflickr.com/3/2616/4054759019_122957f28f_b.jpg"
  animal.save
end

puts 'Finished!'
