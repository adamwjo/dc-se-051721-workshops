import React from 'react'

export default function Display({pokemon}) {
    const { name, sprite, description } = pokemon

    return (
           <div className="card text-center">
                    <div className="card-header">
                        Featured
                    </div>
                    <img src={sprite} class="card-img-top" alt="..." />
                    <div className="card-body">
                        <h5 className="card-title">{name}</h5>
                        <p className="card-text">{description}</p>
                        <a href="#" className="btn btn-primary">Go somewhere</a>
                    </div>
                    <div className="card-footer text-muted">
                        2 days ago
                    </div>
            </div>
    )
}
