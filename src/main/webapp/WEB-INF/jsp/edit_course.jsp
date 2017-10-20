<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page import="java.net.URLDecoder" %>
<%@ page import="com.fsq.entity.Course" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">

<head>

    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="description" content="">
    <meta name="author" content="">

    <title>导入课程</title>

    <!-- Bootstrap Core CSS -->
    <link href="assets/vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">

    <!-- MetisMenu CSS -->
    <link href="assets/vendor/metisMenu/metisMenu.min.css" rel="stylesheet">

    <!-- Custom CSS -->
    <link href="assets/dist/css/sb-admin-2.css" rel="stylesheet">

    <!-- Custom Fonts -->
    <link href="assets/vendor/font-awesome/css/font-awesome.min.css" rel="stylesheet" type="text/css">

    <%-- Jquery Confirm CSS --%>
    <link href="assets/vendor/jquery-confirm/jquery-confirm.min.css" rel="stylesheet" type="text/css">

    <%-- Jquery Confirm CSS --%>
    <link href="assets/vendor/jquery-confirm/jquery-confirm.min.css" rel="stylesheet" type="text/css">

    <!-- HTML5 Shim and Respond.js IE8 support of HTML5 elements and media queries -->
    <!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
    <!--[if lt IE 9]>
    <script src="https://oss.maxcdn.com/libs/html5shiv/3.7.0/html5shiv.js"></script>
    <script src="https://oss.maxcdn.com/libs/respond.js/1.4.2/respond.min.js"></script>
    <![endif]-->

</head>

<body>

<%
    String aname = null;
    String ano = null;
    Cookie[] cookies = request.getCookies();
    for(Cookie cookie : cookies){
        if(cookie.getName().equals("aname")){
            aname = URLDecoder.decode(cookie.getValue(), "UTF-8");
            System.out.println(aname);
        }
        if(cookie.getName().equals("ano")){
            ano = cookie.getValue();
            System.out.println(ano);
        }
    }
%>

