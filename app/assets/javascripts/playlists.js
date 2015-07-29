$(document).ready(function(){

$('#new_playlist_button').click(function(){

    var $newPlaylistForm = $('#new_playlist_form');
    var $playlistUrl = $('#playlist_url');
    var $playlistDiv = $('#playlists');
    $.ajax({
      type: 'POST',
      url: "/playlists",
      data: { "playlist[playlist_url]": $playlistUrl.val()
    },
      success:function(data){
        window.location.reload()
      },
      error:function(data){
        alert('Something went wrong while adding your playlist. Please try again.')
        window.location.reload()
      }
    });
  });

    (function(){
    var widgetIframe = document.getElementById('sc-widget'),
        widget       = SC.Widget(widgetIframe);

    widget.bind(SC.Widget.Events.READY, function() {
      widget.bind(SC.Widget.Events.PLAY, function() {
        // get information about currently playing sound
        widget.getCurrentSound(function(currentSound) {
          console.log('sound ' + currentSound.get('') + 'began to play');
        });
      });
      // get current level of volume
      widget.getVolume(function(volume) {
        console.log('current volume value is ' + volume);
      });
      // set new volume level
      widget.setVolume(50);
      // get the value of the current position
    });
  }()); //Souncould 
}); // document end
