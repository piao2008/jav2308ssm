
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
                    <h4 class="page-title">我的报销</h4>
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
                        <div class="card-body">
                            <!-- <h5 class="card-title m-b-0">Static Table With Checkboxes</h5> -->
                            <!-- ==============================================================-->
                            <!-- Start Search Content -->
                            <!-- ==============================================================-->
                            <div    class="form-row"  style="margin: 0.3125rem 0;">
                                <form class="form-inline navbar-form navbar-left" method="post" action="${pageContext.request.contextPath}/expense/list">
                                    <!-- 搜索框 -->
                                    <div class="input-group" style="margin-right: 0.3125rem;">
                                        <select class="form-control" name="state"  id="state">
                                            <option value="-1">==选择报销状态==</option>
                                            <option value="1">未提交</option>
                                            <option value="2">已提交</option>

                                        </select>
                                    </div>
                                    <div class="input-group" style="margin-right: 0.3125rem;">
                                        <select class="form-control" name="sugstate" id="sugstate" >
                                            <option value="-1">==选择审批结果==</option>
                                            <option value="1">待审批</option>
                                            <option value="2">批准</option>
                                            <option value="3">拒绝</option>
                                        </select>
                                    </div>
                                    &nbsp;&nbsp;&nbsp;&nbsp;
                                    <div class="input-group" style="margin-right: 0.3125rem;">
                                        <span style="margin-top: 10px">填报时间 :</span>&nbsp;
                                        <input type="date" name="begintime" value="${expense.begintime}" class="form-control">
                                    </div>
                                    <div class="input-group" style="margin-right: 0.3125rem;">
                                        <span style="margin-top: 10px"> 至 </span>&nbsp;
                                        <input type="date" name="endtime" value="${expense.endtime}" class="form-control">
                                    </div>
                                    <div class="input-group" style="margin-right: 0.3125rem;">
                                        <input type="text" name="reason" value="${expense.reason}" class="form-control" placeholder="请输入事由查询" >
                                    </div>
                                    <!-- 按钮和超链接 -->
                                    <div class="input-group" style="margin-right: 0.3125rem;">
								   	<span class="input-group-btn">
										<button type="submit" class="btn  btn-success">查询</button>
									</span>

                                    </div>
                                </form>
                            </div>
                            <!-- ==============================================================-->
                            <!-- end Search Content -->
                            <!-- ==============================================================-->

                        </div>

                        <div class="table-responsive">
                            <!-- ============================================================== -->
                            <!-- end Tables Content -->
                            <!-- ============================================================== -->
                            <table id="zero_config" class="table  table-bordered table-hover">
                                <thead class="thead-light">
                                <tr style="text-align: center;">
                                    <th scope="col">编号</th>
                                    <th scope="col">报销信息</th>
                                    <th scope="col">审批信息</th>
                                    <th scope="col">单据状态</th>
                                    <th scope="col">操作</th>
                                </tr>
                                </thead>
                                <tbody class="customtable">
                                <c:forEach items="${pages.list}" var="expense" varStatus="vs">
                                <tr>
                                    <td>${(pages.currPage-1)*pages.pageSize+vs.count}</td>
                                    <td>
                                        <div>报销事由 : ${expense.reason}</div>
                                        <div>填报时间 : ${expense.addtime}</div>
                                        <div>金额 : ${expense.total}</div>
                                    </td>
                                    <td>
                                        <div>审批人 : ${expense.leadername}</div>
                                        <div class="divSugtime">
                                            审批时间 :${expense.sugtime}
                                            <div>
                                                审批意见:${expense.suggestion}
                                            </div>
                                            <div>

<%--                                                审批结果 1-待审批 2-同意 3-不同意(拒绝)'--%>
                                                审批状态 :${expense.sugstate==1?'待审批':(expense.sugstate==2?'同意':'拒绝')}
                                            </div>
                                    </td>
                                    <td>
<%--                                        state int default 1 comment '状态 1-新建 2-已提交--%>
                                        ${expense.state==1?'新建':'提交'}
                                    </td>
                                    <td>
													<span class="input-group-btn" style="display:block;margin-top: 25px">
                                                        <c:if test="${expense.state==1}">

                                                            <a href="javascript:;" class="btn btn-success" style="margin-left: 6px;background-color:#8bc7c8;border: none" onclick="updateState(${expense.expenseid})">提交</a>
                                                            <a href="javascript:;" name="deleteRow" delete_url="${pageContext.request.contextPath}/expense/removebyid?expenseId=" class="btn btn-success"  key="${expense.expenseid}"  style="margin-left: 6px;background-color:#355a6d;border: none">删除</a>
                                                        </c:if>

													<a href="${pageContext.request.contextPath}/expense/detail?expenseId=${expense.expenseid}"  class="btn btn-success"  style="margin-left: 6px;background-color:#609e9b;border: none">查看详情</a>

												</span>
                                    </td>
                                </tr>
                                </c:forEach>
                                </tbody>
                                <tfoot>
                                <tr>
                                    <td colspan="7">
                                        <div style="float: right;">
                                            <ul class="pagination">
                                                <li class="page-item active"><a class="page-link" href="#">当前页/总页数: ${pages.currPage}/${pages.total}</a></li>
                                                <li class="page-item"><a class="page-link" href="${pageContext.request.contextPath}/expense/list?currPage=${pages.first}&state=${expense.state}&sugstate=${expense.sugstate}&begintime=${expense.begintime}&endtime=${expense.endtime}&reason=${expense.reason}">首页</a></li>
                                                <li class="page-item"><a class="page-link" href="${pageContext.request.contextPath}/expense/list?currPage=${pages.pre}&state=${expense.state}&sugstate=${expense.sugstate}&begintime=${expense.begintime}&endtime=${expense.endtime}&reason=${expense.reason}">上一页</a></li>
                                                <li class="page-item"><a class="page-link" href="${pageContext.request.contextPath}/expense/list?currPage=${pages.next}&state=${expense.state}&sugstate=${expense.sugstate}&begintime=${expense.begintime}&endtime=${expense.endtime}&reason=${expense.reason}">下一页</a></li>
                                                <li class="page-item"><a class="page-link" href="${pageContext.request.contextPath}/expense/list?currPage=${pages.last}&state=${expense.state}&sugstate=${expense.sugstate}&begintime=${expense.begintime}&endtime=${expense.endtime}&reason=${expense.reason}">末页</a></li>
                                            </ul>
                                        </div>
                                    </td>
                                </tr>
                                </tfoot>
                            </table>

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
    <jsp:include page="../share/resources_js.jsp"></jsp:include>

    <script>
        //提交
        function  updateState(id)
        {
            if(confirm("真的确定提交?"))
            {
                location.href='${pageContext.request.contextPath}/expense/updatestate?expenseId='+id

            }
        }

        //下拉列表默认选中
        $('#state').val('${expense.state}')
        $('#sugstate').val('${expense.sugstate}')
    </script>
    </body>
    </html>
