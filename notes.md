Building a class and constructor for Sneaker

Create sneaker.js and write Sneaker class function

Within function write constructor for sneaker data and attributes

Data will be pushed to the Sneaker.all array and data will be stored

class Sneaker {
    constructor(sneaker, sneakerAttributes) {
      this.id = sneaker.id;
      this.name = sneakerAttributes.name;
      this.description = sneakerAttributes.description;
      this.image_url = sneakerAttributes.image_url;
      this.category = sneakerAttributes.category;
      Sneaker.all.push(this);
    }
  
    renderSneakerCard() {
      return `
        <div data-id=${this.id}>
            <img src=${this.image_url} height="200" width="250">
            <h3>${this.name}</h3>
            <p>${this.category.name}</p>
            <button data-id=${this.id}>edit</button>
        </div>
        <br><br>`;
    }
}
  
Sneaker.all = [];


Refactoring for OOJS

index.js file

Refactoring for getSneakers function

// function getSneakers() {
//   fetch(endPoint)
//   .then(response => response.json())
//   .then(sneakers => {
//     sneakers.data.forEach(sneaker => {
//       // create a new instance of the Syllabus class for every syllabus in the array from the DB (remember how our data is nested)
//       let newSneaker = new Sneaker(sneaker, sneaker.attributes)

//       // call renderSyllabusCard() located in Syllabus class
//       document.querySelector('#sneaker-container').innerHTML += newSneaker.renderSneakerCard();
//     })
//   })
// }

Refactoring for postSneaker function

function postSneaker(name, description, image_url, category_id) {
//   // build my body object outside of my fetch
//   const bodyData = {name, description, image_url, category_id}

//   fetch(endPoint, {
//     // POST request
//     method: "POST",
//     headers: {"Content-Type": "application/json"},
//     body: JSON.stringify(bodyData)
//   })
//   .then(response => response.json())
//   .then(sneaker => {
//     console.log(sneaker);
//     const sneakerData = sneaker.data
//     let newSneaker = new Sneaker(sneakerData, sneakerData.attributes)

//     // call renderSyllabusCard() located in Syllabus class
//     document.querySelector('#sneaker-container').innerHTML += newSneaker.renderSneakerCard();
//   })
// }