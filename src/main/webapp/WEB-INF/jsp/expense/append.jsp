
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html dir="ltr" lang="en">

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
    <!-- ============================================================== -->
    <jsp:include page="../share/top.jsp"></jsp:include>
    <!-- ============================================================== -->
    <!-- End Topbar header -->
    <!-- ============================================================== -->
    <!-- ============================================================== -->
    <!-- Left Sidebar - style you can find in sidebar.scss  -->
    <!-- ============================================================== -->
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
                    <h4 class="page-title">报销单填写</h4>
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
            <div class="row">
                <div class="col-12">
                    <div class="card">


                        <div class="table-responsive">
                            <!-- ============================================================== -->
                            <!-- end Tables Content -->
                            <!-- ============================================================== -->
                            <form class="form-horizontal" method="post" action="${pageContext.request.contextPath}/expense/append" onsubmit="return formValidate()">
                                <table id="master" class="table">
                                    <thead class="thead-light">
                                    <tr>
                                        <th>填报人</th>
                                        <th>填报时间</th>
                                        <th>总金额</th>
                                        <th>状态</th>
                                        <th>审批人</th>
                                    </tr>
                                    </thead>
                                    <tbody class="customtable" id="tbody">
                                    <tr>
                                        <td>${loginEmp.empname}</td>
                                        <td id="clock">
                                            <input name="addtime" type="text" readonly="readonly" style="border: none" value="${time}">
                                        </td>
                                        <td>
                                            <input name="total" id="total" type="text" readonly="readonly" style="border: none" value="0">
                                        </td>
                                        <td>新创建</td>
                                        <td>
                                            <div class="row">
                                                <select class="form-control col-md-8" id="confirmperson" name="confirmperson">
                                                    <option value="-1">==选择审批人==</option>
                                                    <c:forEach items="${positionList}" var="position">
                                                        <option value="${position.empid}">${position.empname}</option>
                                                    </c:forEach>
                                            </div>
                                        </td>
                                    </tr>

                                    </tbody>
                                    <tfoot>
                                    <tr>
                                        <td colspan="5">
                                            <button type="button" id="addRow"  class="btn btn-danger" style="background-color: #ca6307;border: none">新增一项</button>
                                        </td>
                                    </tr>
                                    </tfoot>
                                </table>

                                <table id="detail" class="table">
                                    <thead class="thead-light">
                                    <tr>
                                        <th>序号</th>
                                        <th scope="col">费用类别</th>
                                        <th scope="col">费用金额</th>
                                        <th scope="col">费用说明</th>
                                        <th scope="col">操作</th>
                                    </tr>
                                    </thead>

                                    <tbody>

                                    </tbody>

                                </table>
                                <div class="border-top">
                                    <label for="cono1" class="col-sm-3 text-left control-label col-form-label">事由</label>
                                    <div class="col-sm-12">
                                        <textarea class="form-control" name="reason" style="height: 100px;" placeholder="输入内容"></textarea>
                                    </div>
                                </div>
                                <!-- 隐藏控件 -->
                                <input type="hidden" id="start" value="1">
                                <div class="card-body">
                                    <button type="submit" class="btn btn-secondary" style="background-color: #609e9b;border: none">保存</button>
                                    <button type="reset" class="btn btn-info" style="background-color: #355a6d;border: none">重置</button>
                                </div>
                            </form>
                            <!-- ============================================================== -->
                            <!-- end Tables Content -->
                            <!-- ============================================================== -->
                        </div>
                    </div>
                </div>
            </div>

            <div class="row" id="op"  style="display: none">

                    <option value="-1">==请选择==</option>
                    <c:forEach items="${listType}" var="type">
                        <option value="${type.extypeid}">${type.extypename}</option>
                    </c:forEach>

            </div>
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
<!-- End Wrapper -->
<!-- ============================================================== -->
<!-- ============================================================== -->
<!-- All Jquery -->
<!-- ============================================================== -->
<jsp:include page="../share/resources_js.jsp"></jsp:include>
<script src="${pageContext.request.contextPath}/resources/js/expense.js"></script>
</body>

</html>