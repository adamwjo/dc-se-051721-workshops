import React, { useState } from 'react'

const Form = ({ addNewPokemon }) => {
    const [name, setName] = useState("")
    const [weight, setWeight] = useState(0)
    const [type, setType] = useState("")
    const [sprite, setSprite] = useState("")
    const [description, setDescription] = useState("")


    const submitHandler = async (e) => {
        e.preventDefault()
           
        const newPokemon = { name, weight, sprite, type, description }

        //Make a reqObj
        const reqObj = {}
        reqObj.headers = {"Content-Type": "application/json"}
        reqObj.method = "POST"
        reqObj.body = JSON.stringify(newPokemon)

        const res = await fetch("http://localhost:3000/pokemon", reqObj)
        const newPokeData = await res.json()

        addNewPokemon(newPokeData);
    }

    return (
            <form onSubmit={submitHandler} className="form-inline ml-4">
                <input value={name} onChange={(e) => setName(e.target.value)} type="text" className="form-control mb-2 mr-sm-2" placeholder="Pokemon Name"/>

                <div className="input-group mb-2 mr-sm-2">
                    <input value={sprite} onChange={(e) => setSprite(e.target.value)} type="text" className="form-control" placeholder="image URL"/>
                </div>

                <div className="input-group mb-2 mr-sm-2">
                    <select value={type} onChange={(e) => setType(e.target.value)} className="custom-select my-1 mr-sm-2">
                        <option >Choose Type...</option>
                        <option >Fire</option>
                        <option >Water</option>
                        <option >Psychic</option>
                        <option >Grass</option>
                        <option>Electric</option>
                    </select>
                </div>

                <div className="input-group mb-2 mr-sm-2">
                    <input value={weight} onChange={(e) => setWeight(e.target.value)} type="number" className="form-control" placeholder="weight"/>
                </div>

                <div className="input-group mb-2 mr-sm-2">
                    <input value={description} onChange={(e) => setDescription(e.target.value)} type="text-area" className="form-control" placeholder="description"/>
                </div>

                <button type="submit" className="btn btn-primary mb-2">Submit</button>
            </form>
    )
}

export default Form
// export default class Form extends Component {

//     state = {
//         name: "",
//         weight: 0,
//         sprite: "",
//         type: "",
//         description: ""
//     }

//     submitHandler = (e) => {
//         e.preventDefault()
        

  
       
//         //POST ---- /pokemon (index)
//         fetch("http://localhost:3001/pokemon", reqObj)
//             .then(res => res.json())
//             .then((newPokemon) => {
//                 this.props.createPokemon(newPokemon)
//                 this.setState({
//                     name: "",
//                     weight: 0,
//                     sprite: "",
//                     type: "",
//                     description: ""
//                 })
//             })

//     } 

