//$(function () {
//   $(document).bind("contextmenu", function (e) {
//       e.preventDefault();
////        alert("Right Click is not allowed");
//   });
//});

$urlParam = GetParameterValue("IsDlg");
$urlParam2 = GetParameterValue("Id");

$(document).ready(function () {

    //if (sessionStorage.getItem("SignOut") == '1') {
    //    window.location.href = '../NewLogin.aspx';
    //    sessionStorage.setItem("SignOut", "0");
    //}

    hideElementsInPopUp("IsDlg");

    if ($('#time').length > 0) {
        showTime();
    }

    if ($urlParam != '1') {
        getWindowSize();
        calculateFixHeader();
    }
    else {
        $('.pageContentWrapper').height($('#ifrmaPopupPage').height());

    }

    if ($(window).width() > 1024) {
        $('.quickGuideButton').hover(function () {
            $(this).next('.quickGuideContent').show().animate({ 'top': '-10px' });
        },
        function () {
            $('.quickGuideContent').hide().css({ 'top': '15px' });
        });
    }


    //calcDataDivHeight();

    $('.topMenuContainer').find('.toggleMenu').click(function () {
        $(this).toggleClass('openMenu');
        $('.topMenuContainer').find('ul.nav').slideToggle();
        return false;
    });

    $('.nav li').find('a.parentLink').click(function () {
        $('.nav li').find('div.child').not($(this).next()).hide();
        $('.nav li').find('> a').not($(this)).removeClass('expanded');
        if ($(this).hasClass('expanded')) {
            $(this).removeClass('expanded');
            $(this).closest('li').find('div.child').slideUp();
        }
        else {
            $(this).addClass('expanded');
            $(this).closest('li').find('div.child').slideDown();
        }
        return false;
    });
    BindEvents();
   // BindPageMethods(); //added by 
    // HelpDesk Accordion
    $('#ulHelpdesk').find('li').find('h5').find('a').click(function () {
        $('#ulHelpdesk').find('li').removeClass('expanded');
        $('#ulHelpdesk').find('.cont').slideUp();

        $(this).closest('li').addClass('expanded');
        $(this).closest('h5').next('.cont').slideDown();
        //$(this).closest('li').find('.content').slideDown();

        return false;
    });

    $('#ulHelpdesk').find('li:first').find('h5').find('a').trigger('click');

    // added by  starts
    var prm = Sys.WebForms.PageRequestManager.getInstance();
    prm.add_endRequest(function () {

        //if (sessionStorage.getItem("SignOut") == '1') {
        //    window.location.href = '../NewLogin.aspx';
        //    sessionStorage.setItem("SignOut", "0");
        //}

        hideElementsInPopUp("IsDlg");

        if ($('#time').length > 0) {
            showTime();
        }

        if ($urlParam != '1') {
            getWindowSize();
            calculateFixHeader();
        }
        else {
            $('.pageContentWrapper').height($('#ifrmaPopupPage').height());

        }

        if ($(window).width() > 1024) {
            $('.quickGuideButton').hover(function () {
                $(this).next('.quickGuideContent').show().animate({ 'top': '-10px' });
            },
            function () {
                $('.quickGuideContent').hide().css({ 'top': '15px' });
            });
        }


        //calcDataDivHeight();

        $('.topMenuContainer').find('.toggleMenu').click(function () {
            $(this).toggleClass('openMenu');
            $('.topMenuContainer').find('ul.nav').slideToggle();
            return false;
        });

        $('.nav li').find('a.parentLink').click(function () {
            $('.nav li').find('div.child').not($(this).next()).hide();
            $('.nav li').find('> a').not($(this)).removeClass('expanded');
            if ($(this).hasClass('expanded')) {
                $(this).removeClass('expanded');
                $(this).closest('li').find('div.child').slideUp();
            }
            else {
                $(this).addClass('expanded');
                $(this).closest('li').find('div.child').slideDown();
            }
            return false;
        });
        BindEvents();
       // BindPageMethods(); //ADDED BY 
        // HelpDesk Accordion
        $('#ulHelpdesk').find('li').find('h5').find('a').click(function () {
            $('#ulHelpdesk').find('li').removeClass('expanded');
            $('#ulHelpdesk').find('.cont').slideUp();

            $(this).closest('li').addClass('expanded');
            $(this).closest('h5').next('.cont').slideDown();
            //$(this).closest('li').find('.content').slideDown();

            return false;
        });

        $('#ulHelpdesk').find('li:first').find('h5').find('a').trigger('click');

    });
    // added by  ends
});

