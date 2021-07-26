# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

puts "Seeding JT Songs..."
Song.create!([
  {
    name: "Rock Your Body",
    youtube_link: "https://youtu.be/TSVHoHyErBQ"
  },
  {
    name: "SexyBack",
    youtube_link: "https://youtu.be/3gOHvDP_vCs"
  },
  {
    name: "Senorita",
    youtube_link: "https://youtu.be/nJHYDkvRB2Y"
  },
  {
    name: "Like I Love You",
    youtube_link: "https://youtu.be/FQ3slUz7Jo8"
  },
  {
    name: "Cry Me A River",
    youtube_link: "https://youtu.be/DksSPZTZES0"
  },
  {
    name: "My Love",
    youtube_link: "https://youtu.be/xjpe7EGyiw8"
  },
])

puts "Seeding stans..."
SuperFan.create!([
  {
    name: "Arthur",
    years_of_fandom: 5,
    song_id: Song.ids.sample
  },
  {
    name: "Brendan",
    years_of_fandom: 20,
    song_id: Song.ids.sample
  },
  {
    name: "Darren",
    years_of_fandom: 15,
    song_id: Song.ids.sample
  },
  {
    name: "Jack",
    years_of_fandom: 8,
    song_id: Song.ids.sample
  },
  {
    name: "Lucy",
    years_of_fandom: 1,
    song_id: Song.ids.sample
  },
  {
    name: "Nisa",
    years_of_fandom: 2,
    song_id: Song.ids.sample
  },
  {
    name: "Shev",
    years_of_fandom: 10,
    song_id: Song.ids.sample
  },
  {
    name: "Carlos",
    years_of_fandom: 5,
    song_id: Song.ids.sample
  },
  {
    name: "Adrienne",
    years_of_fandom: 5,
    song_id: Song.ids.sample
  },
  {
    name: "Adreena",
    years_of_fandom: 5,
    song_id: Song.ids.sample
  }
])

puts "Creating reviews..."
Song.all.each do |song|
  rand(1..5).times do
    # get a random SuperFan
    super_fan = SuperFan.find(SuperFan.pluck(:id).sample)

    Review.create!(super_fan_id: super_fan.id, song_id: song.id, rating: rand(1..10), comment: "gibberish")
  end
end

puts "Done seeding!"
