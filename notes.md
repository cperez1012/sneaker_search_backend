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
//       // create a new instance of the Sneaker class for every sneaker in the array from the DB (remember how our data is nested)
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

//     // call renderSneakerCard() located in Sneaker class
//     document.querySelector('#sneaker-container').innerHTML += newSneaker.renderSneakerCard();
//   })
// }

Clicking the edit and show form

Index.js is shown as the parent of the Sneaker class

-----------------------------------------------------

index.js (Before Ayana's Assitance)

const endPoint = "http://localhost:3000/api/v1/sneakers"

document.addEventListener('DOMContentLoaded', () => {
  // fetch and load sneakers
  console.log("DOM is Loaded");
  getSneakers()

  const createSneakerForm = document.querySelector("#create-sneaker-form")

  createSneakerForm.addEventListener("submit", (e) => createFormHandler(e))

  const sneakerContainer = document.querySelector('#sneaker-container')
  // render edit form once its clicked
  sneakerContainer.addEventListener("click", e => {
    const id = parseInt(e.target.dataset.id);
    const sneaker = Sneaker.findById(id);
    // console.log(sneaker);
    document.querySelector('#update-sneaker').innerHTML = sneaker.renderUpdateForm();
    // This is the associated instance 
  });
  document.querySelector('#update-sneaker').addEventListener("click", e => updateFormHandler(e))
})

function getSneakers() {
  fetch(endPoint)
  .then(response => response.json())
  .then(sneakers => {
    sneakers.data.forEach(sneaker => {
        //  
        // double check how your data is nested in the console so you can successfully access the attributes of each individual object
        // const sneakerMarkup = `
        //   <div data-id=${sneaker.id}>
        //     <img src=${sneaker.attributes.image_url} height="200" width="250">
        //     <h3>${sneaker.attributes.name}</h3>
        //     <p>${sneaker.attributes.category.name}</p>
        //     <button data-id=${sneaker.id}>edit</button>
        //   </div>
        //   <br><br>`;

        //   document.querySelector('#sneaker-container').innerHTML += sneakerMarkup
        let newSneaker = new Sneaker(sneaker, sneaker.attributes)
        //  
        document.querySelector('#sneaker-container').innerHTML += newSneaker.renderSneakerCard();
        // render(sneaker)
        //  
      })
      // .catch(err => console.log(err))
    })
}

// function render(sneaker) {
//   const sneakerMarkup = `
//     <div data-id=${sneaker.id}>
//       <img src=${sneaker.attributes.image_url} height="200" width="250">
//       <h3>${sneaker.attributes.name}</h3>
//       <p>${sneaker.attributes.category.name}</p>
//       <button data-id=${sneaker.id}>edit</button>
//     </div>
//   <br><br>`;

//   document.querySelector('#sneaker-container').innerHTML += sneakerMarkup;
// }

function createFormHandler(e) {
  e.preventDefault()
  const nameInput = document.querySelector('#input-name').value
  const descriptionInput = document.querySelector('#input-description').value
  const imageInput = document.querySelector('#input-url').value
  const categoryId = parseInt(document.querySelector('#categories').value)
  postSneaker(nameInput, descriptionInput, imageInput, categoryId)
}

function postSneaker(name, description, image_url, category_id) {
  // confirm these values are coming through properly
  // build body object
  
  const bodyData = {name, description, image_url, category_id}

  fetch(endPoint, {
    // POST request
    method: "POST",
    headers: {"Content-Type": "application/json"},
    body: JSON.stringify(bodyData)
  })
  .then(response => response.json())
  .then(sneaker => {
    console.log(sneaker)
    const sneakerData = sneaker.data

    // render JSON response
    // const sneakerMarkup = `
    // <div data-id=${sneaker.id}>
    //   <img src=${sneakerData.attributes.image_url} height="200" width="250">
    //   <h3>${sneakerData.attributes.name}</h3>
    //   <p>${sneakerData.attributes.category.name}</p>
    //   <button data-id=${sneakerData.attributes.id}>edit</button>
    // </div>
    // <br><br>`;

    // document.querySelector('#sneaker-container').innerHTML += sneakerMarkup;
    // render(sneakerData)
    // Using the newSneaker defined variable in my post request and changing it to sneakerData
    //  
    let newSneaker = new Sneaker(sneakerData, sneakerData.attributes)
    //  
       
    document.querySelector('#sneaker-container').innerHTML += newSneaker.renderSneakerCard();  
  })

  function updateFormHandler(e) {
    e.preventDefault();
    const id = parseInt(e.target.dataset.id)
    const sneaker = Sneaker.findById(id)
    const name = e.target.querySelector('#input-name').value
    const description = e.target.querySelector('#input-description').value
    const image_url = e.target.querySelector('#input-url').value
    const category_id = parseInt(e.target.querySelector('#categories').value)
    patchSneaker(sneaker, name, description, image_url, category_id)
  }

  function patchSneaker(sneaker, name, description, image_url, category_id) {
    const bodyJSON = { name, description, image_url, category_id }
    fetch(`http://localhost:3000/api/v1/sneakers/${sneaker.id}`, {
      method: "PATCH",
      headers: {
        "Content-Type": "application/json",
        "Accept": "application/json",
      },
      body: JSON.stringify(bodyJSON),
    })
      .then(response => response.json())
      // our backend responds with the updated sneaker instance represented as JSON
      .then(updatedNote => console.log(updatedNote))
  }
}

----------------------------------------------

sneaker.js

class Sneaker {
    // This code allows us to only see the sneaker data but attributes are shown as undefined because the data is nested under attributes
    // constructor(data) {
    //     this.id = data.id
    //     this.name = data.name
    //     this.description = data.description
    //     this.image_url = data.image_url
    //     this.category = data.category
    // }
    // We give two arguments, one for the sneaker data and the other for the sneaker attributes (we can call it whatever we want so we chose sneakerAttributes)
    constructor(sneaker, sneakerAttributes) {
        this.id = sneaker.id
        //  
        this.name = sneakerAttributes.name
        this.description = sneakerAttributes.description
        this.image_url = sneakerAttributes.image_url
        this.category = sneakerAttributes.category
         
        Sneaker.all.push(this)
        console.log(this)
        //  
        // Push all instances of this to the array
    }
    // The constructor allowed us to use this to pass in the sneaker attributes defined above
    renderSneakerCard() {
        //  
        // console.log(this)
        // return `
        //   <div data-id=${this.id}>
        //       <img src=${this.image_url} height="200" width="250">
        //       <h3>${this.name}</h3>
        //       <p>${this.category.name}</p>
        //       <button data-id=${this.id}>edit</button>
        //   </div>
        //   <br><br>`;
          
          return `
          <div class="col-md-4">
            <div class="card mb-4 shadow-sm">
              <img src=${this.image_url} class="card-img-top" alt="...">
              <div class="card-body">
                <h5 class="card-title">${this.name}</h5>
                <p class="card-text">${this.description}</p>
                <div class="d-flex justify-content-between align-items-center">
                  <div class="btn-group">
                    <button type="button" class="btn btn-sm btn-outline-secondary">View</button>
                    <button type="button" class="btn btn-sm btn-outline-secondary">Edit</button>
                  </div>
                  <small class="text-muted">Category: ${this.category.name}</small>
                </div>
              </div>
            </div>
          </div>
          `
    }
    static findById(id) {
        return this.all.find(sneaker => sneaker.id === id);
    }

    renderUpdateForm() {
        return `
        <form data-id=${this.id}>
            <h3>Edit a Sneaker!</h3>
            
            <label>Sneaker Name</label>
            <input id='input-name' type="text" name="name" value="${this.name}" class="input-text">
            <br><br>

            <label>Sneaker Description</label>
            <text area id='input-description' name="description" rows="8"  cols="80" value="">${this.description}</textarea>
            <br><br>

            <label>Image URL</label>
            <input id='input-url' type="text" name="image" value="${this.image_url}" class="input-text">
            <br><br>

            <label>Sneaker Category</label>
            <select id='input-categories' type="text" name="categories" value="${this.category.name}">
                <option value="1">Basketball</option>
                <option value="2">Lifestyle</option>
                <option value="3">Running</option>
            </select>
            <br><br>

            <input id='edit button' type="submit" name="submit" value="Edit Sneaker" class="submit">
        </form>

        ` 
    }
}



Sneaker.all = [];

------------------------------------------

index.html

<!DOCTYPE html>
<html lang="en" dir="ltr">
  <head>
    <meta charset="utf-8">
    <title></title>
    <script type="text/javascript" src="src/sneaker.js"></script>
    <script type="text/javascript" src="src/index.js"></script>
  </head>
  <body>

    <div class="form-container">

      <form id="create-sneaker-form" style="">
        <h3>Catalog Your Sneakers!</h3>
    
        <input id='input-name' type="text" name="name" value="" placeholder="Enter your sneaker name..." class="input-text">
        <br><br>
        <textarea id='input-description' name="description" rows="8" cols="80" value="" placeholder="Enter your sneaker description..."></textarea>
        <br><br>
        <input id='input-url' type="text" name="image" value="" placeholder="Enter your sneaker image URL..." class="input-text">
        <br><br>
    
        <p>Select the appropiate Sneaker Category</p>
        <select id="categories" name="categories">
          <option value="1">Basketball</option>
          <option value="2">Lifestyle</option>
          <option value="3">Running</option>
        </select>
        <br><br>
    
        <input id= 'create-button' type="submit" name="submit" value="Create New Sneaker Data" class="submit">
      </form>
    
    </div>

    <br><br>
    <div id="sneaker-container">
 

    </div>

    <div id="update-sneaker">

    </div>
  </body>
</html>

