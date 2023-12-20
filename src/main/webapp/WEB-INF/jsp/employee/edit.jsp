
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
                    <h4 class="page-title">员工管理 - 修改</h4>
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
                        <form class="form-horizontal" method="post" action="${pageContext.request.contextPath}/employee/modifybyid" enctype="multipart/form-data">
                           <input type="hidden" name="empid" value="${employee.empid}">
                            <div class="card-body">
                                <!-- <h4 class="card-title">员工信息</h4> -->
                                <div class="form-group row">
                                    <label for="loginName" class="col-sm-3 text-right control-label col-form-label">登录名</label>
                                    <div class="col-sm-4">
                                        <input type="text" required name="loginname" value="${employee.loginname}"  class="form-control" placeholder="loginName Here">
                                    </div>
                                </div>
                                <div class="form-group row">
                                    <label for="password" class="col-sm-3 text-right control-label col-form-label">密码</label>
                                    <div class="col-sm-4">
                                        <input type="text" name="password" value="${employee.password}"  class="form-control" placeholder="password Here">
                                    </div>
                                </div>
                                <div class="form-group row">
                                    <label for="empName" class="col-sm-3 text-right control-label col-form-label">姓名</label>
                                    <div class="col-sm-4">
                                        <input type="text" name="empname" value="${employee.empname}"  class="form-control" placeholder="empName Here">
                                    </div>
                                </div>
                                <div class="form-group row">
                                    <label for="gender" class="col-sm-3 text-right control-label col-form-label">性别</label>
                                    <div class="col-sm-4">
                                        <input type="radio" id="woman"  name="gender" value="女" style="margin-top: 12px" >女
                                        <input type="radio"  id="man" name="gender" value="男" >男
                                    </div>
                                </div>
                                <div class="form-group row">
                                    <label for="position" class="col-sm-3 text-right control-label col-form-label">职位</label>
                                    <div class="col-sm-4">
                                        <select id="positionid" name="positionid" class="form-control">
                                            <option>请选择</option>
                                            <c:forEach items="${listPos}" var="pos">
                                                <option value="${pos.positionid}">${pos.positionname}</option>
                                            </c:forEach>
                                        </select>
                                        <!--                                             <input type="text" name="position" class="form-control" placeholder="position Here"> -->
                                    </div>
                                </div>
                                <div class="form-group row">
                                    <label for="departName" class="col-sm-3 text-right control-label col-form-label">所属部门</label>
                                    <div class="col-sm-4" >
                                        <select class="form-control" name="departid" id="departid">
                                            <option selected="selected">请选择</option>
                                            <c:forEach items="${listDepart }" var="depart">
                                                <option value="${depart.departid }">${depart.departname }</option>
                                            </c:forEach>
                                        </select>
                                    </div>
                                </div>
                                <div class="form-group row">
                                    <label for="hireDate" class="col-sm-3 text-right control-label col-form-label">入职日期</label>
                                    <div class="col-sm-4">
                                        <input type="date" id="hiredate" value="${employee.hiredate}"  name="hiredate" class="form-control" placeholder="hireDate Here">
                                    </div>
                                </div>
                                <div class="form-group row">
                                    <label for="birthday" class="col-sm-3 text-right control-label col-form-label">生日</label>
                                    <div class="col-sm-4">
                                        <input type="date" id="birthday" name="birthday" value="${employee.birthday}"  class="form-control" placeholder="birthday Here">
                                    </div>
                                </div>
                                <div class="form-group row">
                                    <label for="address" class="col-sm-3 text-right control-label col-form-label">地址</label>
                                    <div class="col-sm-4">
                                        <input type="text" name="address" value="${employee.address}"  class="form-control" placeholder="address Here">
                                    </div>
                                </div>
                                <div class="form-group row">
                                    <label for="mobile" class="col-sm-3 text-right control-label col-form-label">移动电话</label>
                                    <div class="col-sm-4">
                                        <input type="text" name="mobile" value="${employee.mobile}"  class="form-control" placeholder="mobile Here">
                                    </div>
                                </div>
                                <div class="form-group row">
                                    <label for="tel" class="col-sm-3 text-right control-label col-form-label">办公电话</label>
                                    <div class="col-sm-4">
                                        <input type="text" name="tel" value="${employee.tel}"  class="form-control" placeholder="tel Here">
                                    </div>
                                </div>
                                <div class="form-group row">
                                    <label for="familyTel" class="col-sm-3 text-right control-label col-form-label">家庭电话</label>
                                    <div class="col-sm-4">
                                        <input type="text" name="familytel" value="${employee.familytel}"  class="form-control" placeholder="familyTel Here">
                                    </div>
                                </div>
                                <div class="form-group row">
                                    <label for="remark" class="col-sm-3 text-right control-label col-form-label">备注</label>
                                    <div class="col-sm-4">
                                        <input type="text" name="remark" value="${employee.remark}"  class="form-control" placeholder="remark Here">
                                    </div>
                                </div>

                                <div class="form-group row">
                                    <label for="position" class="col-sm-3 text-right control-label col-form-label">状态</label>
                                    <div class="col-sm-4">
                                        <select id="mstate" name="state" class="form-control">
                                            <option value="-1">请选择</option>
                                            <option value="1">正常</option>
                                            <option value="2">加锁</option>
                                        </select>
                                        <!--                                             <input type="text" name="position" class="form-control" placeholder="position Here"> -->
                                    </div>
                                </div>


                                <div class="form-group row">
                                    <label class="col-sm-3 text-right control-label col-form-label">上传照片</label>
                                    <div class="col-sm-4">
                                        <div class="custom-file">
                                            <input type="file" name="file"  class="custom-file-input" id="validatedCustomFile">
                                            <label id="filename_label" class="custom-file-label" for="validatedCustomFile">选择照片</label>
                                            <div class="invalid-feedback">Example invalid custom file feedback</div>
                                        </div>
                                    </div>
                                </div>
                                <div class="border-top">
                                    <div class="card-body">
                                        <button type="submit" class="btn btn-success">保存</button>
                                        <button type="reset" class="btn btn-primary">重置</button>
                                        <a href="javascript:;" onclick="history.go(-1)" class="btn btn-danger" >返回</a>
<%--                                        <a href="javascript:void(0)" onclick="history.go(-1)" class="btn btn-danger" >返回</a>--%>
<%--                                        <a href="javascript:history.go(-1)" class="btn btn-danger" >返回2</a>--%>
                                    </div>
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
<!-- End Wrapper -->
<!-- ============================================================== -->
<!-- ============================================================== -->
<!-- All Jquery -->
<jsp:include page="../share/resources_js.jsp"></jsp:include>
<script>
    //下列表的默义选中
    $("#positionid").val('${employee.positionid}')
    $("#departid").val('${employee.departid}')

    $("#mstate").val('${employee.state}')
    //单选按钮默认选中
    if('${employee.gender}=="男"')
    {
        $("#man").prop("checked",true)
    }
    else
    {
        $("#woman").prop("checked",true)
    }


</script>
</body>

</html>