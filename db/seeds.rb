# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
User.create!(name: "admin",
    email: "longadmin@gmail.com",
    password: "123123",
    password_confirmation: "123123"
)


5.times do |n| 
    name = "longtest#{n+1}"
    email = "longtest-#{n+1}@gmail.com"
    password = "123123"

    User.create!(name: name,
        email: email,
        password: password,
        password_confirmation: password
    )
end

# Room
5.times do |n|
    name = "RẠP"
    Room.create!(name: "#{name}-#{n+1}")
end

# Seat
40.times do |n|
    name = "A"
    room_id = "1"

    Seat.create!(name: "#{name}#{n+1}",
        room_id: room_id
    )
end

40.times do |n|
    name = "B"
    room_id = "2"

    Seat.create!(name: "#{name}#{n+1}",
        room_id: room_id
    )
end

40.times do |n|
    name = "C"
    room_id = "3"

    Seat.create!(name: "#{name}#{n+1}",
        room_id: room_id
    )
end

40.times do |n|
    name = "D"
    room_id = "4"

    Seat.create!(name: "#{name}#{n+1}",
        room_id: room_id
    )
end

40.times do |n|
    name = "E"
    room_id = "5"

    Seat.create!(name: "#{name}#{n+1}",
        room_id: room_id
    )
end

# Movie
film1 = Film.create!(name: "Bat Man",
    year: "2021",
    time: "160"
)
film1.image.attach(io: File.open(Rails.root.join('app/assets/images/batman.jpg')), filename: 'batman.jpg')

film2 = Film.create!(name: "JURASSIC WORLD DOMINION",
    year: "2022",
    time: "150"
)
film2.image.attach(io: File.open(Rails.root.join('app/assets/images/jura.jpg')), filename: 'jura.jpg')

film3 = Film.create!(name: "Trịnh Công Sơn",
    year: "2022",
    time: "120"
)
film3.image.attach(io: File.open(Rails.root.join('app/assets/images/trinhcongson.jpg')), filename: 'trinhcongson.jpg')

film4 = Film.create!(name: "Spider Man",
    year: "2022",
    time: "140"
)
film4.image.attach(io: File.open(Rails.root.join('app/assets/images/spiderman.jpg')), filename: 'spiderman.jpg')

#Showtime
10.times do |n|
    time = Faker::Time.between(from: DateTime.now - 1, to: DateTime.now, format: :long)
    room_id = rand(1..5)
    film_id = rand(1..4)

    Showtime.create!(time: time,
        room_id: room_id,
        film_id: film_id
    )
end
# AdminUser.create!(email: 'admin@gmail.com', password: '123123', password_confirmation: '123123') if Rails.env.production?
AdminUser.create!(email: 'admin@gmail.com', password: '123123', password_confirmation: '123123') if Rails.env.development?