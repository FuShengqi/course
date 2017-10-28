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
                    <li class="active">
                        <a href="import_course.html" class="active"><i class="fa fa-file-text"></i> 导入课程</a>
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
                        <div class="panel-heading">编辑课程并导入</div>
                        <div class="panel-body">
                            <form role="form" id="course-info">
                                <div class="row">
                                    <div class="col-lg-4">
                                        <div class="form-group">
                                            <label style="font-weight: normal">课程代码</label><input name="no" id="no" type="text" class="form-control" autofocus>
                                        </div>
                                    </div>
                                    <div class="col-lg-4">
                                        <div class="form-group">
                                            <label style="font-weight: normal">课程名称</label><input type="text" name="name" id="name" class="form-control">
                                        </div>
                                    </div>
                                    <div class="col-lg-4">
                                        <div class="form-group">
                                            <label style="font-weight: normal">课程类型</label>
                                            <select class="form-control" name="type" id="type">
                                                <option value="专业核心课">专业核心课</option>
                                                <option value="专业选修课">专业选修课</option>
                                                <option value="公共基础课">公共基础课</option>
                                                <option value="实践教育">实践教育</option>
                                                <option value="体育课">体育课</option>
                                            </select>
                                        </div>
                                    </div>
                                </div>

                                <div class="row">
                                    <div class="col-lg-4">
                                        <div class="form-group">
                                            <label style="font-weight: normal">开课专业</label><input type="text" name="dept" id="dept" class="form-control">
                                        </div>
                                    </div>
                                    <div class="col-lg-4">
                                        <div class="form-group">
                                            <label style="font-weight: normal">授课教师</label><input type="text" name="teacher" id="teacher" class="form-control">
                                        </div>
                                    </div>
                                    <div class="col-lg-4">
                                        <div class="form-group">
                                            <label style="font-weight: normal">课程容量</label><input type="text" name="capacity" id="capacity" class="form-control">
                                        </div>
                                    </div>
                                </div>

                                <div class="row">
                                    <div class="col-lg-4">
                                        <label style="font-weight: normal">开始时间</label>
                                        <div class="input-group">
                                            <span class="input-group-addon">第</span>
                                            <select class="form-control" name="start-week" id="start-week">
                                                <option value="1">1</option>
                                                <option value="2">2</option>
                                                <option value="3">3</option>
                                                <option value="4">4</option>
                                                <option value="5">5</option>
                                                <option value="6">6</option>
                                                <option value="7">7</option>
                                                <option value="8">8</option>
                                                <option value="9">9</option>
                                                <option value="10">10</option>
                                                <option value="11">11</option>
                                                <option value="12">12</option>
                                                <option value="13">13</option>
                                                <option value="14">14</option>
                                                <option value="15">15</option>
                                                <option value="16">16</option>
                                                <option value="17">17</option>
                                                <option value="18">18</option>
                                            </select>
                                            <span class="input-group-addon">周</span>
                                        </div>
                                    </div>
                                    <div class="col-lg-4">
                                        <label style="font-weight: normal">结束时间</label>
                                        <div class="input-group">
                                            <span class="input-group-addon" id="basic-addon1">第</span>
                                            <!--<input type="text" class="form-control" aria-describedby="basic-addon1">-->
                                            <select class="form-control" name="end-week" id="end-week">
                                                <option value="1">1</option>
                                                <option value="2">2</option>
                                                <option value="3">3</option>
                                                <option value="4">4</option>
                                                <option value="5">5</option>
                                                <option value="6">6</option>
                                                <option value="7">7</option>
                                                <option value="8">8</option>
                                                <option value="9">9</option>
                                                <option value="10">10</option>
                                                <option value="11">11</option>
                                                <option value="12">12</option>
                                                <option value="13">13</option>
                                                <option value="14">14</option>
                                                <option value="15">15</option>
                                                <option value="16">16</option>
                                                <option value="17">17</option>
                                                <option value="18">18</option>
                                            </select>
                                            <span class="input-group-addon" id="basic-addon2">周</span>
                                        </div>
                                    </div>
                                    <div class="col-lg-4">
                                        <div class="form-group">
                                            <label style="font-weight: normal">课程学分</label><input type="text" name="credit" id="credit" class="form-control">
                                        </div>
                                    </div>
                                </div>

                                <div class="row">
                                    <div class="col-lg-4">
                                        <div class="form-group">
                                            <label style="font-weight: normal">填写日期</label><br>
                                            <!--<label class="checkbox-inline">
                                                <input type="checkbox" value="1" name="day-of-week">周一
                                            </label>
                                            <label class="checkbox-inline">
                                                <input type="checkbox" value="2" name="day-of-week">周二
                                            </label>
                                            <label class="checkbox-inline">
                                                <input type="checkbox" value="3" name="day-of-week">周三
                                            </label>
                                            <label class="checkbox-inline">
                                                <input type="checkbox" value="4" name="day-of-week">周四
                                            </label>
                                            <label class="checkbox-inline">
                                                <input type="checkbox" value="5" name="day-of-week">周五
                                            </label>
                                            <label class="checkbox-inline">
                                                <input type="checkbox" value="6" name="day-of-week">周六
                                            </label>
                                            <label class="checkbox-inline">
                                                <input type="checkbox" value="7" name="day-of-week">周日
                                            </label>-->
                                            <input type="text" placeholder="如：周一1,2节" name="date1" id="date1" class="form-control">
                                        </div>
                                    </div>
                                    <div class="col-lg-4">
                                        <div class="form-group">
                                            <!--<label style="font-weight: normal">选择节数</label><br>
                                            <label class="checkbox-inline">
                                                <input type="checkbox" value="1" name="section-of-day">1
                                            </label>
                                            <label class="checkbox-inline">
                                                <input type="checkbox" value="2" name="section-of-day">2
                                            </label>
                                            <label class="checkbox-inline">
                                                <input type="checkbox" value="3" name="section-of-day">3
                                            </label>
                                            <label class="checkbox-inline">
                                                <input type="checkbox" value="4" name="section-of-day">4
                                            </label>
                                            <label class="checkbox-inline">
                                                <input type="checkbox" value="5" name="section-of-day">5
                                            </label>
                                            <label class="checkbox-inline">
                                                <input type="checkbox" value="6" name="section-of-day">6
                                            </label>
                                            <label class="checkbox-inline">
                                                <input type="checkbox" value="7" name="section-of-day">7
                                            </label>
                                            <label class="checkbox-inline">
                                                <input type="checkbox" value="8" name="section-of-day">8
                                            </label>
                                            <label class="checkbox-inline">
                                                <input type="checkbox" value="9" name="section-of-day">9
                                            </label>
                                            <label class="checkbox-inline">
                                                <input type="checkbox" value="10" name="section-of-day">10
                                            </label>
                                            <label class="checkbox-inline">
                                                <input type="checkbox" value="11" name="section-of-day">11
                                            </label>-->
                                            <label style="font-weight: normal">填写日期</label><br>
                                            <input type="text" placeholder="如：周一1,2节" name="date2" id="date2" class="form-control">
                                        </div>
                                    </div>
                                    <div class="col-lg-4">
                                        <div class="form-group">
                                            <label style="font-weight: normal">填写日期</label><br>
                                            <input type="text" placeholder="如：周一1,2节" name="date3" id="date3" class="form-control">
                                        </div>
                                    </div>
                                </div>

                                <div class="row">
                                    <div class="col-lg-4">
                                        <label style="font-weight: normal">上课地点</label><input type="text" name="class-place" id="class-place" class="form-control">
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

    <!-- Modal -->
    <div class="modal fade" id="myModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
        <div class="modal-dialog" role="document">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title" id="exampleModalLabel">提示</h5>
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                        <span aria-hidden="true">&times;</span>
                    </button>
                </div>
                <div class="modal-body">
                    开始周数不能晚于结束周数
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-primary">知道了</button>
                </div>
            </div>
        </div>
    </div>

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
                console.log("ajax");
                $.ajax({
                    type : "POST",
                    url : "import_course",
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

            /*var dayOfWeek = new Array();
             var sectionOfDay = new Array();*/

            /*$("[name=day-of-week]:checkbox").each(function () {
             if(this.checked){
             dayOfWeek.push($(this).val());
             }
             })

             $("[name=section-of-day]:checkbox").each(function () {
             if(this.checked){
             sectionOfDay.push($(this).val());
             }
             })*/

            /*for(var i=0; i<dayOfWeek.length; i++){
             console.log(dayOfWeek[i]);
             }
             for(var i=0; i<sectionOfDay.length; i++){
             console.log(sectionOfDay[i]);
             }

             if(startWeek > endWeek){
             $("#myModal").modal();
             } else {

             }*/

        })

        /*$("#course-info").submit(function () {

         console.log($("#no").val());
         console.log($("#name").val());
         console.log($("#type").val());
         console.log($("#dept").val());
         console.log($("#teacher").val());
         console.log($("#capacity").val());
         console.log($("#start-week").val());
         console.log($("#end-week").val());
         console.log($("#credit").val());

         $.ajax({
         type : "post",
         url : "import_course",
         data: {}
         })
         })*/

    })
</script>

</body>

</html>


