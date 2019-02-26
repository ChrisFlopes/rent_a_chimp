puts 'Cleaning database...'
puts 'Cleaning Animals...'
Animal.destroy_all
puts 'Cleaning Users...'
User.destroy_all
puts 'Cleaning Bookings...'
Booking.destroy_all
puts 'Cleaning Reviews...'
Review.destroy_all

puts 'Creating Users...'
restaurants_attributes = []
restaurants_attributes << { email:        'Dishoom',
                            first_name:   '7 Boundary St, London E2 7JE',
                            last_name:    'Buzzy destination for Indian street food in Bombay-style vintage decor.',
                            password:      5,
                          }
]
Restaurant.create!(restaurants_attributes)
puts 'Finished!'
