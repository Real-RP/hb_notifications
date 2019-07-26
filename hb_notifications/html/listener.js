$(function(){
	window.onload = (e) => {
		window.addEventListener('message', (event) => {
			var item = event.data;
			if (item !== undefined && item.type === "message") {
				if (item.display !== true) {
                    $("#message").hide(1000);
                    $("#message-top-right").hide(1000);
                    $("#message-top-middle").hide(1000);
                    $("#message-middle-middle").hide(1000);
                    $("#message-middle-left").hide(1000);
                    $("#message-middle-right").hide(1000);
                    $("#message-bottom-middle").hide(1000);
                    $("#message-bottom-left").hide(1000);
                    $("#message-bottom-right").hide(1000);
					
					
				} else if (item.position === 'top-left') {
                    $("#message").show(250);
                    $("#box").show(250);
				} else if (item.position === 'top-right') {
                    $("#message-top-right").show(250);
					$("#box").show(250);
                } else if (item.position === 'top-middle') {
					$("#message-top-middle").show(250);
					$("#box").show(250);
				} else if (item.position === 'middle-middle') {
					$("#message-middle-middle").show(250);
					$("#box").show(250);
				} else if (item.position === 'middle-left') {
					$("#message-middle-left").show(250);
					$("#box").show(250);
				} else if (item.position === 'middle-right') {
					$("#message-middle-right").show(250);
					$("#box").show(250);
				} else if (item.position === 'bottom-middle') {
					$("#message-bottom-middle").show(250);
					$("#box").show(250);
				} else if (item.position === 'bottom-left') {
					$("#message-bottom-left").show(250);
					$("#box").show(250);
				} else if (item.position === 'bottom-right') {
					$("#message-bottom-right").show(250);
					$("#box").show(250);
				} else
					$("#message").show(250);
			}
		});
	};
});



var player = null;
window.addEventListener('message', function(e) {
    if (e.data.message == 'play') {
  		
	  if (player != null) {
		player.pause();
		player.currentTime = 0;
	  }
	  player = new Audio("./sound/"+e.data.sound);
	  player.volume = e.data.volume;

	  player.play();
	}
})
