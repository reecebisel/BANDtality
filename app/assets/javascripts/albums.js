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
        alert("maybe i wont be such a bitch.")
        var profileAlbums = data.albums
        $albumsList.append('<li class="album_name">' + '<i class="fa fa-fw fa-folder"></i>' + " " + profileAlbums.album_name + '</li>');
      },
      error:function(data){
        alert('Something went wrong while adding your photo album. Please try again.')
        window.location.reload()
      }
    });
  });
}); // document end
