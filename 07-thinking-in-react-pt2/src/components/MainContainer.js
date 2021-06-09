import React, { useState } from 'react'
import pokeData from '../data/pokemon'
// Components
import Display from './Display'
import SideBar from './SideBar'
import SearchBar from './SearchBar'
const MainContainer = () => {
    const [currentPoke, setPoke] = useState(null)
    const [pokemons, setPokemons] = useState(pokeData)
    const [searchText, setSearch] = useState("")
    const [compareArr, setCompare] = useState([])
    const handleSearch = (e) => {
        setSearch(e.target.value)
    }
    const displayPokemon = () => pokemons.filter(p => p.name.toLowerCase().includes(searchText.toLowerCase()))
    return (
        <div className="container">
            <SearchBar handleSearch={handleSearch}/>
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