const priceSort = () => {
  if (document.querySelector(".products-index-container")){
    document.getElementById('ascending').addEventListener('click', (event) => {
      let list = document.querySelector(".products-index-container")
      let sorted = [...list.children].sort((a,b)=>parseInt(a.dataset.price,10)>parseInt(b.dataset.price,10)?1:-1)
      sorted.forEach(node=>list.appendChild(node))

    })
    document.getElementById('descending').addEventListener('click', (event) => {
      let list = document.querySelector(".products-index-container")
      let sorted = [...list.children].sort((a,b)=>parseInt(b.dataset.price,10)>parseInt(a.dataset.price,10)?1:-1)
      sorted.forEach(node=>list.appendChild(node))

    })
  }
}
export {priceSort};
