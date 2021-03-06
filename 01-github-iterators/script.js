console.log("Hey we're in")

const pokemons = [
    {
      id: 1,
      name: "bulbasaur",
      weight: 110,
      image: "https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/1.png",
      type: "grass"
    },
    {
      id: 2,
      name: "ivysaur",
      weight: 30,
      image: "https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/2.png",
      type: "grass"
    },
    {
      id: 3,
      name: "venusaur",
      weight: 140,
      image: "https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/3.png",
      type: "grass"
    },
    {
      id: 4,
      name: "charmander",
      weight: 10,
      image: "https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/4.png",
      type: "fire"
    },
    {
      id: 5,
      name: "charmeleon",
      weight: 20,
      image: "https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/5.png",
      type: "fire"
    },
    {
      id: 6,
      name: "charizard",
      weight: 30,
      image: "https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/6.png",
      type: "fire"
    },
    {
      id: 7,
      name: "squirtle",
      weight: 20,
      image: "https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/7.png",
      type: "water",
      "bio": "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam"
    },
    {
      id: 8,
      name: "wartortle",
      weight: 20,
      image: "https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/8.png",
      type: "water"
    },
    {
      id: 9,
      name: "blastoise",
      weight: 60,
      image: "https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/9.png",
      type: "water"
    }
]

// Returns an array of EQUAL size of the array you are iterating over 
// function makeComponents(){
//     return pokemons.map(function(poke){
//         const headerEl = document.createElement('h1').innerText = poke.name
//          return headerEl
//     })
// }

// console.log(makeComponents())

const filterPokes = type => pokemons.filter(poke => poke.type === type)
console.log(filterPokes("water"))

// .find()

// .forEach()

function fetchAndDisplayPokemon(){
    //blah blah server call
    pokemons.forEach(renderPoke)
}

function renderPoke(poke){
    // create an element
    const pokeImg = document.createElement('img')

    // update that element with some data
    pokeImg.src = poke.image
    // tell the element to live on the DOM 
    document.getElementById("image-box").appendChild(pokeImg)
}


fetchAndDisplayPokemon()


