import React, { useState, useEffect, Component } from 'react'

// Components
import Display from './Display'
import SideBar from './SideBar'
import SearchBar from './SearchBar'
import Form from './Form'

const BASE_URL = "http://localhost:3000/pokemon/"

const MainContainer = () => {
    const [currentPoke, setPoke] = useState(null)
    const [pokemons, setPokemons] = useState([])
    const [searchText, setSearch] = useState("")
    const [compareArr, setCompare] = useState([])

    const handleSearch = (e) => {
        setSearch(e.target.value)
    }

    const displayPokemon = () => pokemons.filter(p => p.name.toLowerCase().includes(searchText.toLowerCase()))

    useEffect(async () => {
        const res = await fetch(BASE_URL)
        const pokeData = await res.json()
        setPokemons(pokeData)
    }, [])

    const addNewPokemon = (newPoke) => setPokemons([newPoke, ...pokemons])


    return (
        <div className="container">
            <SearchBar handleSearch={handleSearch}/>
            <Form addNewPokemon={addNewPokemon} />
            <div className="row mt-3">
                <div className="col-sm">
                    <SideBar 
                        pokeData={displayPokemon()}
                        setPoke={setPoke}
                    />
                </div>
                <div className="col-sm">
                   { currentPoke ? <Display pokemon={currentPoke} /> : null }
                </div>
            </div>
        </div>
    )
}
export default MainContainer