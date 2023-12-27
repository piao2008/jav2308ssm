
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
          <h4 class="page-title">角色权限分配</h4>
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
                <form class="form-inline navbar-form navbar-left" method="post" action="newstype/list">
                  <!-- 搜索框 -->
                  <div class="input-group" style="margin-right: 0.3125rem;">
                    <input type="text" name="newsName" value="" class="form-control" placeholder="请输入角色名称" >
                  </div>
                  <div class="input-group" style="margin-right: 0.3125rem;">
                    <input type="text" name="newsDesc" value="" class="form-control" placeholder="请输入角色描述" >
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
                <tr>
                  <th>
                    <label class="customcheckbox m-b-20">
                      <input type="checkbox" id="mainCheckbox" />
                      <span class="checkmark"></span>
                    </label>
                  </th>
                  <th scope="col">编号</th>
                  <th scope="col">添加时间</th>
                  <th scope="col">角色名称</th>
                  <th scope="col">角色描述</th>
                  <th scope="col">操作</th>
                </tr>
                </thead>
                <tbody class="customtable">
                <c:forEach items="${list}" var="role" varStatus="vs">
                <tr>
                  <th>
                    <label class="customcheckbox">
                      <input type="checkbox" class="listCheckbox" value=""/>
                      <span class="checkmark"></span>
                    </label>
                  </th>
                  <td>${vs.count}</td>
                  <td>${role.addtime}</td>
                  <td>${role.rolename}</td>
                  <td>${role.roledesc}</td>
                  <td>
                    <a href="${pageContext.request.contextPath}/role/showpower?roleid=${role.roleid}" class="btn btn-primary">分配权限</a>

                  </td>
                </tr>
                </c:forEach>
                </tbody>
                <tfoot>
                <tr>
                  <td colspan="7">
                    <div style="float: right;">
                      <ul class="pagination">
                        <li class="page-item active"><a class="page-link" href="#">当前页/总页数: 1/20</a></li>
                        <li class="page-item"><a class="page-link" href="">首页</a></li>
                        <li class="page-item"><a class="page-link" href="">上一页</a></li>
                        <li class="page-item"><a class="page-link" href="">下一页</a></li>
                        <li class="page-item"><a class="page-link" href="">末页</a></li>
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
<!-- ============================================================== -->
<jsp:include page="../share/resources_js.jsp"></jsp:include>
  </body>
  </html>
