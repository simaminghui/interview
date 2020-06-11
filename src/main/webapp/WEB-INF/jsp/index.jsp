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

<div style="margin-top: 2%;" class="container">

    <nav class="navbar navbar-default" role="navigation" >
        <div class="container-fluid">
            <div>
                <ul class="nav navbar-nav " style="font-size: 25px">
                    <li class="active" id="navFirst"> <a href="#first" data-toggle="tab">首页</a></li>
                    <li id="navNews"><a href="#news" data-toggle="tab" onclick="appearNew()">新闻</a></li>
                    <li ><a href="#member" data-toggle="tab">团队成员</a></li>
                    <li><a href="#ios" data-toggle="tab">论文著作</a></li>
                    <li><a href="#jmeter " data-toggle="tab">科研转化</a></li>
                    <li><a href="#ejb" data-toggle="tab">招生信息</a></li>
                </ul>
            </div>
        </div>
    </nav>


    <div id="myTabContent" class="tab-content" style="margin-top: 2%">
        <div class="tab-pane fade in active" id="first">
            <jsp:include page="/first"></jsp:include>
        </div>
        <div class="tab-pane fade" id="news">
            <jsp:include page="/news"></jsp:include>
        </div>
        <div class="tab-pane fade" id="member">
            <jsp:include page="/member"></jsp:include>
        </div>
        <div class="tab-pane fade" id="ios">
            <p>iOS 是一个由苹果公司开发和发布的手机操作系统。最初是于 2007 年首次发布 iPhone、iPod Touch 和 Apple
                TV。iOS 派生自 OS X，它们共享 Darwin 基础。OS X 操作系统是用在苹果电脑上，iOS 是苹果的移动版本。</p>
        </div>
        <div class="tab-pane fade" id="jmeter">
            <p>jMeter 是一款开源的测试软件。它是 100% 纯 Java 应用程序，用于负载和性能测试。</p>
        </div>
        <div class="tab-pane fade" id="ejb">
            <p>Enterprise Java Beans（EJB）是一个创建高度可扩展性和强大企业级应用程序的开发架构，部署在兼容应用程序服务器（比如 JBOSS、Web Logic 等）的 J2EE 上。
            </p>
        </div>
    </div>


</div>

<script type="text/javascript">
    function appearNew() {

        $("#allNews").css("display","");
        $("#tipNews").css("display","none");
    }
    $("#tipNews").css("display","none");
</script>
</body>
</html>