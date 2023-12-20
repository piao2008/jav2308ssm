
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
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
  <!-- Custom CSS -->
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
          <h4 class="page-title">部门管理 - 修改</h4>
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
            <form class="form-horizontal" method="post" action="${pageContext.request.contextPath}/departinfo/modifybyid">
             <input type="hidden" name="departid" value="${departInfo.departid}">
              <div class="card-body">
                <!-- <h4 class="card-title">部门信息表信息</h4> -->
                <div class="form-group row">
                  <label for="departName" class="col-sm-3 text-right control-label col-form-label">部门名字</label>
                  <div class="col-sm-4">
                    <input type="text" class="form-control" value="${departInfo.departname}" name="departname" placeholder="DepartName Here">
                  </div>
                  <label for="departName" id="uname_msg" class="col-sm-3 text-left control-label col-form-label" style="color: red;"></label>
                </div>
                <div class="form-group row">
                  <label for="departEmail" class="col-sm-3 text-right control-label col-form-label">部门邮箱</label>
                  <div class="col-sm-4">
                    <input type="text" class="form-control" value="${departInfo.departemail}" name="departemail"  placeholder="DepartEmail Here">
                  </div>
                </div>
                <div class="form-group row">
                  <label for="DepartTel" class="col-sm-3 text-right control-label col-form-label">部门电话</label>
                  <div class="col-sm-4">
                    <input type="text" class="form-control" value="${departInfo.departtel}" name="departtel"  placeholder="DepartTel Here">
                  </div>
                </div>
                <div class="form-group row">
                  <label for="departDesc" class="col-sm-3 text-right control-label col-form-label">部门描述</label>
                  <div class="col-sm-4">
                    <input type="text" class="form-control" name="departdesc" value="${departInfo.departdesc}"  placeholder="DepartDesc Here">
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
    <footer class="footer text-center">
      All Rights Reserved by 版权所有&copy;2021-2050
    </footer>
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
<jsp:include page="../share/resources_js.jsp"></jsp:include>
</body>

</html>