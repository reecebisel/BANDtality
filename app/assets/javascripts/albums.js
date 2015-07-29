$(document).ready(function(){
  $('#new_album_button').click(function(){
    var $newAlbumForm = $('#new_album_form');
    var $albumName = $('#album_name');
    var $albumsList = $('#albums_list');
    $.ajax({
      type: 'POST',
      url: "/albums",
      data: { "album[album_name]": $albumName.val()
    },
      success:function(data){
        window.location.reload();
      },
      error:function(data){
        alert('Something went wrong while adding your photo album. Please try again.')
        window.location.reload()
      }
    });
  });
}); // document end
