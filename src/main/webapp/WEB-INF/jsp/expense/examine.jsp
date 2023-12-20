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
    <!-- Custom CSS -->
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
                    <h4 class="page-title">报销单详情</h4>
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
                            <form class="form-horizontal" action="${pageContext.request.contextPath}/expense/modifybyexamineid" method="post">
                                <input type="hidden" name="expenseid" value="${expense.expenseid}">
                                <table id="master" class="table">
                                    <thead class="thead-light">
                                    <tr>
                                        <th>填报人</th>
                                        <th>填报日期</th>
                                        <th>事由</th>
                                        <th>总金额</th>
                                        <th>状态</th>
                                        <th>审批人</th>
                                    </tr>
                                    </thead>
                                    <tbody class="customtable">

                                    <tr>
                                        <td>${expense.empname}</td>
                                        <td>${expense.addtime}</td>
                                        <td>${expense.reason}</td>
                                        <td>${expense.total}</td>
                                        <td>已提交</td>
                                        <td>${expense.leadername}</td>
                                    </tr>

                                    </tbody>
                                    <tfoot>
                                    </tfoot>
                                </table>

                                <table id="detail" class="table">
                                    <thead class="thead-light">
                                    <tr>
                                        <th>序号</th>
                                        <th scope="col">费用类别</th>
                                        <th scope="col">费用金额</th>
                                        <th scope="col">费用说明</th>
                                    </tr>
                                    </thead>

                                    <tbody>
                                    <c:forEach items="${expense.list}" var="detail" varStatus="vs">
                                    <tr>
                                        <td>${vs.count}</td>
                                        <td>${detail.extypename}</td>
                                        <td>${detail.money}</td>
                                        <td>${detail.costdesc}</td>
                                    </tr>
                                    </tbody>
                                    </c:forEach>
                                    <tfoot>
                                    <tr>
                                        <td colspan="4">
                                            审批结果:
                                            <c:if test="${expense.sugstate==1}">
                                                <input type="radio" name="sugstate" value="2" checked="checked">批准
                                                <input type="radio" name="sugstate" value="3">拒绝
                                            </c:if>
                                            <c:if test="${expense.sugstate!=1}">
                                                <span style="color: red;font-weight: bold;">${expense.sugstate==2?"同意":"拒绝"}</span>
                                            </c:if>
                                        </td>
                                    </tr>
                                    </tfoot>

                                </table>
                                <div class="border-top">
                                    <label for="cono1" class="col-sm-3 text-left control-label col-form-label">审批意见</label>
                                    <div class="col-sm-12">
                                        <c:if test="${expense.sugstate==1}">
                                        <textarea name="suggestion" id="suggestion" class="form-control" style="height: 100px;">待审批中...</textarea>
                                        </c:if>
                                        <c:if test="${expense.sugstate!=1}">
                                            ${expense.suggestion}
                                        </c:if>
                                    </div>
                                </div>
                                <div class="card-body">
                                <c:if test="${expense.sugstate==1}">
                                    <button type="submit" class="btn btn-success" style="background-color:#8bc7c8">提交</button>
                                    <button type="reset" class="btn btn-success" style="background-color:#609e9b">重置</button>
                                    <a href="javascript:;" onclick="history.go(-1)" class="btn btn-success" style="background-color:#355a6d">返回</a>
                                </c:if>
                                    <c:if test="${expense.sugstate!=1}">

                                        <a href="javascript:;" onclick="history.go(-1)" class="btn btn-success" style="background-color:#355a6d">返回</a>
                                    </c:if>
                                </div>


                            </form>
                            <!-- ============================================================== -->
                            <!-- end Tables Content -->
                            <!-- ============================================================== -->
                        </div>
                    </div>
                </div>
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
<!-- All Jquery -->
<!-- ============================================================== -->
<jsp:include page="../share/resources_js.jsp"></jsp:include>
    </body>
    </html>