<div id="wrapper">

    <!-- Navigation -->
    <nav class="navbar navbar-default navbar-static-top" role="navigation" style="margin-bottom: 0">
        <div class="navbar-header">
            <button type="button" class="navbar-toggle" data-toggle="collapse" data-target=".navbar-collapse">
                <span class="sr-only">Toggle navigation</span>
                <span class="icon-bar"></span>
                <span class="icon-bar"></span>
                <span class="icon-bar"></span>
            </button>
            <a class="navbar-brand" href="index.html">学生选课系统</a>
        </div>
        <!-- /.navbar-header -->

        <ul class="nav navbar-top-links navbar-right">
            <li style="margin-top: 15px">
                <i class="fa fa-user fa-fw"></i> <span><%=aname%></span> &nbsp;&nbsp;<a href="alogout.html" style="display: inline"><i class="fa fa-sign-out" aria-hidden="true"></i>退出</a>
            </li>
            <!-- /.dropdown -->
        </ul>
        <!-- /.navbar-top-links -->

        <div class="navbar-default sidebar" role="navigation">
            <div class="sidebar-nav navbar-collapse">
                <ul class="nav" id="side-menu">
                    <li class="sidebar-search">
                        <div class="input-group custom-search-form">
                            <input type="text" class="form-control" placeholder="搜索...">
                            <span class="input-group-btn">
                                    <button class="btn btn-default" type="button">
                                        <i class="fa fa-search"></i>
                                    </button>
                                </span>
                        </div>
                        <!-- /input-group -->
                    </li>
                    <li>
                        <a href="publish.html"><i class="fa fa-bell-o"></i> 发布通知</a>
                    </li>
                    <li>
                        <a href="all_course_a.html"><i class="fa fa-bars"></i> 全部课程</a>
                    </li>
                    <li>
                        <a href="import_course.html"><i class="fa fa-file-text"></i> 导入课程</a>
                    </li>
                    <li>
                        <a href="teacher_manage"><i class="fa fa-user"></i> 教师管理</a>
                    </li>
                    <li>
                        <a href="student_manage"><i class="fa fa-graduation-cap"></i> 学生管理</a>
                    </li>
                </ul>
            </div>
            <!-- /.sidebar-collapse -->
        </div>
        <!-- /.navbar-static-side -->
    </nav>

    <!-- Page Content -->
    <div id="page-wrapper">
        <div class="container-fluid">
            <div class="row">
                <div class="col-lg-12">
                    <br>
                    <div class="panel panel-default">
                        <div class="panel-heading">编辑并更新课程信息</div>
                        <div class="panel-body">
                            <form role="form" id="course-info">
                                <div class="row">
                                    <div class="col-lg-4">
                                        <div class="form-group">
                                            <label style="font-weight: normal">课程代码</label><input name="no" id="no" type="text" class="form-control" value="${course.no}" disabled="disabled">
                                        </div>
                                    </div>
                                    <div class="col-lg-4">
                                        <div class="form-group">
                                            <label style="font-weight: normal">课程名称</label><input type="text" name="name" id="name" class="form-control" value="${course.name}" autofocus>
                                        </div>
                                    </div>
                                    <div class="col-lg-4">
                                        <div class="form-group">
                                            <label style="font-weight: normal">课程类型</label>
                                            <select class="form-control" name="type" id="type" value="${course.type}">
                                                <option value="专业核心课"  <c:if test="${'专业核心课' eq course.type}">selected</c:if> >专业核心课</option>
                                                <option value="专业选修课"  <c:if test="${'专业选修课' eq course.type}">selected</c:if> >专业选修课</option>
                                                <option value="公共基础课"  <c:if test="${'公共基础课' eq course.type}">selected</c:if> >公共基础课</option>
                                                <option value="实践教育"  <c:if test="${'实践教育' eq course.type}">selected</c:if> >实践教育</option>
                                                <option value="体育课"  <c:if test="${'体育课' eq course.type}">selected</c:if> >体育课</option>
                                            </select>
                                        </div>
                                    </div>
                                </div>

                                <div class="row">
                                    <div class="col-lg-4">
                                        <div class="form-group">
                                            <label style="font-weight: normal">开课专业</label><input type="text" name="dept" id="dept" class="form-control" value="${course.dept}">
                                        </div>
                                    </div>
                                    <div class="col-lg-4">
                                        <div class="form-group">
                                            <label style="font-weight: normal">授课教师</label><input type="text" name="teacher" id="teacher" class="form-control" value="${course.techNo}">
                                        </div>
                                    </div>
                                    <div class="col-lg-4">
                                        <div class="form-group">
                                            <label style="font-weight: normal">课程容量</label><input type="text" name="capacity" id="capacity" class="form-control" value="${course.capacity}">
                                        </div>
                                    </div>
                                </div>

                                <div class="row">
                                    <div class="col-lg-4">
                                        <label style="font-weight: normal">开始时间</label>
                                        <div class="input-group">
                                            <span class="input-group-addon">第</span>
                                            <select class="form-control" name="start-week" id="start-week" value="${course.startWeek}">
                                                <option value="1" <c:if test="${'1' eq course.startWeek}">selected</c:if> >1</option>
                                                <option value="2" <c:if test="${'2' eq course.startWeek}">selected</c:if> >2</option>
                                                <option value="3" <c:if test="${'3' eq course.startWeek}">selected</c:if> >3</option>
                                                <option value="4" <c:if test="${'4' eq course.startWeek}">selected</c:if> >4</option>
                                                <option value="5" <c:if test="${'5' eq course.startWeek}">selected</c:if> >5</option>
                                                <option value="6" <c:if test="${'6' eq course.startWeek}">selected</c:if> >6</option>
                                                <option value="7" <c:if test="${'7' eq course.startWeek}">selected</c:if> >7</option>
                                                <option value="8" <c:if test="${'8' eq course.startWeek}">selected</c:if> >8</option>
                                                <option value="9" <c:if test="${'9' eq course.startWeek}">selected</c:if> >9</option>
                                                <option value="10" <c:if test="${'10' eq course.startWeek}">selected</c:if> >10</option>
                                                <option value="11" <c:if test="${'11' eq course.startWeek}">selected</c:if> >11</option>
                                                <option value="12" <c:if test="${'12' eq course.startWeek}">selected</c:if> >12</option>
                                                <option value="13" <c:if test="${'13' eq course.startWeek}">selected</c:if> >13</option>
                                                <option value="14" <c:if test="${'14' eq course.startWeek}">selected</c:if> >14</option>
                                                <option value="15" <c:if test="${'15' eq course.startWeek}">selected</c:if> >15</option>
                                                <option value="16" <c:if test="${'16' eq course.startWeek}">selected</c:if> >16</option>
                                                <option value="17" <c:if test="${'17' eq course.startWeek}">selected</c:if> >17</option>
                                                <option value="18" <c:if test="${'18' eq course.startWeek}">selected</c:if> >18</option>
                                            </select>
                                            <span class="input-group-addon">周</span>
                                        </div>
                                    </div>
                                    <div class="col-lg-4">
                                        <label style="font-weight: normal">结束时间</label>
                                        <div class="input-group">
                                            <span class="input-group-addon" id="basic-addon1">第</span>
                                            <!--<input type="text" class="form-control" aria-describedby="basic-addon1">-->
                                            <select class="form-control" name="end-week" id="end-week" value="${course.endWeek}">
                                                <option value="1" <c:if test="${'1' eq course.endWeek}">selected</c:if> >1</option>
                                                <option value="2" <c:if test="${'2' eq course.endWeek}">selected</c:if> >2</option>
                                                <option value="3" <c:if test="${'3' eq course.endWeek}">selected</c:if> >3</option>
                                                <option value="4" <c:if test="${'4' eq course.endWeek}">selected</c:if> >4</option>
                                                <option value="5" <c:if test="${'5' eq course.endWeek}">selected</c:if> >5</option>
                                                <option value="6" <c:if test="${'6' eq course.endWeek}">selected</c:if> >6</option>
                                                <option value="7" <c:if test="${'7' eq course.endWeek}">selected</c:if> >7</option>
                                                <option value="8" <c:if test="${'8' eq course.endWeek}">selected</c:if> >8</option>
                                                <option value="9" <c:if test="${'9' eq course.endWeek}">selected</c:if> >9</option>
                                                <option value="10" <c:if test="${'10' eq course.endWeek}">selected</c:if> >10</option>
                                                <option value="11" <c:if test="${'11' eq course.endWeek}">selected</c:if> >11</option>
                                                <option value="12" <c:if test="${'12' eq course.endWeek}">selected</c:if> >12</option>
                                                <option value="13" <c:if test="${'13' eq course.endWeek}">selected</c:if> >13</option>
                                                <option value="14" <c:if test="${'14' eq course.endWeek}">selected</c:if> >14</option>
                                                <option value="15" <c:if test="${'15' eq course.endWeek}">selected</c:if> >15</option>
                                                <option value="16" <c:if test="${'16' eq course.endWeek}">selected</c:if> >16</option>
                                                <option value="17" <c:if test="${'17' eq course.endWeek}">selected</c:if> >17</option>
                                                <option value="18" <c:if test="${'18' eq course.endWeek}">selected</c:if> >18</option>
                                            </select>
                                            <span class="input-group-addon" id="basic-addon2">周</span>
                                        </div>
                                    </div>
                                    <div class="col-lg-4">
                                        <div class="form-group">
                                            <label style="font-weight: normal">课程学分</label><input type="text" name="credit" id="credit" class="form-control" value="${course.credit}">
                                        </div>
                                    </div>
                                </div>

                                <div class="row">
                                    <div class="col-lg-4">
                                        <div class="form-group">
                                            <label style="font-weight: normal">填写日期</label><br>
                                            <input type="text" placeholder="如：周一1,2节" name="date1" id="date1" class="form-control" value="${course.time1}">
                                        </div>
                                    </div>
                                    <div class="col-lg-4">
                                        <div class="form-group">

                                            <label style="font-weight: normal">填写日期</label><br>
                                            <input type="text" placeholder="如：周一1,2节" name="date2" id="date2" class="form-control" value="${course.time2}">
                                        </div>
                                    </div>
                                    <div class="col-lg-4">
                                        <div class="form-group">
                                            <label style="font-weight: normal">填写日期</label><br>
                                            <input type="text" placeholder="如：周一1,2节" name="date3" id="date3" class="form-control" value="${course.time3}">
                                        </div>
                                    </div>
                                </div>

                                <div class="row">
                                    <div class="col-lg-4">
                                        <label style="font-weight: normal">上课地点</label><input type="text" name="class-place" id="class-place" class="form-control" value="${course.classPlace}">
                                    </div>
                                    <div class="col-lg-4">

                                    </div>
                                    <div class="col-lg-4">
                                        <div class="form-group">
                                            <br>
                                            <button id="btn-submit" type="button" class="btn btn-primary full-width btn-block">提交</button>
                                        </div>
                                    </div>
                                </div>
                            </form>
                        </div>
                    </div>
                </div>
                <!-- /.col-lg-12 -->
            </div>
            <!-- /.row -->
        </div>
        <!-- /.container-fluid -->
    </div>
    <!-- /#page-wrapper -->

