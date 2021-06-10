import React from 'react'

import ListItem from './ListItem'

const SideBar = (props) => {
 
    return (
        <div>
            <ul className="list-group">
               { props.pokeData.map((poke) => <ListItem key={poke.id} setPoke={props.setPoke} pokemon={poke}/>) }
            </ul>
        </div>
    )
}

export default SideBar
