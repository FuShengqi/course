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
                        <a href="notification.html"><i class="fa fa-bell-o"></i> 教务通知</a>
                    </li>
                    <li class="active">
                        <a href="my_course.html" class="active"><i class="fa fa-check"></i> 我的课程</a>
                    </li>
                    <%--<li>
                        <a href="all_course.html"><i class="fa fa-bars"></i> 学生选课情况</a>
                    </li>--%>
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
                                    <th>学号</th>
                                    <th>姓名</th>
                                    <th>性别</th>
                                    <th>专业</th>
                                    <th>班级</th>
                                    <th>平时成绩</th>
                                    <th>期末成绩</th>
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
            <div class="row">
                <div class="col-lg-4"></div>
                <div class="col-lg-4"></div>
                <div class="col-lg-4">
                    <button type="button" class="btn btn-primary full-width btn-block" id="submit">提交</button>
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
             { "width": "15%" },
             { "width": "15%" },
             { "width": "10%" },
             { "width": "25%" },
             { "width": "25%" },
             { "width": "10%" }
             ],*/
            columns : [
                {data : 'no'},
                {data : 'name'},
                null,
                {data : 'major'},
                {data : 'clazz'},
                {data : null},
                {data : null}
            ],
            columnDefs : [{
                targets : 6,
                width : "10%",
                orderable : false,
                render : function (data, type, row, meta) {
                    return "<input type='text' class='form-control input-sm final-score'>";
                }
            },
                {
                    targets : 0,
                    width : "15%"
                },
                {
                    targets : 1,
                    width : "10%",
                    orderable: false
                },
                {
                    targets : 2,
                    width : "10%",
                    orderable: false,
                    render : function (data, type, row, meta) {
                        var sex;
                        if(row.sex){
                            sex = '女';
                        } else {
                            sex = '男';
                        }
                        return "<span>" + sex + "</span>";
                    }
                },
                {
                    targets : 3,
                    width : "25%",
                    orderable : false
                },
                {
                    targets : 4,
                    width : "20%",
                    orderable : false
                },
                {
                    targets : 5,
                    width : "10%",
                    orderable: false,
                    render : function (data, type, row, meta) {
                        var num = data.capacity - data.residualCapacity;
                        return "<input class='form-control input-sm' type='text'>"
                    }
                }
            ],
            ajax : {
                url : "import_score?cno=" + getValueInUrl("cno"),
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

        $("#submit").click(function () {

            var complete = true;
            var scores = new Array();

            $(".final-score").each(function () {
                console.log($(this).val())
                console.log($(this).parent().prev().find("input").val())
                console.log($(this).parent().parent().children("td:first-child").text())

                var finalScore = $(this).val();
                var normalScore = $(this).parent().prev().find("input").val();
                var sno = $(this).parent().parent().children("td:first-child").text();
                var cno = getValueInUrl("cno");
                var score = 0.3*normalScore + 0.7*finalScore;
                score = score.toFixed(1);

                if(finalScore == null || normalScore == null){
                    complete = false;
                }

                var entity = {
                    grade : score,
                    stuNo : sno,
                    cosNo : cno
                };
                /*entity.grade = score;
                entity.stuNo = sno;
                entity.cosNo = cno;*/

                scores.push(entity)
            })

            if(complete){
                $.ajax({
                    url : "input_score",
                    data : {"scores" : JSON.stringify(scores)},
                    dataType : "text",
                    success : function () {
                        $.alert("录入成功");
                    },
                    error : function () {
                        $.alert("录入分数出错，请重新录入");
                    }
                })
            }

        })

    });

    /*显示课程详细信息*/
    function detail(no) {
        console.log(no)
        $.confirm({
            title: '详细信息',
            /*boxWidth: '750px',
            useBootstrap: false,*/
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

    function getValueInUrl(name)
    {
        var reg = new RegExp("(^|&)"+ name +"=([^&]*)(&|$)");
        var r = window.location.search.substr(1).match(reg);
        if(r!=null)return  unescape(r[2]); return null;
    }

</script>

</body>

</html>

