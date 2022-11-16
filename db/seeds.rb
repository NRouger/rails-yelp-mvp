# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)
require 'faker'

puts 'Cleaning database'
Restaurant.destroy_all

puts 'Creating restaurants...'

# pizza_napolitana = { name: 'Napoles', address: 'la esquina, Rt 01', phone_number: '0011111' }
# pasta_mia = { name: 'Mamamia', address: 'MidStreet, Rt 1001', phone_number: '6235222' }

# [pizza_napolitana, pasta_mia].each do |attributes|
#   restaurant = Restaurant.create!(attributes)
#   puts "Created #{restaurant.name}"
# end

5.times do
  restaurant = Restaurant.create({
    name: Faker::Restaurant.name,
    address: Faker::Address.street_address,
    phone_number: Faker::PhoneNumber.cell_phone,
    category: Faker::Number.hexadecimal(digits: 3)
    })
    review = Review.new({
      rating: rand(0..5),
      content: Faker::TvShows::BojackHorseman.tongue_twister
      })
      review.restaurant = restaurant
      review.save
      puts "Restaurant with id: #{restaurant.id} has been created. And the review is #{review.content}"
end

puts 'Finished!'
