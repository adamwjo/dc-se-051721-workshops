# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
pokemon1 = Pokemon.create({
    name: Brian, 
    type: "grass", 
    weight: 10, 
    image: "https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/#{rand(1..550)}.png"
    })

pokemon1 = Pokemon.create({
    name: Kelly, 
    type: "fighting", 
    weight: 10, 
    image: "https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/#{rand(1..550)}.png"
    })

pokemon1 = Pokemon.create({
    name: Ashley, 
    type: "water", 
    weight: 10, 
    image: "https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/#{rand(1..550)}.png"
    })

pokemon1 = Pokemon.create({
    name: Luke, 
    type: "fire", 
    weight: 10, 
    image: "https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/#{rand(1..550)}.png"
    })

pokemon1 = Pokemon.create({
    name: Carl, 
    type: "grass", 
    weight: 10, 
    image: "https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/#{rand(1..550)}.png"
    })