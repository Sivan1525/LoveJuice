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
                $(this).closest("form").submit();
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
        $(this).parent().parent().parent().find('form.comment').slideToggle(400, function () {
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