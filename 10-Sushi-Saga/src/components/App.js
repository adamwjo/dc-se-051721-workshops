import React, {useEffect, useState} from "react";
import SushiContainer from "./SushiContainer";
import Table from "./Table";

const API = "http://localhost:3001/sushis";

function App() {

  const [sushis, setSushi] = useState([])
  const [eatenSushi, setEaten] = useState([])
  const [position, setPosition] = useState(0)

  useEffect(async () => {
    const res = await fetch(API)
    const sushiData = await res.json()

    setSushi(sushiData)
  }, [])

  const handeEatSushi = (id) => {
    if(!eatenSushi.includes(id)){
      const newEaten = [...eatenSushi, id]
      setEaten(newEaten)
    }
  }

  return (
    <div className="app">
      <SushiContainer eatSushi={handeEatSushi} sushis={sushis.slice(position, position + 4)}  />
      <Table plates={eatenSushi}/>
    </div>
  );
}

export default App;
