if ( ! jQuery) {
    var $ = jQuery.noConflict();
} else {
    var $ = jQuery;
}

$(document).ready(function() {

    if ( ! NOMIKOS_FIFA_WORLD_CUP_SCOREBOARD_STATICBAR_CLOSE)
    {
        /** this is buggy any idea!??? */
        if ($.cookie("staticBarClose") == 1)
            return;

        $("#staticBar").css("display", "block");

        $("#staticBar2").click(function() {
            if (confirm ("This is still buggy. If you close this bar, I do not know when it will open again. Do it?"))
            {
                $("#staticBar").css("display", "none");
                $.cookie("staticBarClose", "1");
                /** setCookie('staticBarClose', '1', '', '/'); */
            }
        });
        $("#staticBar3").click(function() {
            location = location + '?nomikos_refresh=1'
        });
    }

});

/**
function setCookie(name, value, expires, path, domain, secure){
	document.cookie = name + "=" + escape(value) + "; ";

	if(expires){
		expires = setExpiration(expires);
		document.cookie += "expires=" + expires + "; ";
	}
	if(path){
		document.cookie += "path=" + path + "; ";
	}
	if(domain){
		document.cookie += "domain=" + domain + "; ";
	}
	if(secure){
		document.cookie += "secure; ";
	}
}
* */

