function setThumbnail(event) {
    var reader = new FileReader();

    reader.onload = function(event) {
      var thumbnail = document.querySelector("div.thumbnail")
      thumbnail.innerHTML="<span class='thumb'><img></span>";
      var thumb_img = document.querySelector("div.thumbnail .thumb img")
      thumb_img.setAttribute("src", event.target.result);
    };

    reader.readAsDataURL(event.target.files[0]);
}

function back(){
	window.history.back();
}