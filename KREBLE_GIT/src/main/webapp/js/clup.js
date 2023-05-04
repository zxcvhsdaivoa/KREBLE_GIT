function setThumbnail(event) {
    var reader = new FileReader();

    reader.onload = function(event) {
      var thumbnail = document.querySelector("div.thumbnail")
      thumbnail.innerHTML="<img>";
      var thumb_img = document.querySelector("div.thumbnail img")
      thumb_img.setAttribute("src", event.target.result);
    };

    reader.readAsDataURL(event.target.files[0]);
}

function back(){
	window.history.back();
}