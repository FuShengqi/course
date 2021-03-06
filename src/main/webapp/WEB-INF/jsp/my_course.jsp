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

    <title>我的课程</title>

    <!-- Bootstrap Core CSS -->
    <link href="assets/vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">

    <!-- MetisMenu CSS -->
    <link href="assets/vendor/metisMenu/metisMenu.min.css" rel="stylesheet">

    <!-- DataTables CSS -->
    <link href="assets/vendor/datatables-plugins/dataTables.bootstrap.css" rel="stylesheet">

    <!-- DataTables Responsive CSS -->
    <link href="assets/vendor/datatables-responsive/dataTables.responsive.css" rel="stylesheet">

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
                    <li>
                        <a href="tn.html"><i class="fa fa-bell-o"></i> 教务通知</a>
                    </li>
                    <li class="active">
                        <a href="my_course.html" class="active"><i class="fa fa-check"></i> 我的课程</a>
                    </li>
                    <li>
                        <a href="change_passwdt.html"><i class="fa fa-key"></i> 修改密码</a>
                    </li>
                    <%--<li>
                        <a href="not_selected_course"><i class="fa fa-circle-o"></i> 未选课程</a>
                    </li>--%>
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
                    <div class="panel panel-default">
                        <div class="panel-heading">
                            我的课程
                        </div>
                        <!-- /.panel-heading -->
                        <div class="panel-body">
                            <table width="100%" class="table table-striped table-bordered table-hover" id="dataTables-example">
                                <thead>
                                <tr>
                                    <th>课程代码</th>
                                    <th>课程名称</th>
                                    <th>课程性质</th>
                                    <th>学分</th>
                                    <th>容量</th>
                                    <th>已选人数</th>
                                    <th>操作</th>
                                </tr>
                                </thead>
                                <tbody>
                                <!--<tr>
                                    <td>Trident</td>
                                    <td>Internet Explorer 4.0</td>
                                    <td>Win 95+</td>
                                    <td class="center">4</td>
                                    <td class="center">X</td>
                                </tr>-->

                                </tbody>
                            </table>
                        </div>
                        <!-- /.panel-body -->
                    </div>
                    <!-- /.panel -->
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

<!-- DataTables JavaScript -->
<script src="assets/vendor/datatables/js/jquery.dataTables.min.js"></script>
<script src="assets/vendor/datatables-plugins/dataTables.bootstrap.min.js"></script>
<script src="assets/vendor/datatables-responsive/dataTables.responsive.js"></script>

<%-- Jquery Confirm JavaScript--%>
<script src="assets/vendor/jquery-confirm/jquery-confirm.min.js"></script>

<!-- Custom Theme JavaScript -->
<script src="assets/dist/js/sb-admin-2.js"></script>

<script>
    var table;

    $(document).ready(function() {

        /*初始化表格并填入数据*/
        table = $('#dataTables-example').DataTable({
            responsive: true,
            autoWWidth : false,
            /*"columns": [
             { "width": "20%" },
             { "width": "20%" },
             { "width": "20%" },
             { "width": "10%" },
             { "width": "10%" },
             { "width": "20%" }
             ],*/
            columns : [
                {data : 'no'},
                {data : 'name'},
                {data : 'type'},
                {data : 'credit'},
                {data : 'capacity'},
                {data : null},
                {data : null}
            ],
            columnDefs : [{
                targets : 6,
                width : "16%",
                orderable : false,
                render : function (data, type, row, meta) {
                    return "<a type='button' class='btn btn-link' style='padding: 0px 0px' onclick=detail('" + row.no + "')>详细信息</a>" +
                        "&nbsp; <a type='button' class='btn btn-link' style='padding: 0px 0px' onclick=importScore('" + row.no + "')>录入分数</a>";
                }
            },
                {
                    targets : 1,
                    width : "20%",
                    orderable: false
                },
                {
                    targets : 2,
                    width : "20%",
                    orderable: false
                },
                {
                    targets : 5,
                    render : function (data, type, row, meta) {
                        var num = data.capacity - data.residualCapacity;
                        return "<a type='button' class='btn btn-link' style='padding: 0px 0px' onclick=showStudents('" + row.no + "')>"+ num +"</a>";
                    }
                }
            ],
            ajax : {
                url : "my_course?tno=" + get_cookie("tno"),
                dataSrc : ""
            },
            language : {
                "emptyTable" : "暂无数据",
                "info" : "显示从第 _START_ 项到第 _END_ 项(共 _TOTAL_ 项)",
                "infoEmpty" : "暂无数据",
                "lengthMenu": "每页显示 _MENU_ 项",
                "search":         "搜索:",
                "loadingRecords": "加载中...",
                "processing":     "处理中...",
                "zeroRecords":    "无搜索结果",
                "paginate": {
                    "first":      "First",
                    "last":       "Last",
                    "next":       "后一页",
                    "previous":   "前一页"
                },
                "aria": {
                    "sortAscending":  ": activate to sort column ascending",
                    "sortDescending": ": activate to sort column descending"
                }
            },
            colReorder: {
                fixedColumnsLeft: 1
            }
        });
        /*初始化表格并填入数据*/

    });

    /*显示课程详细信息*/
    function detail(no) {
        console.log(no)
        $.confirm({
            title: '详细信息',
            boxWidth: '750px',
            useBootstrap: false,
            content: function () {
                var self = this;
                return $.ajax({
                    url: 'course_detail?no=' + no,
                    dataType: 'html',
                    method: 'get'
                }).done(function (response) {
                    self.setContent(response);
                    /*self.setContentAppend('<br>课程名称: ' + response.name);*/
                    /*self.setTitle(response.name);*/
                }).fail(function(){
                    self.setContent('出错了，刷新试试');
                });
            },
            onContentReady: function () {
                /*var self = this;
                 this.setContentPrepend('<div>Prepended text</div>');
                 setTimeout(function () {
                 self.setContentAppend('<div>Appended text after 2 seconds</div>');
                 }, 2000);*/
            },
            contentLoaded: function(data, status, xhr){
                // data is already set in content
                /*this.setContentAppend('<br>Status: ' + status);*/
            },
            columnClass: 'medium',
            buttons : {
                ok : {
                    text : "确定",
                    action : function () {

                    }
                }
            },
            backgroundDismiss: true
        });
    }

    function showStudents(cno){
        $.confirm({
            title: '选择该课程的学生',
            boxWidth: '750px',
            useBootstrap: false,
            content: function () {
                var self = this;
                return $.ajax({
                    url: 'show_students?cno='+cno+"&tno="+get_cookie("tno"),
                    dataType: 'html',
                    method: 'get'
                }).done(function (response) {
                    self.setContent(response);
                    /*self.setContentAppend('<br>课程名称: ' + response.name);*/
                    /*self.setTitle(response.name);*/
                }).fail(function(){
                    self.setContent('出错了，刷新试试');
                });
            },
            onContentReady: function () {
                /*var self = this;
                 this.setContentPrepend('<div>Prepended text</div>');
                 setTimeout(function () {
                 self.setContentAppend('<div>Appended text after 2 seconds</div>');
                 }, 2000);*/
            },
            contentLoaded: function(data, status, xhr){
                // data is already set in content
                /*this.setContentAppend('<br>Status: ' + status);*/
            },
            columnClass: 'medium',
            buttons : {
                ok : {
                    text : "确定",
                    action : function () {
                    }
                }
            },
            backgroundDismiss: false
        });
    }

    function importScore(cno) {
        window.location.href = "import_score.html?cno=" + cno;
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

</script>

</body>

</html>

