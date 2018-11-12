$(document).ready(function() {

    var readURL = function(input) {
        if (input.files && input.files[0]) {
            var reader = new FileReader();

            reader.onload = function (e) {
                $('.avatar').attr('src', e.target.result);
            }
    
            reader.readAsDataURL(input.files[0]);
        }
    }
    

    $(".file-upload").on('change', function(){
        readURL(this);
        $.ajax({
            type: 'PUT',
            url: "/users/"+user_id+"/avatar_update",
            data: { user_id: "<%= current_user.id %>"}
        });
    });
});
