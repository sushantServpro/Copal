$(document).ready(function () {

    tickerAndBanner($(window).width());
});



$(window).resize(function () {
    tickerAndBanner($(window).width());
});

function tickerAndBanner($ww) {
    $('.NewScrolling p').bind('marquee', function () {
        var ob = $(this);
        var tw = ob.width();
        var ww = ob.parent().width();
        ob.css({ right: -tw });
        ob.animate({ right: ww }, 40000, 'linear', function () {
            ob.trigger('marquee');
        });
    }).trigger('marquee');

}
///////////////////////MAYANK ENDS


(function ($) {

    $.fn.s3Slider = function(vars) {       
        
        var element     = this;
        var timeOut     = (vars.timeOut != undefined) ? vars.timeOut : 4000;
        var current     = null;
        var timeOutFn   = null;
        var faderStat   = true;
        var mOver       = false;
        var items       = $("#" + element[0].id + "Content ." + element[0].id + "Image");
        var itemsSpan   = $("#" + element[0].id + "Content ." + element[0].id + "Image div");
            
        
        
        var makeSlider = function() {
            current = (current != null) ? current : items[(items.length-1)];
            var currNo      = jQuery.inArray(current, items) + 1
            currNo = (currNo == items.length) ? 0 : (currNo - 1);
            var newMargin   = $(element).width() * currNo;
            if(faderStat == true) {
                if(!mOver) {
                    $(items[currNo]).fadeIn((timeOut/6), function() {
                        if($(itemsSpan[currNo]).css('bottom') == 0) {
                            // for animated banner
                            //$(itemsSpan[currNo]).slideUp((timeOut / 6), function () {
                            //    faderStat = false;
                            //    current = items[currNo];
                            //    if(!mOver) {
                            //        fadeElement(false);
                            //    }
                            //});

                            // for animated banner
                            $('#divFlashBanner').find('img:gt(0)').hide();
                            var currentIndex = 0;
                            setInterval(function () {
                                if ($("#divFlashBanner").find("img:eq(" + currentIndex + ")").next().length > 0) {
                                    $("#divFlashBanner").find("img:eq(" + currentIndex + ")").fadeOut(2000).next("img").fadeIn(2000);
                                    currentIndex++;
                                }
                                else {
                                    $("#divFlashBanner").find("img:eq(" + currentIndex + ")").fadeOut(2000);
                                    $("#divFlashBanner").find("img:first").fadeIn(2000);
                                    currentIndex = 0
                                }
                            }, 5000);
                        } else {
                            // for animated banner
                            //$(itemsSpan[currNo]).slideDown((timeOut/6), function() {
                            //    faderStat = false;
                            //    current = items[currNo];
                            //    if(!mOver) {
                            //        fadeElement(false);
                            //    }
                            //});
                            // for animated banner
                            $('#divFlashBanner').find('img:gt(0)').hide();
                            var currentIndex = 0;
                            setInterval(function () {
                                if ($("#divFlashBanner").find("img:eq(" + currentIndex + ")").next().length > 0) {
                                    $("#divFlashBanner").find("img:eq(" + currentIndex + ")").fadeOut(2000).next("img").fadeIn(2000);
                                    //$("#divFlashBanner").find("img:next").fadeIn(2000);
                                    currentIndex++;
                                }
                                else {
                                    $("#divFlashBanner").find("img:eq(" + currentIndex + ")").fadeOut(2000);
                                    $("#divFlashBanner").find("img:first").fadeIn(2000);
                                    currentIndex = 0
                                }
                            }, 5000);
                        }
                    });
                }
            }
           
        }
        
        makeSlider();

    };  


   


})(jQuery);  