function BindPageMethods() {
    BindEvents();
    generateTableStructureAndFixHeader();
    if ($(window).width() > 1024) {
        $('.quickGuideButton').hover(function () {
            $(this).next('.quickGuideContent').show().animate({ 'top': '-10px' });
        },
        function () {
            $('.quickGuideContent').hide().css({ 'top': '15px' });
        });
    }
//added by  Starts for QUICKGUIDE display
    else if ($(window).width() > 100) {
        $('.quickGuideButton').hover(function () {
            $(this).next('.quickGuideContent').show().animate({ 'top': '-10px' });
        },
        function () {
            $('.quickGuideContent').hide().css({ 'top': '15px' });
        });
    }
//added by  Ends
}

function BindEvents() {

    $('.pageHeader > .quickGuideHolder').after('<div class="closePage"><a href="#" title="Close">Close</a></div>');
    
    if ($('.dashboard').length > 0) {
        $('.otherBox').find('.box ').height(($('.myFavCalendar').height() - 62) / 3);
        $('.mncHolder').height($('.myFavCalendar').height() - 10);
        //$('.signFrame').height($('.otherBox').height() - 18);
    }

    $('.LogOff').click(function () {
        //sessionStorage.setItem("SignOut","1");
    });
    
    $('.closeIframe').find('a').click(function () {
        $('.overlayHolder').hide();
        return false;
    });

    $('.pageHeader > .closePage').find('a').click(function () {

            if ($urlParam == '1') {
                window.close();
            }
            else if($urlParam2!=undefined)
            {
                window.close();
            }
            else {
                window.location.href = '../Forms/frmHome.aspx';
            }
       
        return false;
    });

    
    $('.quickGuideButton').click(function () {
        $('.quickGuideContent').toggle();
    });


    // open close Standard menu
    $('.toggleStandardMenu').click(function () {
        $('.standardMenuHolder').slideToggle();
        return false;
    });

    mainMenuEvent();
}

function getWindowSize() {
    var $window = $(window).height();
    var $panel = $('.pageContentWrapper').position();
}


$(window).resize(function () {

    if ($urlParam != '1') {
        getWindowSize();
    }
    hideElementsInPopUp("IsDlg");

    mainMenuEvent();
    //calcDataDivHeight();
    calculateFixHeader();

    $('.dataDivContent').find('table').width($('.pageData').width() - 18);
    $('.dataDivHeader').find('table').width($('.pageData').width() - 18);

    $('.dataDivHeader').find('table').find('tr:first').find('td').each(function () {
        var currentIndex = $(this).index();
        var currentWidth = $('.dataDivContent').find('tr:first').find('td:eq(' + currentIndex + ')').width();
        $(this).width(currentWidth);
    });

});

function mainMenuEvent() {

    var $windowWidth = $(window).width();
    // main menu for mobile
    if ($windowWidth < 1025) {
        //$('.nav li').find('> a').unbind('hover');
        $('.nav li').find('> a').bind('click');

        $('.quickGuideButton').bind('click');
    }
    else {
        $('.nav li').find('> a').unbind('click')
       // $('.nav li').find('> a').bind('hover')

        $('.quickGuideButton').unbind('click');
        $('.nav').width(calculateTopMenuWidth() + 5);
    }
}

function calculateFixHeader() {
    
    var _height = $('.headerTopMenuWrapper').height() + 5;
    var _paddingTop = 170; //(_height > 130) ? _height : 170;
    $('.pageContentWrapper').css('padding-top', _paddingTop);
}

// calculate datatable div height
function calcDataDivHeight() {
    var $window = $(window).height();
    var $minHeight = 150;
    var $minWindowHeight = 500;


    var temp = ($window * $minHeight) / $minWindowHeight;

    //$('.dataDiv').height(temp);
}
 function checkTime(i) {
        if (i < 10) {
            i = "0" + i;
        }
        return i;
    }

    function startTime() {
        var today = new Date();
        var d = today.toDateString();
        var h = today.getHours();
        var m = today.getMinutes();
        var s = today.getSeconds();
        // add a zero in front of numbers<10
        m = checkTime(m);
        s = checkTime(s);
        document.getElementById('time').innerHTML = d + ", " + h + ":" + m + ":" + s;
        t = setTimeout(function () {
            startTime()
        }, 500);
    }

function showTime() {
    $('#time').html(startTime());
}

function calculateTopMenuWidth() {
    var liWidth = 0;
    $('.topMenuContainer').find('li').each(function () {
        liWidth += $(this).width();
    });
    return liWidth;
}

function GetParameterValue(VarSearch) {
    var SearchString = window.location.search.substring(1);
    var VariableArray = SearchString.split('&');
    for (var i = 0; i < VariableArray.length; i++) {
        var KeyValuePair = VariableArray[i].split('=');
        if (KeyValuePair[0] == VarSearch) {
            return KeyValuePair[1];
        }
    }
}

