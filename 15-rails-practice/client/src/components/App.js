import React, { Component } from 'react'

//Components
import Navbar  from './Navbar'
import PokeContainer from './PokeContainer'
import Home from './Home'

export default class App extends Component {

 

  state = {
    display: "Home",
    searchText: "",
    pokemons: []
  }

  // Takes in a new pokemon object and adds it state
  createPokemon = (pokemonObj) => {
    this.setState({pokemons: [pokemonObj, ...this.state.pokemons]})
  }

  // Changes the display to the pokemon container
  changeToPokemon = () => {
    this.setState({display: "Pokemon"})
  }

   // Changes the display to the Home page
  changeToHome = () => {
    this.setState({display: "Home"})
  }

  // Takes in user input from the navbar and sets it to state
  handleSearchText = (data) => {
    this.setState({
      searchText: data
    })
  }

  // Takes in a pokemon and removes it from state 
  deletePokemon = (pokemonObj) => {
    const newPokemons = this.state.pokemons.filter(pokemon=> pokemon.id !== pokemonObj.id)
    this.setState({
      pokemons: newPokemons
    })
  }


  render(){

   const filteredPokemon = this.state.pokemons.filter(poke => poke.name.includes(this.state.searchText))


    return (
      <div className="bg-dark">
        <Navbar handleSearchText={this.handleSearchText} display={this.state.display} changeToHome={this.changeToHome} />
        { this.state.display === "Home" ? <Home changeToPokemon={this.changeToPokemon}/> : null }
        { this.state.display === "Pokemon" ? <PokeContainer /> : null}
      </div>
    )
  }
}



