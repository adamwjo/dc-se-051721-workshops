import React, {useEffect, useState} from "react";

//Components
import Header from "./Header";
import PizzaForm from "./PizzaForm";
import PizzaList from "./PizzaList";

const API = "http://localhost:3001/pizzas"
function App() {

  const [pizzas, setPizzas] = useState([])
  const [currentPizza, setCurrent] = useState(null)

  useEffect(() => {
    async function fetchPizzas(){
      const res = await fetch(API)
      const pizzaData = await res.json()
      setPizzas(pizzaData)
    }
    fetchPizzas()
  }, [])

  const selectPizza = id => {
    const newCurrent = pizzas.find((pizzaObj) => pizzaObj.id === id)
    setCurrent(newCurrent)
  }

  const onEditPizza = (name, value) => {
    setCurrent({...currentPizza, [name]:value})
  }

  const setUpdatedPizza = (updatedPizza) => {
    const newPizzas = pizzas.map(pizzaObj => pizzaObj.id === updatedPizza.id ? updatedPizza : pizzaObj)
    setPizzas(newPizzas);
    setCurrent(null)
  }

  return (
    <>
      <Header />
      <PizzaForm setUpdatedPizza={setUpdatedPizza}  onEditPizza={onEditPizza}  currentPizza={currentPizza}/>
      <PizzaList selectPizza={selectPizza} pizzas={pizzas}/>
    </>
  );
}

export default App;
