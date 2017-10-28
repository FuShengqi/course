<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="java.net.URLDecoder" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">

<head>

    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="description" content="">
    <meta name="author" content="">

    <title>全部课程</title>

    <!-- Bootstrap Core CSS -->
    <link href="assets/vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">

    <!-- MetisMenu CSS -->
    <link href="assets/vendor/metisMenu/metisMenu.min.css" rel="stylesheet">

    <!-- DataTables CSS -->
    <link href="assets/vendor/datatables-plugins/dataTables.bootstrap.css" rel="stylesheet">

    <!-- DataTables Responsive CSS -->
    <link href="assets/vendor/datatables-responsive/dataTables.responsive.css" rel="stylesheet">

    <!-- Custom CSS -->
    <link href="assets/dist/css/sb-admin-2.css" rel="stylesheet">

    <!-- Custom Fonts -->
    <link href="assets/vendor/font-awesome/css/font-awesome.min.css" rel="stylesheet" type="text/css">

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
                        <a href="all_notifications.html"><i class="fa fa-bell-o"></i> 通知公告</a>
                    </li>
                    <li>
                        <a href="all_course_a.html"><i class="fa fa-bars"></i> 全部课程</a>
                    </li>
                    <li>
                        <a href="import_course.html"><i class="fa fa-file-text"></i> 导入课程</a>
                    </li>
                    <li>
                        <a href="teacher_manage.html"><i class="fa fa-user"></i> 教师管理</a>
                    </li>
                    <li>
                        <a href="student_manage.html" class="active"><i class="fa fa-graduation-cap"></i> 学生管理</a>
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
                        <div class="panel-heading">导入课程给学生</div>
                        <div class="panel-body">
                            <div class="row" style="margin-top: 15px" id="table">
                                <div class="col-lg-12">
                                    <div class="table-responsive">
                                        <table class="table table-striped table-bordered table-hover">
                                            <thead>
                                            <tr>
                                                <th>学号</th>
                                                <th>姓名</th>
                                                <th>课程代码</th>
                                                <th>课程名称</th>
                                                <th>授课老师工号</th>
                                                <th style="width: 130px;">操作</th>
                                            </tr>
                                            </thead>
                                            <tbody>
                                            <tr>
                                                <td value = ${student.no}>
                                                    <input type="text" name="sno" id="sno" class="form-control" value="${student.no}" disabled="disabled">
                                                </td>
                                                <td>
                                                    <input type="text" name="sname" id="sname" class="form-control" value="${student.name}" disabled="disabled">
                                                </td>
                                                <td>
                                                    <input type="text" name="cno" id="cno" class="form-control">
                                                </td>
                                                <td>
                                                    <input type="text" name="cname" id="cname" class="form-control">
                                                </td>
                                                <td>
                                                    <input type="text" name="tno" id="tno" class="form-control">
                                                </td>
                                                <td>
                                                    <a type='button' class='btn btn-primary btn-block' id="submit">提交</a>
                                                </td>
                                            </tr>
                                            </tbody>
                                        </table>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                <!-- /.col-lg-12 -->
            </div>
            <!-- /.row -->
        </div>
        <!-- /.container-fluid -->
    </div>
    <!-- /#wrapper -->
</div>

<!-- jQuery -->
<script src="assets/vendor/jquery/jquery.min.js"></script>

<!-- Bootstrap Core JavaScript -->
<script src="assets/vendor/bootstrap/js/bootstrap.min.js"></script>

<!-- Metis Menu Plugin JavaScript -->
<script src="assets/vendor/metisMenu/metisMenu.min.js"></script>

<!-- DataTables JavaScript -->
<script src="assets/vendor/datatables/js/jquery.dataTables.min.js"></script>
<script src="assets/vendor/datatables-plugins/dataTables.bootstrap.min.js"></script>
<script src="assets/vendor/datatables-responsive/dataTables.responsive.js"></script>

<%-- Jquery Confirm JavaScript--%>
<script src="assets/vendor/jquery-confirm/jquery-confirm.min.js"></script>

<!-- Custom Theme JavaScript -->
<script src="assets/dist/js/sb-admin-2.js"></script>

<!-- Page-Level Demo Scripts - Tables - Use for reference -->
<script>

    $(function () {

        $("#cno").blur(function () {
            $.ajax({
                url : 'query_coursename',
                dataType : 'text',
                method : 'POST',
                data : {
                    cno : $("#cno").val()
                },
                success : function (data) {
                    if(data != "0"){
                        $("#cname").val(data);
                    } else {
                        $("#cname").val("");
                        myAlert('提示', '未找到课程代码为'+$("#cno").val()+"的课程");
                    }
                },
                error : function () {
                    myAlert('提示', '导入课程出错');
                }
            })
        })

        $("#submit").click(function () {
            var sno = $("#sno").val();
            var cno = $("#cno").val();
            var tno = $("#tno").val();
            if(cno == null){
                myAlert('提示', '课程代码不能为空');
            } else if(tno == null){
                myAlert('提示', '授课教代码不能为空');
            } else {
                $.ajax({
                    url : 'insert_sc?sno='+sno+"&cno="+cno+"&tno="+tno,
                    dataType : 'text',
                    success : function (data) {
                        myAlert('提示', '导入课程成功');
                    },
                    error : function () {
                        myAlert('提示', '导入课程失败');
                    }
                })
            }
        })
    })

    function myAlert(title, content){
        $.alert({
            title : title,
            content : content,
            buttons : {
                ok : {
                    text : '确定',
                    action : function () {}
                }
            }
        })
    }

</script>

</body>

</html>
