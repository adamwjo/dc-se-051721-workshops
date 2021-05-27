let addToy = false;

document.addEventListener("DOMContentLoaded", () => {

  const addBtn = document.querySelector("#new-toy-btn");

  const toyFormContainer = document.querySelector(".container");

  addBtn.addEventListener("click", () => {
    // hide & seek with the form
    addToy = !addToy;


    if (addToy) {

      toyFormContainer.style.display = "block";

    } else {
      toyFormContainer.style.display = "none";
    }
  });
});
getData()
handleNewToy()



// 1.) Fetch the toy Data, and render a "card" for each toy in 
// the dataSet. 
async function getData(){
  let response = await fetch("http://localhost:3000/toys")
  let toyData = await response.json()

  toyData.forEach(renderToy)
}

function renderToy(toy){

  const toyCard = document.createElement('div')
  toyCard.className = "card"

  const toyName = document.createElement('h2')
  toyName.innerText = toy.name 

  const toyImg = document.createElement('img')
  toyImg.src = toy.image
  toyImg.className =  "toy-avatar" 

  const likes = document.createElement('p')
  likes.innerText = toy.likes + " Likes"


  const toyBtn = document.createElement('button')
  toyBtn.innerText = "Like ❤️"
  toyBtn.className = "like-btn"

  toyBtn.addEventListener("click", () => {
    //increment that toy's likes
    toy.likes++ 
    // console.log(+likes.innerText.split(" ")[0])

    //make a object that contains a key/value that matches
    //the attr we are trying to update
    const newLikes = {
      likes: toy.likes
    }
    //Send the obj to the server
    fetch(`http://localhost:3000/toys/${toy.id}`, {
      headers: {"Content-Type": "application/json"},
      method: "PATCH",
      body: JSON.stringify(newLikes)
    }).then(r => r.json())
    .then((updatedToy) => likes.innerText = updatedToy.likes + " Likes")
  })
  // Put together the card
  toyCard.append(toyName, toyImg, likes, toyBtn)

  // Put the card on the DOM  
  document.getElementById("toy-collection").appendChild(toyCard)
}

  // 2.) use the toy form to create a new toy in the backend, and display that toy
  //     on the DOM
  function handleNewToy(){
    // grab the toy form and add an eventListener (submit)
    document.querySelector(".add-toy-form").addEventListener('submit', (event) => {
      event.preventDefault()
      
      //Grab the values from the form
      //Make a new toy with those values name, image, 0 likes
      const newToy = {}
      newToy.name = event.target.toyName.value
      newToy.image = event.target.image.value
      newToy.likes = 0

      const reqObj = {
        headers: {"Content-Type": "application/json"},
        method: "POST",
        body: JSON.stringify(newToy)
      }
      
      console.log(newToy)
      //Send those values to the server
      fetch("http://localhost:3000/toys", reqObj)
        .then(r => r.json())
        .then(renderToy)

      //Take the server resp (newToy) show it on the DOM renderToy(newToy)
    })
  }

  // 3.) Click on a toys like button, and increment that toys like by one BOTH
  //     on the DOM and the backend. 
