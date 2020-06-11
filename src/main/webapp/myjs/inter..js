$(document).ready(function(){

    $("#nav-main .btn").click(function(){
        var theme = $(this).attr("data-theme"),
            path = "https://netdna.bootstrapcdn.com/bootswatch/3.0.2/";

        if ($("body").hasClass(theme)) return;

        $("#nav-main .btn").removeClass("active");
        $(this).addClass("active");

        if (theme == "default") {
            $("#theme").removeAttr("href");
            $("body").removeAttr("class");
        } else {
            $("#theme").attr("href", path + theme + "/bootstrap.min.css");
            $("body").attr("class", theme);
        }
    });

});
