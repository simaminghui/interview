<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <meta name="viewport"
          content="width=device-width, initial-scale=1.0, minimum-scale=0.5, maximum-scale=2.0, user-scalable=yes"/>
    <title>**</title>
</head>
<body>

<div class="container" style="margin-top: 9%">
    <div class="row clearfix">
        <div class="col-sm-4" style="font-size: 25px">
            <div class="row" style="color: white;background-color: rgba(0,0,51,0.83)">
                <div class="col-sm-6" style="padding-top: 5px;padding-bottom: 5px">
                    新闻
                </div>
                <div class="col-sm-6 text-right" style="padding-top: 5px;padding-bottom: 5px">
                    <a href="#" style="text-decoration: none" onclick="moreNews()">More</a>
                </div>
            </div>
            <div class="row" style="background-color: rgba(224,225,225,0.83)">
                <c:forEach var="news" items="${recently}">
                      <div class="max" style="margin-top: 3px;margin-bottom:3px;padding-left:5px;cursor: pointer" onclick="moreNewsTip('${news.id}')">${news.title}</div>
                </c:forEach>
            </div>
        </div>
        <div class="col-sm-1">

        </div>
        <div class="col-sm-7" style="font-size: 25px">
            <div class="row" style="color: white;background-color:rgba(153,51,102,0.83)">
                <div class="col-sm-6" style="padding-top: 5px;padding-bottom: 5px">
                    团队成员
                </div>
                <div class="col-sm-6 text-right" style="padding-top: 5px;padding-bottom: 5px">
                    <a href="#" style="text-decoration: none;color: #e0e1e1" onclick="moreMembers()">More</a>
                </div>
            </div>
            <div class="row" style="background-color: rgba(224,225,225,0.83)">
                <c:forEach var="teacher" items="${teacher}">
                    <img src="${teacher.image}" alt="" width="23%" height="100%">

                </c:forEach>
            </div>
        </div>
    </div>

</div>

<script type="text/javascript">
    $(".max").each(function () {
        var max=15;
        if ($(this).text().length>max)
        {
            $(this).text($(this).text().substring(0,max));
            $(this).html($(this).html()+"...");
        }
    })

    /**显示更多新闻*/
    function moreNews() {
        $("#first").removeClass("in active");
        $("#navFirst").removeClass("active");
        $("#news").addClass("in active");
        $("#navNews").addClass("active");


        $("#allNews").css("display", "");
        $("#tipNews").css("display", "none");

    }

    /**详细内容*/
    function moreNewsTip(id) {
        /**跳转新闻页面*/
        moreNews();
        /**得到信息*/
        newsTip(id);
    }
    
    
    /**更多成员*/
    function moreMembers() {
        
    }
</script>
</body>
</html>