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
}); // document end
