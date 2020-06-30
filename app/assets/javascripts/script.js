$(document).ready(function() {
    $(".flash").fadeOut(3000);
    $(".my-photo").fadeIn(1500);

//-----------------モーダル-----------
    $(".menu-icon").click(function(){
        if($('#menu-modal').hasClass('off')){
            $('#menu-modal').removeClass('off');
            $('#menu-modal').animate({'marginRight':'40%'},300).addClass('on');
        }else{
            $('#menu-modal').addClass('off');
            $('#menu-modal').animate({'marginRight':'0px'},300);
        }
    })
    fit();
    $(window).resize(function(){
    fit();
    })
    function fit(){
    var h = $(window).height();
    $('.menu-list').css("height",h);
    }

    $(".singleinbox").click(function(){
        if ($('#menu-modal').hasClass('on')){
        $('#menu-modal').addClass('off');
        $('#menu-modal').animate({'marginRight':'0px'},300);
    }
    })

    });