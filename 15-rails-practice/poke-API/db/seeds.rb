# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

Pokemon.destroy_all

pokemon1 = Pokemon.create({
    name: "Brian", 
    poke_type: "grass", 
    weight: 10, 
    image: "https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/#{rand(1..550)}.png"
    })

pokemon2 = Pokemon.create({
    name:'Kelly', 
    poke_type: "fighting", 
    weight: 10, 
    image: "https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/#{rand(1..550)}.png"
    })

pokemon3 = Pokemon.create({
    name: "Ashley", 
    poke_type: "water", 
    weight: 10, 
    image: "https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/#{rand(1..550)}.png"
    })

pokemon4 = Pokemon.create({
    name: "Luke", 
    poke_type: "fire", 
    weight: 10, 
    image: "https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/#{rand(1..550)}.png"
    })

pokemon5 = Pokemon.create({
    name: "Carl", 
    poke_type: "grass", 
    weight: 10, 
    image: "https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/#{rand(1..550)}.png"
    })