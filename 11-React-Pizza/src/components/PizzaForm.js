import React from "react";

function PizzaForm({ currentPizza, onEditPizza, setUpdatedPizza }) {

  if(!currentPizza){return null}

  const { id, topping, size, vegetarian } = currentPizza

  const handleSubmit = async (e) => {
    e.preventDefault()
    const reqObj = {
      method: "PATCH",
      headers: {"Content-Type": "application/json"},
      body: JSON.stringify(currentPizza)
    }

    const res = await fetch("http://localhost:3001/pizzas/"+id ,reqObj)
    const updatedPizza = await res.json()
    setUpdatedPizza(updatedPizza);
  }

  return (
    <form onSubmit={handleSubmit}>
      <div className="form-row">
        <div className="col-5">
          <input
            className="form-control"
            type="text"
            name="topping"
            value={topping}
            onChange={(e) => onEditPizza(e.target.name, e.target.value)}
            placeholder="Pizza Topping"
          />
        </div>
        <div className="col">
          <select value={size} onChange={(e) => onEditPizza(e.target.name, e.target.value)} className="form-control" name="size">
            <option value="Small">Small</option>
            <option value="Medium">Medium</option>
            <option value="Large">Large</option>
          </select>
        </div>
        <div className="col">
          <div className="form-check">
            <input
              className="form-check-input"
              type="radio"
              name="vegetarian"
              checked={vegetarian}
              onChange={(e) => onEditPizza(e.target.name, e.target.value === "Vegetarian")}
              value="Vegetarian"
            />
            <label className="form-check-label">Vegetarian</label>
          </div>
          <div className="form-check">
            <input
              className="form-check-input"
              type="radio"
              name="vegetarian"
              checked={!vegetarian}
              onChange={(e) => onEditPizza(e.target.name, e.target.value  === "Vegetarian")}
              value="Not Vegetarian"
            />
            <label className="form-check-label">Not Vegetarian</label>
          </div>
        </div>
        <div className="col">
          <button type="submit" className="btn btn-success">
            Submit
          </button>
        </div>
      </div>
    </form>
  );
}

export default PizzaForm;
