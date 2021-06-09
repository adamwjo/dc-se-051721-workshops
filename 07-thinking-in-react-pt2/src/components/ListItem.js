import React from 'react'

export const ListItem = ({ pokemon, setPoke }) => (
            <li onClick={() => setPoke(pokemon)} className="list-group-item">{pokemon.name}</li>
    ) 

export default ListItem
