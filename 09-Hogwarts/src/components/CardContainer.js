import React, { useState } from 'react'

//Components
import PigCard from './PigCard'

const CardContainer = ({ hogData }) => {

    const [hogFilter, setFilter] = useState("All")
    const [hogSort, setSort] = useState("")

    const displayHogs = () => {

        let hogsToDisplay = [...hogData]

        if(hogFilter === "All"){
            hogsToDisplay = hogData
        } else if (hogFilter === "Greased"){
            hogsToDisplay =  hogData.filter(hog => hog.greased)
        }else {
            hogsToDisplay =  hogData.filter(hog => !hog.greased)
        }

        if(hogSort === "Name"){
            return hogsToDisplay.sort((hog1, hog2) => hog1.name > hog2.name ? 1 : -1)
        } else if (hogSort === "Weight"){
            return hogsToDisplay.sort((hog1, hog2) => hog1.weight> hog2.weight? 1 : -1)
        } else {
            return hogsToDisplay
        }
    }
   
    return (
        <div>
            <div className="filter-sort">
                <label htmlFor="hogs">Filter Greasiness:</label>
                <select onChange={(e) => setFilter(e.target.value)} id="hogs">
                    <option>All</option>
                    <option>Greased</option>
                    <option>Dry</option>
                </select>

            <label>
            <input
            type="radio"
            value="Name"
            name="sort"
            checked={hogSort === "Name"}
            onChange={(e) => setSort(e.target.value)}
            />
            Name
        </label>
        <label>
            <input
            type="radio"
            value="Weight"
            name="sort"
            checked={hogSort === "Weight"}
            onChange={(e) => setSort(e.target.value)}
            />
            Weight
        </label>
      <br />
      <label></label>
            </div>

           {displayHogs().map(hog => <PigCard key={hog.id} hogData={hog}/>)}
        </div>
    )
}

export default CardContainer
