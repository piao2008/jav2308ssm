
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <!-- Tell the browser to be responsive to screen width -->
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="description" content="">
    <meta name="author" content="">
    <title>顺顺顺顺系统</title>
    <jsp:include page="../share/resources_css.jsp"></jsp:include>
<%--    日历插件的样式表--%>
    <link href="${pageContext.request.contextPath}/resources/assets/libs/fullcalendar/dist/fullcalendar.min.css" rel="stylesheet" />
    <link href="${pageContext.request.contextPath}/resources/assets/extra-libs/calendar/calendar.css" rel="stylesheet" />
    <link href="${pageContext.request.contextPath}/resources/dist/css/style.min.css" rel="stylesheet">
</head>
<body>
<div id="main-wrapper">
    <!-- ============================================================== -->
    <!-- Topbar header - style you can find in pages.scss -->
    <jsp:include page="../share/top.jsp"></jsp:include>
    <!-- ============================================================== -->
    <!-- End Topbar header -->
    <!-- ============================================================== -->
    <!-- ============================================================== -->
    <!-- Left Sidebar - style you can find in sidebar.scss  -->
    <jsp:include page="../share/menu.jsp"></jsp:include>
    <!-- ============================================================== -->
    <!-- End Left Sidebar - style you can find in sidebar.scss  -->
    <!-- ============================================================== -->
    <!-- ============================================================== -->
    <!-- Page wrapper  -->
    <!-- ============================================================== -->
    <div class="page-wrapper">
        <!-- ============================================================== -->
        <!-- Bread crumb and right sidebar toggle -->
        <!-- ============================================================== -->
        <div class="page-breadcrumb">
            <div class="row">
                <div class="col-12 d-flex no-block align-items-center">
                    <h4 class="page-title">日程界面</h4>
                    <div class="ml-auto text-right">
                        <nav aria-label="breadcrumb">
                            <ol class="breadcrumb">
                                <li class="breadcrumb-item"><a href="#">Home</a></li>
                                <li class="breadcrumb-item active" aria-current="page">Library</li>
                            </ol>
                        </nav>
                    </div>
                </div>
            </div>
        </div>
        <!-- ============================================================== -->
        <!-- End Bread crumb and right sidebar toggle -->
        <!-- ============================================================== -->
        <!-- ============================================================== -->
        <!-- Container fluid  -->
        <!-- ============================================================== -->
        <div class="container-fluid">
            <!-- ============================================================== -->
            <!-- Start Calender  -->
            <!-- ============================================================== -->
            <div class="row">

                <div class="col-md-12">
                    <div class="card">
                        <div class="card-body">
                            <!-- <h5 class="card-title m-b-0">Static Table With Checkboxes</h5> -->
                            <!-- ==============================================================-->
                            <!-- Start Search Content -->
                            <!-- ==============================================================-->
                            <div class="form-row" style="margin: 0.3125rem 0;">
                                <form class="form-inline navbar-form navbar-left" method="post" action="schedule/list">
                                    <!-- 搜索框 -->
                                    <div class="input-group" style="margin-right: 0.3125rem;">
                                        <input type="text" id="title" name="title" class="form-control" placeholder="请输入标题查询" >
                                    </div>
                                    <!-- 下拉列表搜索 -->
                                    <div class="input-group" style="margin-right: 0.3125rem;">
                                        <select class="form-control" id="state"  name="state" >
                                            <option value="-1">==选择状态==</option>
                                            <option value="1">未完成</option>
                                            <option value="2">完成</option>
                                            <option value="3">进行中</option>
                                        </select>
                                    </div>
                                    &nbsp;&nbsp;&nbsp;&nbsp;
                                    <!-- 搜索框 -->
                                    <div class="input-group" style="margin-right: 0.3125rem;">
                                        <span style="margin-top: 10px">日程时间 : </span>&nbsp;
                                        <input type="date" id="begintime" name="begintime"  class="form-control" >
                                    </div>
                                    <div class="input-group" style="margin-right: 0.3125rem;">
                                        <span style="margin-top: 10px"> 至 </span>&nbsp;
                                        <input type="date" id="end_time" name="endtime"  class="form-control" >
                                    </div>
                                    &nbsp;&nbsp;
                                    <!-- 按钮和超链接 -->
                                    <div class="input-group" style="margin-right: 0.3125rem;">
						   	<span class="input-group-btn">
								<button type="button" onclick="search()" class="btn btn-success">查询</button>
							</span>
                                        <span class="input-group-btn">
								<a href="schedule/append" class="btn btn-primary" style="margin-left: 5px;">添加</a>
							</span>
                                    </div>
                                </form>
                            </div>
                            <!-- ==============================================================-->
                            <!-- end Search Content -->
                            <!-- ==============================================================-->

                        </div>


                        <!-- ============================================================== -->
                        <!-- end Tables Content -->
                        <!-- ============================================================== -->
                    </div>
                </div>

                <div class="card">
                    <!-- <h5 class="card-title">Calender日历</h5> -->
                    <div class="card-header">
                        <div class="row">
                            <div class="col-2" style="height: 30px;line-height: 30px; text-align: center;">个人日程</div>
                            <div class="col-1" style="height: 30px; background: red; line-height: 30px; text-align: center;">私有</div>
                            <div class="col-1" style="height: 30px; background: yellow; text-align: center;line-height: 30px;">公有</div>
                        </div>
                    </div>
                    <div class="col-md-12">
                        <div class="card-body b-l calender-sidebar">
                            <div id="calendar"></div>
                        </div>
                    </div>

                </div>
            </div>

        </div>


        <!-- ============================================================== -->
        <!-- end Calender -->
        <!-- ============================================================== -->
    </div>
    <!-- ============================================================== -->
    <!-- End Page wrapper  -->
    <!-- ============================================================== -->
