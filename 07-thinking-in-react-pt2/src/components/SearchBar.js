import React from 'react'

const SearchBar = ({ handleSearch }) => {
    return (
        <input onChange={handleSearch} type="text" className="form-control mt-3"  placeholder="Enter a name...."></input>
    )
}
export default SearchBar