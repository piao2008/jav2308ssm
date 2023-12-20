
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
          <h4 class="page-title">报销审批</h4>
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
                <form class="form-inline navbar-form navbar-left" method="post" action="${pageContext.request.contextPath}/expense/myconfirm">
                  <!-- 搜索框 -->
                  <div class="input-group" style="margin-right: 0.3125rem;">
                    <select class="form-control" name="sugstate"  id="sugstate">
                      <option value="-1">==选择审批结果==</option>
                      <option value="1">待审批</option>
                      <option value="2">批准</option>
                      <option value="3">不批准</option>
                    </select>
                  </div>
                  &nbsp;&nbsp;&nbsp;&nbsp;
                  <div class="input-group" style="margin-right: 0.3125rem;">
                    <span style="margin-top: 10px">审批时间 :</span>&nbsp;
                    <input type="date" name="beginsugtime" value="${expense.beginsugtime}" class="form-control">
                  </div>
                  <div class="input-group" style="margin-right: 0.3125rem;">
                    <span style="margin-top: 10px"> 至 </span>&nbsp;
                    <input type="date" name="endsugtime" value="${expense.endsugtime}" class="form-control">
                  </div>
                  <div class="input-group" style="margin-right: 0.3125rem;">
                    <input type="text" name="reason" value="${expense.reason}" class="form-control" placeholder="请输入事由查询" >
                  </div>
                  <!-- 按钮和超链接 -->
                  <div class="input-group" style="margin-right: 0.3125rem;">
								   	<span class="input-group-btn">
										<button type="submit" class="btn  btn-success">查询</button>
									</span>
                    <span class="input-group-btn">
										<a href="expense/myconfirm?Sugstate=0" class="btn btn-primary" style="margin-left: 5px;">查询所有</a>
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
                  <th scope="col">填报时间</th>
                  <th scope="col">报销事由 </th>
                  <th scope="col">金额</th>
                  <th scope="col">填报人</th>
                  <th scope="col">审批结果</th>
                  <th scope="col">操作</th>
                </tr>
                </thead>
                <tbody class="customtable">
                <c:forEach items="${pages.list}" var="expense" varStatus="vs">
                <tr>
                  <td>${(pages.currPage-1)*pages.pageSize+vs.count}</td>
                  <td>${expense.addtime}</td>
                  <td>${expense.reason}</td>
                  <td>${expense.total}</td>
                  <td>${expense.departname}-${expense.positionname}-${expense.leadername}</td>
<%--                  1-待审批 2-同意 3-不同意(拒绝)'--%>
                  <td>${expense.sugstate==1?'待审批':(expense.sugstate==2?'同意':'拒绝')}</td>
                  <td>
                    <c:if test="${expense.sugstate==1}">
                      <a href="${pageContext.request.contextPath}/expense/getbyexamineid?expenseId=${expense.expenseid}"  class="btn btn-success">待审批</a>
                    </c:if>

                    <c:if test="${expense.sugstate!=1}">
                      <a href="${pageContext.request.contextPath}/expense/getbyexamineid?expenseId=${expense.expenseid}"  class="btn btn-info">查看详情</a>

                    </c:if>

                  </td>
                </tr>
                </c:forEach>
                </tbody>
                <tfoot>
                <tr>
                  <td colspan="8">
                    <div style="float: right;">
                      <ul class="pagination">
                        <li class="page-item active"><a class="page-link" href="#">当前页/总页数: ${pages.currPage}/${pages.total}</a></li>
                        <li class="page-item"><a class="page-link" href="${pageContext.request.contextPath}/expense/myconfirm?currPage=${pages.first}">首页</a></li>
                        <li class="page-item"><a class="page-link" href="${pageContext.request.contextPath}/expense/myconfirm?currPage=${pages.pre}">上一页</a></li>
                        <li class="page-item"><a class="page-link" href="${pageContext.request.contextPath}/expense/myconfirm?currPage=${pages.next}">下一页</a></li>
                        <li class="page-item"><a class="page-link" href="${pageContext.request.contextPath}/expense/myconfirm?currPage=${pages.last}">末页</a></li>
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
<jsp:include page="../share/resources_js.jsp"></jsp:include>
<script>
  $("#sugstate").val('${expense.sugstate}')
</script>
  </body>
  </html>
