$(document).ready(function () {
    
    //carousel slider
    $('#postCarousel').carousel({
        interval: 10000
    })

    //Show events and attend events
    var hideEvent = document.getElementById('hideEventDesc'),
        showEvent = document.getElementById('showEventDesc');

    $(showEvent).hide();

    $('#btn_show_event').click(function (e) {
        e.preventDefault();
        $(hideEvent).hide();
        $(showEvent).show();
    });
});