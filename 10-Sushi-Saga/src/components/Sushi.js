import React from "react";

function Sushi({id, img_url, name, price, eatSushi}) {
  return (
    <div className="sushi">
      <div className="plate" onClick={() => eatSushi(id)}>
        {false ? null : (
          <img
            src={img_url}
            alt={name + " Sushi"}
            width="100%"
          />
        )}
      </div>
      <h4 className="sushi-details">
        {name} - ${price}
      </h4>
    </div>
  );
}

export default Sushi;
