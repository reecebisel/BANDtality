$(document).ready(function(){

$('#new_playlist_button').click(function(){
    var baseUrl = "http://devpoint-ajax-example-server.herokuapp.com/api/vi"
    $newUserForm = $('#new_user_form');
    var urlAction = $newUserForm.attr('action');
    var httpMethod = $newUserForm.attr('method');
    var $firstName = $('#first_name');
    $.ajax(baseUrl + urlAction, {
        type:httpMethod;
        data: {"user[first_name]": $('#first_name').val(), 
               "user[last_name]": $('#last_name').val(), 
               "user[phone_number]": $("phone_number").val()
              },
        success:function(data){
          $firstName.val("");
          $lastName.val("");
          $phoneNumber.val("");
          var user = data.user;
          $list.append('<li>' + user.first_name + " " + user.last_name + '</li>');
        },
        error:function(data){
          console.log('error');
          cosole.log('data');
        }
      }
    });
  });
});