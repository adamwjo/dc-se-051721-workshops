

puts "Deleting Pokemon"
Pokemon.destroy_all

puts "Deleting Trainers"
Trainer.destroy_all

puts "Deleting pokeballs"
Pokeball.destroy_all

puts "Creating Pokemon"
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

trainer1 = Trainer.create({
    name: "Brock",
    image: "https://static.wikia.nocookie.net/leonhartimvu/images/6/68/Spr_FRLG_Team_Rocket_Grunt_F.png/revision/latest/scale-to-width-down/34?cb=20190811181137"
})

trainer2 = Trainer.create({
    name: "Misty",
    image: "https://static.wikia.nocookie.net/leonhartimvu/images/8/85/Spr_FRLG_Team_Rocket_Grunt_M.png/revision/latest/scale-to-width-down/64?cb=20181106114140"
})



pokeball1 = Pokeball.create({
    pokemon_id: Pokemon.all.sample.id,
    trainer_id: Trainer.all.sample.id,
    ball_type: "regular"
})

pokeball2 = Pokeball.create({
    pokemon_id: Pokemon.all.sample.id,
    trainer_id: Trainer.all.sample.id,
    ball_type: "regular"
})

pokeball3 = Pokeball.create({
    pokemon_id: Pokemon.all.sample.id,
    trainer_id: Trainer.all.sample.id,
    ball_type: "regular"
})

pokeball4 = Pokeball.create({
    pokemon_id: Pokemon.all.sample.id,
    trainer_id: Trainer.all.sample.id,
    ball_type: "regular"
})