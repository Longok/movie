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

# Room
5.times do |n|
    name = "RẠP"
    Room.create!(name: "#{name}-#{n+1}")
end

# Seat
20.times do |n|
    name = "A"
    room_id = "1"

    Seat.create!(name: "#{name}-#{n+1}",
        room_id: room_id
    )
end

20.times do |n|
    name = "B"
    room_id = "2"

    Seat.create!(name: "#{name}-#{n+1}",
        room_id: room_id
    )
end

20.times do |n|
    name = "C"
    room_id = "3"

    Seat.create!(name: "#{name}-#{n+1}",
        room_id: room_id
    )
end

20.times do |n|
    name = "D"
    room_id = "4"

    Seat.create!(name: "#{name}-#{n+1}",
        room_id: room_id
    )
end

20.times do |n|
    name = "E"
    room_id = "5"

    Seat.create!(name: "#{name}-#{n+1}",
        room_id: room_id
    )
end

# Movie
cinema1 = Cinema.create!(name: "Bat Man",
    year: "2021",
    time: "160"
)
cinema1.image.attach(io: File.open(Rails.root.join('app/assets/images/batman.jpg')), filename: 'batman.jpg')

cinema2 = Cinema.create!(name: "JURASSIC WORLD DOMINION",
    year: "2022",
    time: "150"
)
cinema2.image.attach(io: File.open(Rails.root.join('app/assets/images/jura.jpg')), filename: 'jura.jpg')

cinema3 = Cinema.create!(name: "Trịnh Công Sơn",
    year: "2022",
    time: "120"
)
cinema3.image.attach(io: File.open(Rails.root.join('app/assets/images/trinhcongson.jpg')), filename: 'trinhcongson.jpg')

cinema4 = Cinema.create!(name: "Spider Man",
    year: "2022",
    time: "140"
)
cinema4.image.attach(io: File.open(Rails.root.join('app/assets/images/spiderman.jpg')), filename: 'spiderman.jpg')

