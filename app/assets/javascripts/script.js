$(document).ready(function() {
    $(".flash").fadeOut(3000);
    $(".my-photo").fadeIn(1500);
    $(".menu-icon").click(function(){
        if($('#menu-modal').hasClass('off')){
            $('#menu-modal').removeClass('off');
            $('#menu-modal').animate({'marginRight':'20%'},300).addClass('on');
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

    });