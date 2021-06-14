import React, { useState } from 'react'

const PigCard = ({ hogData }) => {

    const [flipped, setCard] = useState(false)

   
    return (
        <div onClick={() => setCard(!flipped)} className="pigTile">
            {flipped ? null : 
            <> 
            <img src={hogData.image}/>
            <h3>{hogData.name}</h3>
            </>
            }
           

            {flipped ? <ul>
                <li>greased: {hogData.greased ? "all greased up" : "needs some oil"}</li>
                <li>medal: {hogData["highest medal achieved"]}</li>
                <li>specialty: {hogData.specialty}</li>
                <li>weight: {hogData.weight} hogLbs</li>
            </ul> : null}
            

        </div>
    )
}

export default PigCard
