<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
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

    <title>首页</title>

    <!-- Bootstrap Core CSS -->
    <link href="assets/vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">

    <!-- MetisMenu CSS -->
    <link href="assets/vendor/metisMenu/metisMenu.min.css" rel="stylesheet">

    <%-- Jquery Confirm CSS --%>
    <link href="assets/vendor/jquery-confirm/jquery-confirm.min.css" rel="stylesheet" type="text/css">

    <!-- Custom CSS -->
    <link href="assets/dist/css/sb-admin-2.css" rel="stylesheet">

    <!-- Custom Fonts -->
    <link href="assets/vendor/font-awesome/css/font-awesome.min.css" rel="stylesheet" type="text/css">

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
                    <li class="active">
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
            <br>
            <!-- /.row -->
            <div class="row">
                <div class="col-lg-12">
                    <c:choose>
                        <c:when test="${fn:length(notifyList) == 0}">
                            <br>
                            <div class="alert alert-info" role="alert">
                                还没有发布教务通知，<<a href="edit_notification">发布一条通知</a>
                            </div>
                        </c:when>
                        <c:otherwise>
                            <div class="panel panel-default">
                                <div class="panel-heading">
                                    <span>所有通知</span><button id="notify" class="btn btn-default" style="float: right; margin-top: -7px">发布新通知</button><%--<span id="notify" style="float: right"><i class="fa fa-plus-circle"></i></span>--%>
                                </div>
                                <!-- /.panel-heading -->
                                <div class="panel-body">
                                    <div class="row">
                                        <div class="col-lg-12">
                                            <c:forEach items="${notifyList}" var="notify">
                                                <div class="list-group">
                                                    <button type="button" class="list-group-item notify-list"><c:out value="${notify.title}"></c:out><span class="hidden" class="id"><c:out value="${notify.id}"></c:out></span><span style="float: right">发布日期：<c:out value="${notify.time}"></c:out></span></button>
                                                </div>
                                            </c:forEach>
                                        </div>
                                    </div>
                                    <div class="row">
                                        <div class="col-lg-4 col-lg-offset-8">

                                        </div>
                                    </div>
                                </div>
                                <!-- /.panel-body -->
                            </div>
                            <!-- /.panel -->
                        </c:otherwise>
                    </c:choose>

                </div>
            </div>
            <!-- /.container-fluid -->
        </div>
        <!-- /#page-wrapper -->
    </div>
    <!-- /#page-wrapper -->

</div>
<!-- /#wrapper -->

<!-- jQuery -->
<script src="assets/vendor/jquery/jquery.min.js"></script>

<!-- Bootstrap Core JavaScript -->
<script src="assets/vendor/bootstrap/js/bootstrap.min.js"></script>

<%-- Jquery Confirm JavaScript--%>
<script src="assets/vendor/jquery-confirm/jquery-confirm.min.js"></script>

<!-- Metis Menu Plugin JavaScript -->
<script src="assets/vendor/metisMenu/metisMenu.min.js"></script>

<!-- Custom Theme JavaScript -->
<script src="assets/dist/js/sb-admin-2.js"></script>

<script>
    $(function () {
        $("#notify").click(function () {
            window.location.href = 'edit_notification';
        });

        $(".notify-list").each(function () {
            $(this).click(function () {
                var id = $(this).find("span:eq(0)").text();
                window.location.href = 'show_detail?id='+id;
            })
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

    Date.prototype.Format = function (fmt) { //author: meizz
        var o = {
            "M+": this.getMonth() + 1, //月份
            "d+": this.getDate(), //日
            "h+": this.getHours(), //小时
            "m+": this.getMinutes(), //分
            "s+": this.getSeconds(), //秒
            "q+": Math.floor((this.getMonth() + 3) / 3), //季度
            "S": this.getMilliseconds() //毫秒
        };
        if (/(y+)/.test(fmt)) fmt = fmt.replace(RegExp.$1, (this.getFullYear() + "").substr(4 - RegExp.$1.length));
        for (var k in o)
            if (new RegExp("(" + k + ")").test(fmt)) fmt = fmt.replace(RegExp.$1, (RegExp.$1.length == 1) ? (o[k]) : (("00" + o[k]).substr(("" + o[k]).length)));
        return fmt;
    }
</script>

</body>

</html>

