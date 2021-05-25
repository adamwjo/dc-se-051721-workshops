console.log('%c HI', 'color: firebrick')


const imgUrl = "https://dog.ceo/api/breeds/image/random/4" 
const breedUrl = 'https://dog.ceo/api/breeds/list/all' 

function getImages(){
    fetch(imgUrl)
        .then(res => res.json())
        .then((data) => data.message.forEach(renderImg))
}

getImages()
getBreeds()


const renderImg = (dogImg) => {
    // Make a img tag
    const newImg = document.createElement('img')
    // Update the src attribute with the dogImg
    newImg.src = dogImg
    
    // append it to the document with the id="dog-image-container"
    document.getElementById("dog-image-container").appendChild(newImg)
}


async function getBreeds(){
    const res = await fetch(breedUrl)
    const data = await res.json()

    const breedArr = Object.keys(data.message)

    //loop over breed arr (forEach)

    breedArr.forEach((breed) => {
        // create an Li
        const breedLi = document.createElement('li')
        // update the li with the breedname
        breedLi.innerText = breed
        // tell the li to live on the DOM
        document.getElementById("dog-breeds").appendChild(breedLi)
    })

}

//pass by value

let x = 1
let y = x 

x = 43

console.log(y)


// pass by refrence 
let pojo1 = {name: "adam", age: 28}

pojo1.name = "charlie"

console.log(pojo2)