<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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
                    <h4 class="page-title">日程管理 - 修改</h4>
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
            <!-- Start Page Content -->
            <!-- ============================================================== -->
            <div class="row">
                <div class="col-md-12">
                    <div class="card">
                        <form class="form-horizontal" method="post" action="${pageContext.request.contextPath}/schedule/append">

                            <div class="card-body">
                                <!-- <h4 class="card-title">日程表信息</h4> -->
                                <div class="form-group row">
                                    <label for="addressparentid" class="col-sm-3 text-right control-label col-form-label">日程标题</label>
                                    <div class="col-sm-4">
                                        <input type="text" class="form-control" name="title" value="${schedule.title}" placeholder="输入日程标题">
                                    </div>
                                </div>
                                <div class="form-group row">
                                    <label for="addresstitle" class="col-sm-3 text-right control-label col-form-label">开始时间</label>
                                    <div class="col-sm-4">
                                        <input type="date" class="form-control" value="${schedule.begintime}" name="begintime"  placeholder="输入开始时间">
                                    </div>
                                </div>
                                <div class="form-group row">
                                    <label for="addresstitle" class="col-sm-3 text-right control-label col-form-label">结束时间</label>
                                    <div class="col-sm-4">
                                        <input type="date" class="form-control" value="${schedule.endtime}" name="endtime"  placeholder="输入结束时间">
                                    </div>
                                </div>
                                <div class="form-group row">
                                    <label for="addressparentid" class="col-sm-3 text-right control-label col-form-label">日程内容</label>
                                    <div class="col-sm-4">
                                        <input type="text" class="form-control" value="${schedule.content}" name="content" placeholder="输入日程内容">
                                    </div>
                                </div>
                                <div class="form-group row">
                                    <label for="addresstitle" class="col-sm-3 text-right control-label col-form-label">联系人</label>
                                    <div class="col-sm-4">
                                        <input type="text" class="form-control" value="${schedule.concatname}"  name="concatname"  placeholder="输入联系人">
                                    </div>
                                </div>
                                <div class="form-group row">
                                    <label for="addresstitle" class="col-sm-3 text-right control-label col-form-label">地址</label>
                                    <div class="col-sm-4">
                                        <input type="text" class="form-control"  value="${schedule.address}"  name="address"  placeholder="输入地址">
                                    </div>
                                </div>
                                <div class="form-group row">
                                    <label for="addresstitle" class="col-sm-3 text-right control-label col-form-label">联系电话</label>
                                    <div class="col-sm-4">
                                        <input type="text" class="form-control" value="${schedule.tel}"  name="tel"  placeholder="输入联系电话">
                                    </div>
                                </div>
                                <!-- 单选按钮-->
                                <div class="form-group row">
                                    <label for="addresstitle" class="col-sm-3 text-right control-label col-form-label">是否公开</label>
                                    <div class="col-sm-4"  style="margin-top: 10px">
                                        <input type="radio"  id="ifprivate1"  checked name="ifprivate" value="1">私有
                                        <input type="radio"  id="ifprivate2" name="ifprivate" value="2">公开
                                    </div>
                                </div>
                                <!-- 多选按钮-->
                                <div class="form-group row">
                                    <label for="addresstitle" class="col-sm-3 text-right control-label col-form-label">日程状态</label>
                                    <div class="col-sm-4"  style="margin-top: 10px">
                                        <input type="radio" id="state1" checked name="state" value="1">未完成
                                        <input type="radio" id="state2" name="state" value="2">完成
                                        <input type="radio" id="state3" name="state" value="3">进行中
                                    </div>
                                </div>
                                <!-- 文本域 -->
                                <div class="form-group row">
                                    <label for="addresstitle" class="col-sm-3 text-right control-label col-form-label">备注</label>
                                    <div class="col-sm-6 h-100">
                                        <textarea  class="form-control" name="demo"  placeholder="输入内容">${schedule.demo} </textarea>
                                    </div>
                                </div>
                            </div>
                            <div class="border-top">
                                <div class="card-body">

                                    <button type="submit" class="btn btn-success">保存</button>
                                    <button type="reset" class="btn btn-primary">重置</button>

                                    <a href="javascript:;" onclick="history.go(-1)" class="btn btn-danger">返回</a>


                                </div>
                            </div>
                        </form>
                    </div>
                </div>

            </div>
            <!-- ============================================================== -->
            <!-- End PAge Content -->
            <!-- ============================================================== -->
            <!-- ============================================================== -->
            <!-- Right sidebar -->
            <!-- ============================================================== -->
            <!-- .right-sidebar -->
            <!-- ============================================================== -->
            <!-- End Right sidebar -->
            <!-- ============================================================== -->
        </div>
        <!-- ============================================================== -->
        <!-- End Container fluid  -->
        <!-- ============================================================== -->
        <!-- ============================================================== -->
        <!-- footer -->
        <!-- ============================================================== -->
        <jsp:include page="../share/footer.jsp"></jsp:include>
        <!-- ============================================================== -->
        <!-- End footer -->
        <!-- ============================================================== -->
    </div>
    <!-- ============================================================== -->
    <!-- End Page wrapper  -->
    <!-- ============================================================== -->
</div>
<!-- ============================================================== -->
<jsp:include page="../share/resources_js.jsp"></jsp:include>


</body>
</html>
