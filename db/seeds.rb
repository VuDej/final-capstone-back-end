# frozen_string_literal: true
# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

Car.create(car_type: "Sedan", price_per_day: 54, transmission: "auto", description: "Loren ipsum something", photo:"https://pngroyale.com/wp-content/uploads/2022/04/Peugeot-PNG-Background-Image-768x427.png", car_model: "Peugoet", user_id: 1)
Car.create(car_type: "Sedan", price_per_day: 50, transmission: "auto", description: "Loren ipsum something", photo:"https://pngroyale.com/wp-content/uploads/2022/02/honda-car-honda-fit-specs-price-mpg-reviews-carsm-.png", car_model: "Honda", user_id: 1)
Car.create(car_type: "Coupe", price_per_day: 65, transmission: "auto", description: "Loren ipsum something", photo:"https://pngroyale.com/wp-content/uploads/2022/02/honda-car-honda-specs-trims-colors-carsm-.png", car_model: "Honda", user_id: 1)
Car.create(car_type: "Sport-car", price_per_day: 77, transmission: "automatic-manual", description: "Loren ipsum something", photo:"https://pngroyale.com/wp-content/uploads/2022/02/lamborghini-car-png-carspart--768x318.png", car_model: "Lamborghini", user_id: 1)
Car.create(car_type: "Sport-car", price_per_day: 80, transmission: "auto", description: "Loren ipsum something", photo:"https://pngroyale.com/wp-content/uploads/2022/04/Lamborghini-PNG-Picture-768x300.png", car_model: "Lamborghini", user_id: 1)

puts "DB was seeded successfully!"
