if ( ! jQuery) {
    var $ = jQuery.noConflict();
} else {
    var $ = jQuery;
}

$(document).ready(function() {

    $("form[name='NOMIKOS_FIFA_WORLD_CUP_SCOREBOARD_FORM'] input[name='topbar']").click(function() {
        if (this.checked)
        $("#topbar_options").animate({
            opacity: "show"
        });
        else
        $("#topbar_options").animate({
            opacity: "hide"
        });
    });

    var tz = new Date();

    // in seconds
    var tz = tz.getTimezoneOffset() * 60;
    var tz_dif_africa = 2 * 3600;

    if ($.cookie("tzChangerLocal") != 0 && $.cookie("tzChangerLocal") != 1)
    {
        $.cookie("tzChangerLocal", "1", {path: '/', expires: 0});
    }

    if ($.cookie("tzChangerLocal") == 1)
    {
        settzChanger(true);
    }

    if (document.getElementById("staticBar2b"))
    if ($.cookie("staticBarClose") == 1)
    {
        $("#staticBar2b").attr('checked', false);
    }
    else
    {
        $("#staticBar2b").attr('checked', true);
    }

    $(".tzChanger").click(function() {
        settzChanger(this.checked);
    });

    function settzChanger(checked)
    {
        $(".tzChanger").attr('checked', checked);
        if (checked)
        {
            $.cookie("tzChangerLocal", "1", {path: '/', expires: 0});
        }
        else
        {
            $.cookie("tzChangerLocal", "0", {path: '/', expires: 0});
        }
        var tzt = $(".tzChangerText");
        $.each(tzt, function(i, item){
            var real_date = Number(item.id);
            if ($.cookie("tzChangerLocal") == 1)
                var new_date = real_date - tz + tz_dif_africa;
            else
                var new_date = real_date + tz;
            var date = new Date(new_date * 1000);
            var hours = date.getHours();
            var minutes = date.getMinutes();
            minutes = minutes == 0 ? minutes + '0' : minutes;
            var month = date.getMonth() + 1;
            month = '0' + month;
            var day = date.getDate();
            day = day < 10 ? '0' + day : day;
            var formattedTime = day + '/' + month + ' ' + hours + ':' + minutes;
            $(item).text(formattedTime);
        });
    }

    if ( $.cookie("staticBarClose") == 0 )
    {
        openstaticBarClose();
    }

    $("#staticBar2").click(function() {
        $("#staticBar2b").attr('checked', false);
        closestaticBarClose();
    });

    $("#staticBar2b").click(function() {
        if (this.checked)
            openstaticBarClose();
        else
            closestaticBarClose();
    });

    function closestaticBarClose()
    {
        $("#staticBar").css("display", "none");
        var height1 = $("body").css("padding-top");
        var height2 = $("#staticBar").css("height");
        var re = new RegExp(/px|em|pt/);
        var height1 = height1.replace(re, "");
        var height2 = height2.replace(re, "");
        $("body").css("padding-top", Number(height1) - Number(height2) + 'px');

        $.cookie("staticBarClose", "1", {path: '/', expires: 0});
    }

    function openstaticBarClose()
    {
        if ( ! document.getElementById("staticBar"))
            return;

        $("#staticBar").css("display", "block");
        var height1 = $("body").css("padding-top");
        var height2 = $("#staticBar").css("height");
        var re = new RegExp(/px|em|pt/);
        var height1 = height1.replace(re, "");
        var height2 = height2.replace(re, "");
        $("body").css("padding-top", Number(height1) + Number(height2) + 'px');

        $.cookie("staticBarClose", "0", {path: '/', expires: 0});

        var counter = 0;
        var divs = $(".staticBar_table_div");
        var rpage = divs.length;
        function showDiv () {
            divs.hide()
                .filter(function (index) { return index == counter % rpage })
                .fadeIn(1000);
                counter++;
        };
        showDiv();
        setInterval(function () {
            showDiv()
        }, 5000);
    }

    $("#staticBar3").click(function() {
        location = location + '?nomikos_refresh=1'
    });

    $("#groupA").show();

    $(".nomikos_fifa_world_cup_scoreboard_class_table_group").click(function() {
        var group = $(this).text();
        if ( group.length != 1 )
            return;
        $("#groupA").hide();
        $("#groupB").hide();
        $("#groupC").hide();
        $("#groupD").hide();
        $("#groupE").hide();
        $("#groupF").hide();
        $("#groupG").hide();
        $("#groupH").hide();
        $("#group" + group).animate({
            opacity: "show"
        });
    });
});