</div>

<jsp:include page="../share/resources_js.jsp"></jsp:include>
<!-- this calendar js 日历插件js -->
<script src="${pageContext.request.contextPath}/resources/assets/libs/moment/min/moment.min.js"></script>
<script src="${pageContext.request.contextPath}/resources/assets/libs/fullcalendar/dist/fullcalendar.min.js"></script>
<!-- <script src="./dist/js/pages/calendar/cal-init.js"></script> -->
<script src="${pageContext.request.contextPath}/resources/assets/libs/fullcalendar/dist/locale/zh-cn.js"></script>


<script type="text/javascript">

    //查询
    function  search()
    {
        //重新加载数据显示
        $('#calendar').fullCalendar( 'refetchEvents' );
        init()
    }
    //ajax设置为同步
    $.ajaxSetup({
        //同步
        async:false
    })

    function  init()
    {
        var cal = $('#calendar').fullCalendar({
            //日历头部左边：初始化切换按钮
            header: {

                left: '',
                //日历头部中间：显示当前日期信息
                center: 'title',
                //日历头部右边：初始化视图
                right: 'prev,next today'
            },
            editable: true,
            //设置是否可被单击
            selectable: false,
            //设置是否显示周六和周日，设为false则不显示
            weekends: true,
            drop: //拖拽
                function(date) {
                    $this.onDrop($(this), date);
                    alert("drop")
                },
            dayClick: ///点击日历每天时的点击事件
                function(date, allDay, jsEvent, view) {
                    alert(date)
                    //var date1=new Date(date)
                    //var date2=date1.Format("yyyy-MM-dd");
                    //location.href="http://www.baidu.com?id="+date2;

                },
            eventClick: //当点击日历中的某一日程
                function(date, allDay, jsEvent, view) {
                    // console.log(date); //calEvent是日程（事件）对象
                    // console.log(view)
                    // console.log(date.title)
                    // console.log(date.id)
                    // alert(date.title)
                },
            events: //日程数据
                function(start, end, timezone, callback) {
                    //var events=new Array();
                    //数组
                    var events = [];
                    //ajax
                    let url='${pageContext.request.contextPath}/schedule/getschedulelist'
                    //json
                    let params={
                        "title":$("#title").val(),
                        "state":$("#state").val(),
                        "begintime":$("#begintime").val(),
                        "end_time":$("#end_time").val()
                    }

                    console.log(params)
                    $.get(url,params,function (data){
                        //遍历data (json对象数组)
                        $.each(data,function (index,obj){
                            events.push({
                                id: obj.scheduleid,
                                title: obj.title,
                                start: obj.begintime,
                                end: obj.endtime,
                                color: obj.ifprivate==1?'red':'blue',
                                url: '${pageContext.request.contextPath}/schedule/edit?scheduleId='+obj.scheduleid
                            })
                        })

                    },"json")
                    // console.log(events)
                    // var date = new Date();
                    // var nowDate = date.Format("yyyyMMdd");
                    // var nowTime = date.Format("hhmmss");
                    // events = [{
                    //     id: 9,
                    //     title: 'Birthday Party',
                    //     start: '2023-12-07',
                    //     end: '2023-12-15',
                    //     color: 'green',
                    //     url: 'http://localhost:8080/employee/list?id=1'
                    // }];


                    callback(events)
                }
        });
    }

    //调用函数
    init()
</script>
</body>
</html>
