
function fileSelectHandler() {
    // get selected file
    var oFile = $('#image_file')[0].files[0];

    // html5 file upload
    var formData = new FormData($('#upload_form')[0]);
    $.ajax({
        url: 'upload.php', //server script to process data
        type: 'POST',
        // ajax events
        beforeSend: function() {
        },
        success: function(e) {
            $('#upload_result').html('Thank you for your photo').show();

            setTimeout(function() {
                $("#upload_result").hide().empty();
            }, 4000);
        },
        error: function(e) {
            $('#upload_result').html('Error while processing uploaded image');
        },
        // form data
        data: formData,
        // options to tell JQuery not to process data or worry about content-type
        cache: false,
        contentType: false,
        processData: false
    });
}

$(document).ready(function(){

    // file field change handler
    $('#image_file').change(function(){
        var file = this.files[0];
        name = file.name;
        size = file.size;
        type = file.type;

        // extra validation
        if (name && size)  {
            if (! file.type.match('image.*')) {
                alert("Select image please");
            } else {
                fileSelectHandler();
            }
        }
    });

    // masonry initialization
    $('.main_container').masonry({
        // options
        itemSelector : '.pin',
        isAnimated: true,
        isFitWidth: true
    });

    // onclick event handler (for comments)
    $('.comment_tr').click(function () {
        $(this).toggleClass('disabled');
        $(this).parent().parent().parent().find('form').slideToggle(250, function () {
            $('.main_container').masonry();
        });
    }); 

    $('.ajax').colorbox({
        onOpen:function(){
        },
        onLoad:function(){
        },
        onComplete:function(){
            $(this).colorbox.resize();
        },
        onCleanup:function(){
        },
        onClosed:function(){
        }
    });
});