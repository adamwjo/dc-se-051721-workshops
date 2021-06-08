import React, { useState } from 'react'
import pokemons from '../data/pokemon'

// Components
import Display from './Display'
import SideBar from './SideBar'
const MainContainer = () => {

    const [currentPoke, setPoke] = useState(null)

    return (
        <div>
            <div className="row mt-3">

                <div className="col-sm">
                    <SideBar 
                        pokeData={pokemons}
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
