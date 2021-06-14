import React from "react";

//Components
import Nav from "./Nav";
import CardContainer from './CardContainer'

import hogs from "../porkers_data";

function App() {
  return (
    <div className="App">
      <Nav />
      <CardContainer hogData={hogs}/>
    </div>
  );
}

export default App;
