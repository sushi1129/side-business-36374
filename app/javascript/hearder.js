window.addEventListener('load', function(){

  const pullDownButton = document.getElementById("post-lists")
  const pullDownParents = document.getElementById("post-pull-down")
  const pullDownChild = document.querySelectorAll(".pull_down_post_list")

  pullDownButton.addEventListener('click', function(){
    if (pullDownParents.getAttribute("style") == "display:block;") {
      pullDownParents.removeAttribute("style", "display:block;")
    } else {
      pullDownParents.setAttribute("style", "display:block;")
    }
  })

  pullDownChild.forEach(function(list) {
    list.addEventListener('click', function() {
      const value = list.innerHTML
      console.log(value)
    })
  })
})