</div>
<!-- /#wrapper -->

<!-- jQuery -->
<script src="assets/vendor/jquery/jquery.min.js"></script>

<!-- Bootstrap Core JavaScript -->
<script src="assets/vendor/bootstrap/js/bootstrap.min.js"></script>

<!-- Metis Menu Plugin JavaScript -->
<script src="assets/vendor/metisMenu/metisMenu.min.js"></script>

<%-- Jquery Confirm JavaScript--%>
<script src="assets/vendor/jquery-confirm/jquery-confirm.min.js"></script>

<!-- Custom Theme JavaScript -->
<script src="assets/dist/js/sb-admin-2.js"></script>

<script>
    $(function () {
        $("#btn-submit").click(function () {
            /*console.log($("#no").val());
             console.log($("#name").val());
             console.log($("#type").val());
             console.log($("#dept").val());
             console.log($("#teacher").val());
             console.log($("#capacity").val());
             console.log($("#start-week").val());
             console.log($("#end-week").val());
             console.log($("#credit").val());*/


            /*$("[name=day-of-week]:checkbox").each(function () {
             if(this.checked){
             console.log($(this).val());
             }
             })*/

            var no = $("#no").val();
            var name = $("#name").val();
            var type = $("#type").val();
            var dept = $("#dept").val();
            var teacher = $("#teacher").val();
            var capacity = $("#capacity").val();
            var startWeek = $("#start-week").val();
            var endWeek = $("#end-week").val();
            var credit = $("#credit").val();
            var date1 = $("#date1").val();
            var date2 = $("#date2").val();
            var date3 = $("#date3").val();
            var classPlace = $("#class-place").val();

            var time = startWeek + "-" + endWeek + "周";
            if(date1.length > 0){
                time += ("," + date1);
            }
            if(date2.length > 0){
                time += ("," + date2);
            }
            if(date3.length > 0){
                time += ("," + date3);
            }

            console.log(time);

            console.log("ajax");

            if(startWeek > endWeek){
                $.alert({
                    title : '警告',
                    content : '开始周数不能晚于结束周数',
                    buttons : {
                        ok : {
                            text : '知道了',
                            action : function () {

                            }
                        }
                    }
                });
            } else {
                $.ajax({
                    type : "POST",
                    url : "update_course",
                    data : {
                        no : no,
                        name : name,
                        type : type,
                        dept : dept,
                        teacher : teacher,
                        startTime : startWeek,
                        endTime : endWeek,
                        capacity : capacity,
                        time : time,
                        credit : credit,
                        classPlace : classPlace,
                        startWeek : startWeek,
                        endWeek : endWeek,
                        time1 : date1,
                        time2 : date2,
                        time3 : date3
                    },
                    dataType : "text",
                    success : function (data) {
                        window.location.href = "all_course_a.html";
                        //console.log("success");
                    }
                })
            }

        })

    })
</script>

</body>

</html>


