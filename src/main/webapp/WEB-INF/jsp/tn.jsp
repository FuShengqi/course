<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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
    String tname = null;
    String tno = null;
    Cookie[] cookies = request.getCookies();
    for(Cookie cookie : cookies){
        if(cookie.getName().equals("tname")){
            tname = URLDecoder.decode(cookie.getValue(), "UTF-8");
            /*System.out.println(tname);*/
        }
        if(cookie.getName().equals("tno")){
            tno = cookie.getValue();
            /*System.out.println(tno);*/
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
                <i class="fa fa-user fa-fw"></i> <span><%=tname%></span> &nbsp;&nbsp;<a href="tlogout.html" style="display: inline"><i class="fa fa-sign-out" aria-hidden="true"></i>退出</a>
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
                        <a href="notification.html" class="active"><i class="fa fa-bell-o"></i> 教务通知</a>
                    </li>
                    <li>
                        <a href="my_course.html"><i class="fa fa-check"></i> 我的课程</a>
                    </li>
                    <li>
                        <a href="change_passwdt.html"><i class="fa fa-key"></i> 修改密码</a>
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
                                暂时没有通知
                            </div>
                        </c:when>
                        <c:otherwise>
                            <div class="panel panel-default">
                                <div class="panel-heading">
                                    <span>所有通知</span>
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

<!-- Metis Menu Plugin JavaScript -->
<script src="assets/vendor/metisMenu/metisMenu.min.js"></script>

<%-- Jquery Confirm JavaScript--%>
<script src="assets/vendor/jquery-confirm/jquery-confirm.min.js"></script>

<!-- Custom Theme JavaScript -->
<script src="assets/dist/js/sb-admin-2.js"></script>

<script>
    $(".notify-list").each(function () {
        $(this).click(function () {
            var id = $(this).find("span:eq(0)").text();
            window.location.href = 'tn_detail?id='+id;
        })
    })
</script>

</body>

</html>

