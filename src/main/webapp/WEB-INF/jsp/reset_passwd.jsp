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
                        <a href="publish.html"><i class="fa fa-bell-o"></i> 发布通知</a>
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
                        <div class="panel-heading">修改登录密码</div>
                        <div class="panel-body">
                            <form role="form" id="course-info">
                                <div class="row">
                                    <div class="col-lg-4 col-lg-offset-4">
                                        <div class="form-group">
                                            <label style="font-weight: normal">输入旧密码</label><input name="no" id="oldPasswd" type="password" class="form-control" autofocus>
                                        </div>
                                    </div>
                                </div>
                                <div class="row">
                                    <div class="col-lg-4 col-lg-offset-4">
                                        <div class="form-group">
                                            <label style="font-weight: normal">输入新密码</label><input name="no" id="newPasswd" type="password" class="form-control" autofocus>
                                        </div>
                                    </div>
                                </div>
                                <div class="row">
                                    <div class="col-lg-4 col-lg-offset-4">
                                        <div class="form-group">
                                            <label style="font-weight: normal">重复新密码</label><input name="no" id="repeatNewPasswd" type="password" class="form-control" autofocus>
                                        </div>
                                    </div>
                                </div>
                                <div class="row">
                                    <div class="col-lg-4 col-lg-offset-4">
                                        <div class="form-group">
                                            <button type="button" class="btn btn-primary full-width btn-block" id="submit">提交</button>
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
    $("#submit").click(function () {
        var oldPasswd = $("#oldPasswd").val();
        var newPasswd = $("#newPasswd").val();
        var repeatNewPasswd = $("#repeatNewPasswd").val();

        if(newPasswd.length < 6){
            $.alert({
                title : '提示',
                content : '密码长度要不少于6位',
                backgroundDismiss : true,
                buttons : {
                    ok : {
                        text : '确定',
                        action : function () {}
                    }
                }
            });
        } else if(newPasswd.length > 20){
            $.alert({
                title : '提示',
                content : '密码长度要不超过20位',
                backgroundDismiss : true,
                buttons : {
                    ok : {
                        text : '确定',
                        action : function () {}
                    }
                }
            });
        } else if(newPasswd != repeatNewPasswd){
            $.alert({
                title : '提示',
                content : '两次输入的新密码不一致',
                backgroundDismiss : true,
                buttons : {
                    ok : {
                        text : '确定',
                        action : function () {}
                    }
                }
            });
        } else {
            $.ajax({
                url : 'reset_passwd',
                data : {
                    oldPasswd : oldPasswd,
                    newPasswd : newPasswd,
                    ano : get_cookie("ano")
                },
                success : function (data) {
                    if(data == "1"){
                        $.alert({
                            title : '提示',
                            content : '密码修改成功,请重新登录',
                            backgroundDismiss : true,
                            buttons : {
                                ok : {
                                    text : '确定',
                                    action : function () {
                                        window.location.href = "/";
                                    }
                                }
                            }
                        });
                    } else {
                        $.alert({
                            title : '提示',
                            content : "旧密码输入不正确",
                            backgroundDismiss : true,
                            buttons : {
                                ok : {
                                    text : '确定',
                                    action : function () {}
                                }
                            }
                        });
                    }
                },
                error : function (data) {
                    $.alert({
                        title : '提示',
                        content : '未知错误',
                        backgroundDismiss : true,
                        buttons : {
                            ok : {
                                text : '确定',
                                action : function () {}
                            }
                        }
                    });
                }
            })
        }
    })

    function get_cookie(Name) {
        var search = Name + "="//查询检索的值
        var returnvalue = "";//返回值
        if (document.cookie.length > 0) {
            sd = document.cookie.indexOf(search);
            if (sd!= -1) {
                sd += search.length;
                end = document.cookie.indexOf(";", sd);
                if (end == -1)
                    end = document.cookie.length;
                //unescape() 函数可对通过 escape() 编码的字符串进行解码。
                returnvalue=unescape(document.cookie.substring(sd, end))
            }
        }
        return returnvalue;
    }
</script>

</body>

</html>
