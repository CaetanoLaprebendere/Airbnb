document.addEventListener('turbolinks:load', function(){
  var location_input = document.getElementById("hello");
  if (location_input){
    location_input.addEventListener("keyup", function(event){
      autocomplete(event)
      // console.log("connected!")
    })
  }

window.globalXHR = new XMLHttpRequest()

function autocomplete(event){
  var input = event.target
  var list = document.getElementById("location_list")
  var min_chars = 0

 if (input.value.length > min_chars) {
  // console.log("helllo")
  window.globalXHR.abort()

  window.globalXHR.onreadystatechange = function(){
    if (this.readyState == 4 && this.status == 200){
      console.log(this);
      response = JSON.parse(this.responseText)
      list.innerHTML = "";
      response.forEach(function(element){
        // console.log(element)
        var option = document.createElement("option") 
        option.value = element  
     

        list.appendChild(option)
      })
    }
  } 

 }
  // console.log(event.target)

    var auth_token = document.querySelector("[name='csrf-token']").content
    window.globalXHR.open("POST", "/search?query=" + input.value, true)
    //allow js to make request to rails server
    window.globalXHR.setRequestHeader("X-CSRF-TOKEN", auth_token)
    // window.globalXHR.setResponseHeader("Content-Type", "application/json; charset=utf-8 ")
    // window.globalXHR.setRequestHeader("Content-Type", "application/json");
    window.globalXHR.setRequestHeader("Accept", "application/json");
    window.globalXHR.send()
}
})
