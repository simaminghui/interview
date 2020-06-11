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
    <link rel="stylesheet" href="https://cdn.staticfile.org/twitter-bootstrap/3.3.7/css/bootstrap.min.css">
    <script src="https://cdn.staticfile.org/jquery/2.1.1/jquery.min.js"></script>
    <script src="https://cdn.staticfile.org/twitter-bootstrap/3.3.7/js/bootstrap.min.js"></script>


</head>
<body>
<div class="container-fluid">
    <div class="row-fluid">
        <div class="span12">
            <div>
                <h3>
                    新闻
                </h3>
            </div>
            <hr style="background-color:#999999;height: 2px;width:100%;border: none;"/>

        </div>
    </div>
    <%--新闻序列--%>
    <div class="row-fluid" id="allNews">
        <div class="span12" id="someNews">

            <%--  <c:forEach var="news" items="${news}">
                  <table class="table">
                      <tbody style="font-size: 20px;">
                      <tr class="span12 success">
                          <td class="col-sm-2">
                                  ${news.time}
                          </td>
                          <td class="col-sm-8 ">
                              <div onclick="newsTip('${news.id}')" class="max" style="cursor: pointer">
                                      ${news.title}
                              </div>

                          </td>
                          <td class="col-sm-2 .text-right" style="background-color: #cccccc;color: #6699cc">
                                  ${news.digest}
                          </td>
                      </tr>
                      </tbody>
                  </table>
              </c:forEach>--%>
        </div>
        <hr style="background-color:#999999;height: 2px;width:100%;border: none;"/>
        <div class="text-right">
            <ul class="pagination" id="page">
                <li><a href="#" onclick="pageShow(0)">&laquo;</a></li>
                <li><a href="#">1</a></li>
                <li><a href="#" onclick="pageShow(2)">&raquo;</a></li>
            </ul>
        </div>

    </div>

    <%--详细--%>
    <div id="tipNews">

    </div>

</div>

<script type="text/javascript">

    setTimeout(initNewsFenYe(), 100);

    /**初始化页面大小*/
    var initPageSize = 3;

    /**初始化新闻分页*/
    function initNewsFenYe() {
        /**初始化分页大小*/

        /**得到新闻列表*/
        var length = 0;
        $.post("/news/someNews", function (data) {
            if (data.length > initPageSize)
                length = initPageSize;
            else
                length = data.length;
            /**部分新闻,显示最近的initPageSize条*/
            for (var i = 0; i < length; i++) {

                $("#someNews").append("<table class=\"table\">\n" +
                    "                        <tbody style=\"font-size: 20px;\">\n" +
                    "                        <tr class=\"span12 success\">\n" +
                    "                            <td class=\"col-sm-2\">\n" +
                    data[i].time +
                    "                            </td>\n" +
                    "                            <td class=\"col-sm-8 \">\n" +
                    "                                <div onclick=\"newsTip(" + data[i].id + ")\" class=\"max\" style=\"cursor: pointer\">\n" +
                    data[i].title +
                    "                                </div>\n" +
                    "\n" +
                    "                            </td>\n" +
                    "                            <td class=\"col-sm-2 .text-right\" style=\"background-color: #cccccc;color: #6699cc\">\n" +
                    data[i].digest +
                    "                            </td>\n" +
                    "                        </tr>\n" +
                    "                        </tbody>\n" +
                    "                    </table>");
            }

        })
    }


    function pageShow(page)
    {
        if (page != 0)
        {
            $.post("/news/someNews", function (data) {

                var length=data.length;
                /**总页数*/
                var total= Math.ceil(length/initPageSize);
                /**当前页数小于总页数*/
                if (page<=total)
                {
                    /**修改页码*/
                    $("#page").html("");
                    $("#page").append(" <li><a href=\"#\" onclick=\"pageShow("+(page-1)+")\">&laquo;</a></li>\n" +
                        "                <li><a href=\"#\">"+page+"</a></li>\n" +
                        "                <li><a href=\"#\" onclick=\"pageShow("+(page+1)+")\">&raquo;</a></li>");


                    $("#someNews").html("");
                    /**修改页面内容*/
                    for (var i = (page-1)*initPageSize; i < page*initPageSize; i++) {
                        if (i<length)
                        {
                            console.log("这是"+i);
                            $("#someNews").append("<table class=\"table\">\n" +
                                "                        <tbody style=\"font-size: 20px;\">\n" +
                                "                        <tr class=\"span12 success\">\n" +
                                "                            <td class=\"col-sm-2\">\n" +
                                data[i].time +
                                "                            </td>\n" +
                                "                            <td class=\"col-sm-8 \">\n" +
                                "                                <div onclick=\"newsTip(" + data[i].id + ")\" class=\"max\" style=\"cursor: pointer\">\n" +
                                data[i].title +
                                "                                </div>\n" +
                                "\n" +
                                "                            </td>\n" +
                                "                            <td class=\"col-sm-2 .text-right\" style=\"background-color: #cccccc;color: #6699cc\">\n" +
                                data[i].digest +
                                "                            </td>\n" +
                                "                        </tr>\n" +
                                "                        </tbody>\n" +
                                "                    </table>");
                        }
                    }
                }

            })
        }

    }


    /**超过多少字显示什么*/
    $(".max").each(function () {
        var max = 80;
        if ($(this).text().length > max) {
            $(this).text($(this).text().substring(0, max));
            $(this).html($(this).html() + " ...");
        }
    })

    /**点击新闻展示信息*/
    function newsTip(id) {

        $("#allNews").css("display", "none");
        $("#tipNews").css("display", "");

        $.post("/news/tip", {id: id}, function (data) {

            $("#tipNews").html("");
            $("#tipNews").append("<div class='col-sm-12' align='center'><h3>" + data.title + "</h3> </div>");
            $("#tipNews").append("<div class='col-sm-12' align='center'><h4>" + data.time + "&nbsp&nbsp&nbsp作者：" + data.author + "</h4> </div>");
            $("#tipNews").append("<div >" + data.content + "</div>");
            $("#tipNews").append("<div style='color: red' '><h3>新闻中心介绍：" + data.introduce + "</h3></div>");
            $("#tipNews").append("<div align='center'><img height='333' width='500'  src='" + data.image + "' alt=''></div>");
        })
    }
</script>
</body>
</html>