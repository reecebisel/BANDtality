$(document).ready(function(){

$('#new_playlist_button').click(function(){

    var $newPhotoForm = $('#new_photo_form');
    var $caption = $('#caption');
    var $image = 
    var $playlistDiv = $('#playlists'); //<-- need to set up html markup so I know what to call this
    $.ajax({
      type: 'POST',
      url: "/photos",
      data: { "photo[caption]": $playlistUrl.val(),
              "photo[image]": 
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

// may make it so the modal renders a partial and sets everything up through that. going to double check to see if that works
