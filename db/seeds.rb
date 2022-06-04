# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
User.create!(name: "Long Huynh",
    email: "admin@gmail.com",
    password: "123123",
    password_confirmation: "123123"
)

5.times do |n|
    name = "RẠP"
    Room.create!(name: "#{name}-#{n+1}")
end

15.times do |n|
    name = "B"
    room_id = "2"

    Seat.create!(name: "#{name}-#{n+1}",
        room_id: room_id
    )
end

15.times do |n|
    name = "C"
    room_id = "3"

    Seat.create!(name: "#{name}-#{n+1}",
        room_id: room_id
    )
end

15.times do |n|
    name = "D"
    room_id = "4"

    Seat.create!(name: "#{name}-#{n+1}",
        room_id: room_id
    )
end

15.times do |n|
    name = "E"
    room_id = "5"

    Seat.create!(name: "#{name}-#{n+1}",
        room_id: room_id
    )
end