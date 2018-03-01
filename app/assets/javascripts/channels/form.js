document.addEventListener('DOMContentLoaded', function(){
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
      var response = JSON.parse(this.responseText)
      console.log(response)
    }
  } 

 }
  // console.log(event.target)


    var auth_token = document.querySelector("[name='csrf-token']").content
    window.globalXHR.open("POST", "/search?query=" + input.value, true)
    //allow js to make request to rails server
    window.globalXHR.setRequestHeader("X-CSRF-TOKEN", auth_token)
    window.globalXHR.send()
}











})