function hideElementsInPopUp(paramText) {
    var $urlParamText = GetParameterValue(paramText)
    if ($urlParamText == '1') {
        //$('.headerTopMenuWrapper, .headerWrapper, .topMenuWrapper, .footerWrapper, .closePage').hide(); //commented by 
        $('.headerTopMenuWrapper, .headerWrapper, .topMenuWrapper, .footerWrapper').hide(); //added by  for keeping .closePage unhidden after browser-resize
        $('.marshallPageWrapper').css('background', 'none');
        $('.pageContentWrapper').css({'overflow': 'visible', 'padding-top':'30px'});
        //$('.quickGuideHolder').css('right', '-12px');
    }
}

function generateTableStructureAndFixHeader() {
    var table = $('.dataTable');

    var rows = table.find('tr'); //.not('tr:first');
    var th = "";
    var html = '<tbody><tr>';
    for (var i = 0; i < rows.length; i++) {
        if (i == 0) {
            th = '<thead><tr>' + rows[i].innerHTML + '</tr></thead>';
        }
        else {
            html = html + rows[i].innerHTML + '</tr>';
        }
    }

    html = html + '</tbody>';
    table.html(th + html);
    var tdWidth = '';

    console.log('hi..');

    $('.dataTable').fixheadertable({
        height: 200
    });

    fh();

    $('.dataDivContent').find('table').width($('.pageData').width() - 22);  //$('.dataDivContent').find('table').width() - 3);
    $('.dataDivHeader').find('table').width($('.dataDivContent').find('table').width());

    $('.dataDivHeader').find('table').find('tr:first').find('td').each(function () {
        var currentIndex = $(this).index();
        var currentWidth = $('.dataDivContent').find('tr:first').find('td:eq(' + currentIndex + ')').width();
        $(this).width(currentWidth);
    });

}


function fixHeaderOnly() {

    $('.dataTable').fixheadertable({
        height: 200
    });
}


function fh() {
    try {

        $(".dataDiv").each(function () {

            var grid = $(this).find("table.dataTableWithFixHeader")[0];

            var ScrollHeight = $(this).height();

            var gridWidth = $(this).width() - 20;

            var headerCellWidths = new Array();

            for (var i = 0; i < grid.getElementsByTagName('TH').length; i++) {

                headerCellWidths[i] = grid.getElementsByTagName('TH')[i].offsetWidth;

            }

            grid.parentNode.appendChild(document.createElement('div'));

            var parentDiv = grid.parentNode; var table = document.createElement('table');

            for (i = 0; i < grid.attributes.length; i++) {

                if (grid.attributes[i].specified && grid.attributes[i].name != 'id') {

                    table.setAttribute(grid.attributes[i].name, grid.attributes[i].value);

                }

            }

            table.style.cssText = grid.style.cssText;

            table.style.width = gridWidth + 'px';

            table.appendChild(document.createElement('tbody'));

            table.getElementsByTagName('tbody')[0].appendChild(grid.getElementsByTagName('TR')[0]);

            var cells = table.getElementsByTagName('TH');

            var gridRow = grid.getElementsByTagName('TR')[0];

            for (var i = 0; i < cells.length; i++) {

                var width; if (headerCellWidths[i] > gridRow.getElementsByTagName('TD')[i].offsetWidth) {

                    width = headerCellWidths[i];

                } else {

                    width = gridRow.getElementsByTagName('TD')[i].offsetWidth;

                } cells[i].style.width = parseInt(width - 3) + 'px';

                gridRow.getElementsByTagName('TD')[i].style.width = parseInt(width - 3) + 'px';

            }

            var gridHeight = grid.offsetHeight;

            if (gridHeight < ScrollHeight)

                ScrollHeight = gridHeight;

            parentDiv.removeChild(grid);

            var dummyHeader = document.createElement('div');
            dummyHeader.setAttribute('class', 'dataDivHeader');

            dummyHeader.appendChild(table); parentDiv.appendChild(dummyHeader);

            var scrollableDiv = document.createElement('div');
            scrollableDiv.setAttribute('class', 'dataDivContent');

            if (parseInt(gridHeight) > ScrollHeight) {

                gridWidth = parseInt(gridWidth) + 17;

            }

            //scrollableDiv.style.cssText = 'overflow:auto;height:' + ScrollHeight + 'px;width:' + gridWidth + 'px';

            scrollableDiv.style.cssText = 'overflow:auto;height:' + '300' + 'px;width:' + '100' + '%';

            scrollableDiv.appendChild(grid);

            parentDiv.appendChild(scrollableDiv);

        });

        }

        catch (err) { }

    }
