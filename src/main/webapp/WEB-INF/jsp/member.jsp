<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <meta name="viewport"
          content="width=device-width, initial-scale=1.0, minimum-scale=0.5, maximum-scale=2.0, user-scalable=yes"/>
    <title>成员</title>
    <script type="text/javascript" src="../../myjs/jquery-1.9.0.min.js"></script>


</head>
<body>

<div class="container">
    <div class="row">
        <div class="col-sm-2" style="background-color: #e0e1e1">
            <ul class="nav nav-pills nav-stacked">
                <br>
                <li class="active"><a href="#teacher" data-toggle="tab" onclick="appear()">教师团队</a></li>
                <li><a href="#doctor" data-toggle="tab">博士</a></li>
                <li><a href="#graduateStudent" data-toggle="tab">研究生</a></li>
                <li><a href="#graduate" data-toggle="tab">毕业学生</a></li>
                <br>
            </ul>

        </div>
        <div class="col-sm-8">
            <div id="" class="tab-content" style="margin-top: 2%">
                <%--老师--%>
                <div class="tab-pane fade in active" id="teacher" style="margin-top: 2%;margin-left: 2%">
                    <div id="teachers">
                        <c:forEach var="teacher" items="${teacher}">
                            <div class="col-sm-6" style="margin-bottom: 3%">

                                <img src="${teacher.image}" alt="${teacher.cname}" height="160" width="119"
                                     onclick="tip('${teacher.id}')">

                                <div align="center" style="width: 119px;margin-top: 5px">
                                        ${teacher.cname}
                                </div>
                            </div>
                        </c:forEach>


                    </div>
                    <div id="teacherTip">

                    </div>
                </div>
                <%--博士--%>
                <div class="tab-pane fade" id="doctor" style="margin-top: 2%;margin-left: 2%">
                    <c:forEach var="student" items="${doctor}">
                        <div class="col-sm-6" style="margin-bottom: 3%">
                            <div class="col-sm-5">
                                <img src="${student.image}" alt="${student.cname}" height="160" width="119">
                            </div>
                            <div class="col-sm-7">
                                <div style="color: #ff9900">
                                        ${student.cname}：
                                </div>
                                <div>
                                    博士
                                </div>
                                <div>
                                    研究兴趣:${student.research}
                                </div>
                                <div>
                                    Email：${student.email}
                                </div>

                            </div>
                        </div>
                    </c:forEach>
                </div>


                <%--研究生--%>
                <div class="tab-pane fade" id="graduateStudent" style="margin-top: 2%;margin-left: 2%">
                    <c:forEach var="student" items="${gStudent}">
                        <div class="col-sm-6" style="margin-bottom: 3%">
                            <div class="col-sm-5">
                                <img src="${student.image}" alt="${student.cname}" height="160" width="119">
                            </div>
                            <div class="col-sm-6">
                                <div style="color: #ff9900">
                                        ${student.cname}：
                                </div>
                                <div>
                                    研究生
                                </div>
                                <div>
                                    研究兴趣:${student.research}
                                </div>
                                <div>
                                    Email：${student.email}
                                </div>

                            </div>
                        </div>
                    </c:forEach>
                </div>
                <%--毕业学生--%>
                <div class="tab-pane fade" id="graduate">
                    <table class="table table-hover">
                        <caption>博士</caption>
                        <thead>
                        <tr>
                            <th>姓名</th>
                            <th>入学日期</th>
                            <th>现单位</th>
                        </tr>
                        </thead>
                        <tbody>
                        <c:forEach var="Doctor" items="${graduationDoctor}">
                            <tr>
                                    <%--<th>${Doctor.cname}</th>--%>
                                <th>${Doctor.ename}(${Doctor.cname})</th>
                                <th>${Doctor.date}</th>
                                <th>${Doctor.address}</th>
                            </tr>
                        </c:forEach>
                        </tbody>
                    </table>
                    <br>
                    <table class="table table-hover">
                        <caption>硕士</caption>
                        <thead>
                        <tr>
                            <th>姓名</th>
                            <th>入学日期</th>
                            <th>现单位</th>
                        </tr>
                        </thead>
                        <tbody>
                        <c:forEach var="Student" items="${graduate}">
                            <tr>
                                    <%--<th>${Doctor.cname}</th>--%>
                                <th>${Student.ename}(${Student.cname})</th>
                                <th>${Student.date}</th>
                                <th>${Student.address}</th>
                            </tr>
                        </c:forEach>
                        </tbody>
                    </table>
                </div>
            </div>

        </div>
    </div>
</div>

<script type="text/javascript">
    function tip(id) {
       $("#teachers").css("display","none");
        $("#teacherTip").css("display","");
          $.post("/teacherTip/" + id, function (data) {

              var teacher=data.teachers;
              var education=data.educations;

              $("#teacherTip").html("");
              $("#teacherTip").append(
                  "<div class='row'> " +
                    "<div class='col-sm-2'>" +
                        "<img src='"+teacher.image+"' alt='hah' height='160' width='119'> " +
                    "</div>" +
                  "<div class='col-sm-6'>  " +
                  teacher.cname+" "+teacher.sex+" "+teacher.status+" "+teacher.department+"<br>"+
                      "电子邮件："+teacher.email+"<br>通信地址："+teacher.address+"<br>邮政编码："+teacher.postcode+

                    "</div>" +
                  "</div><br>");
              $("#teacherTip").append(
                  "<div>" +
                      "研究领域<br>研究方向："+teacher.research+"<br><br>教育背景"+
                  "</div>")

              for(var i=0;i<education.length;i++)
              {
                  $("#teacherTip").append("<div>"+education[i].date+" "+education[i].school+" "+education[i].education+"</div><br>")
              }

              $("#teacherTip").append("<div>科研项目"+teacher.projects+"</div>")
           })
    }


    function appear() {
        $("#teacherTip").css("display","none");
        $("#teachers").css("display","");
    }
</script>
</body>
</html>