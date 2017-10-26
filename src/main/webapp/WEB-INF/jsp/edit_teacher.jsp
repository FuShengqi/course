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
                        <a href="teacher_manage.html" class="active"><i class="fa fa-user"></i> 教师管理</a>
                    </li>
                    <li>
                        <a href="student_manage.html"><i class="fa fa-graduation-cap"></i> 学生管理</a>
                    </li>
                    <li>
                        <a href="reset_passwd.html"><i class="fa fa-key"></i> 修改密码</a>
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
                        <div class="panel-heading">编辑教师信息并更新</div>
                        <div class="panel-body">
                            <form role="form" id="course-info">
                                <div class="row">
                                    <div class="col-lg-4">
                                        <div class="form-group">
                                            <label style="font-weight: normal">工号</label><input name="no" id="no" type="text" class="form-control" value="${teacher.no}" disabled="disabled">
                                        </div>
                                    </div>
                                    <div class="col-lg-4">
                                        <div class="form-group">
                                            <label style="font-weight: normal">姓名</label><input type="text" name="name" id="name" class="form-control" value="${teacher.name}" autofocus>
                                        </div>
                                    </div>
                                    <div class="col-lg-4">
                                        <div class="form-group">
                                            <label style="font-weight: normal">性别</label>
                                            <select class="form-control" name="gender" id="gender" value="${teacher.gender}">
                                                <option value="男"  <c:if test="${'男' eq teacher.gender}">selected</c:if> >男</option>
                                                <option value="女"  <c:if test="${'女' eq teacher.gender}">selected</c:if> >女</option>
                                            </select>
                                        </div>
                                    </div>
                                </div>

                                <div class="row">
                                    <div class="col-lg-4">
                                        <div class="form-group">
                                            <label style="font-weight: normal">年龄</label><input type="text" name="age" id="age" class="form-control" value="${teacher.age}">
                                        </div>
                                    </div>
                                    <div class="col-lg-4">
                                        <div class="form-group">
                                            <label style="font-weight: normal">系别</label><input type="text" name="dept" id="dept" class="form-control" value="${teacher.dept}">
                                        </div>
                                    </div>
                                    <div class="col-lg-4">
                                        <div class="form-group">
                                            <label style="font-weight: normal">密码</label><input type="text" name="password" id="password" class="form-control" value="${teacher.password}">
                                        </div>
                                    </div>
                                </div>

                                <div class="row">
                                    <div class="col-lg-4">

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
            var gender = $("#gender").val();
            var dept = $("#dept").val();
            var age = $("#age").val();
            var password = $("#password").val();

            if(password.length < 6){
                $.alert({
                    title : '提示',
                    content : '密码长度不能少于6位',
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
                    url : "update_teacher",
                    data : {
                        no : no,
                        name : name,
                        gender : gender,
                        dept : dept,
                        age : age,
                        password : password
                    },
                    dataType : "text",
                    success : function (data) {
                        if(data == "1"){
                            $.alert({
                                title : "提示",
                                content : "修改成功",
                                buttons : {
                                    ok : {
                                        text : '确认',
                                        action : function () {
                                            window.location.href = "teacher_manage.html"
                                        }
                                    }
                                }
                            })
                        } else {
                            $.alert({
                                title : '提示',
                                content : '未知错误',
                                buttons : {
                                    ok : {
                                        text : '确定',
                                        action : function(){}
                                    }
                                }
                            })
                        }
                    }
                })
            }

        })

    })
</script>

</body>

</html>


