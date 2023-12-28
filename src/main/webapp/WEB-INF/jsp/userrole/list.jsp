
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
                    <h4 class="page-title">员工分配角色</h4>
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
                                <form class="form-inline navbar-form navbar-left" method="get" action="${pageContext.request.contextPath}/role/userrolelist">
                                    <!-- 搜索框 -->
                                    <div class="input-group" style="margin-right: 0.3125rem;">
                                        <input type="text" name="empname" value="${employee.empname}" class="form-control" placeholder="请输入员工姓名查询" >
                                    </div>
                                    <!-- 搜索框 -->
                                    <div class="input-group" style="margin-right: 0.3125rem;">
                                        <input type="text" name="loginname" value="${employee.loginname}" class="form-control" placeholder="输入登录名查询" >
                                    </div>
                                    <!-- 下拉列表搜索 -->
                                    <div class="input-group" style="margin-right: 0.3125rem;">
                                        <select class="form-control" id="departid"  name="departid" >
                                            <option value="-1">==选择部门==</option>
                                            <c:forEach items="${listDepart}" var="depart">
                                                <option value="${depart.departid}">${depart.departname}</option>
                                            </c:forEach>

                                        </select>
                                    </div>
                                    <div class="input-group" style="margin-right: 0.3125rem;">
                                        <select class="form-control"  name="positionid" id="positionid">
                                            <option value="-1">==选择职位==</option>
                                            <c:forEach items="${listPos}" var="pos">
                                                <option value="${pos.positionid}">${pos.positionname}</option>
                                            </c:forEach>

                                        </select>
                                    </div>
                                    <div class="input-group" style="margin-right: 0.3125rem;">
                                        <select class="form-control" id="state"  name="state" >
                                            <option selected="selected" value="-1">==选择状态==</option>
                                            <option value="1">正常</option>
                                            <option value="2">加锁</option>
                                        </select>
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

                                    <th scope="col">编号</th>
                                    <th scope="col">照片</th>
                                    <th scope="col">员工姓名</th>
                                    <th scope="col">入职日期</th>
                                    <th scope="col">个人信息</th>
                                    <th scope="col">职务信息</th>
                                    <th scope="col">操作</th>
                                </tr>
                                </thead>
                                <tbody class="customtable">
                                <c:forEach items="${pages.list}" var="emp" varStatus="vs">
                                <tr>

                                    <td>${(pages.currPage-1)*pages.pageSize+vs.count}</td>
                                    <td>
                                        <img src="${pageContext.request.contextPath}/upload/${emp.picture }" style="width: 110px;height: 110px">

                                    </td>
                                    <td>${emp.empname}</td>
                                    <td>${emp.addtime}</td>
                                    <td>
                                        <div>性别 : ${emp.gender}</div>
                                        <div>生日 : ${emp.birthday}</div>
                                        <div>移动电话 : ${emp.mobile}</div>
                                        <div>家庭电话 : ${emp.familytel}</div>
                                        <div>住址 : ${emp.address}</div>
                                        <div>备注:${emp.remark}</div>
                                    </td>
                                    <td>
                                        <div>登录名 : ${emp.loginname}</div>
                                        <div>密码: :${emp.password}</div>
                                        <div>部门 :${emp.departname}</div>
                                        <div>职位 :${emp.positionname}</div>
                                        <div>办公电话 : ${emp.tel}</div>
                                        <div>状态:${emp.state==1?'正常':'加锁'}</div>
                                    </td>
                                    <td>
                                        <a href="${pageContext.request.contextPath}/role/rolelist?empId=${emp.empid}" class="btn btn-info">分配角色</a>

                                    </td>
                                </tr>
                                </c:forEach>
                                </tbody>
                                <tfoot>
                                <tr>
                                    <td colspan="10">
                                        <div style="float: right;">
                                            <ul class="pagination">
                                                <li class="page-item active"><a class="page-link" href="#">当前页/总页数: ${pages.currPage}/${pages.total}</a></li>
                                                <li class="page-item"><a class="page-link" href="${pageContext.request.contextPath}/role/userrolelist?currPage=${pages.first}&empname=${employee.empname}&loginname=${employee.loginname}&departid=${employee.departid}&state=${employee.state}&positionid=${employee.positionid}">首页</a></li>
                                                <li class="page-item"><a class="page-link" href="${pageContext.request.contextPath}/role/userrolelist?currPage=${pages.pre}&empname=${employee.empname}&loginname=${employee.loginname}&departid=${employee.departid}&state=${employee.state}&positionid=${employee.positionid}">上一页</a></li>
                                                <li class="page-item"><a class="page-link" href="${pageContext.request.contextPath}/role/userrolelist?currPage=${pages.next}&empname=${employee.empname}&loginname=${employee.loginname}&departid=${employee.departid}&state=${employee.state}&positionid=${employee.positionid}">下一页</a></li>
                                                <li class="page-item"><a class="page-link" href="${pageContext.request.contextPath}/role/userrolelist?currPage=${pages.last}&empname=${employee.empname}&loginname=${employee.loginname}&departid=${employee.departid}&state=${employee.state}&positionid=${employee.positionid}">末页</a></li>
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
    <script>
        //id=departid默认选中
        $("#departid").val('${employee.departid}')
        //id=state默认选中
        $("#state").val('${employee.state}')

       // $("#positionid").val('${employee.positionid}')



    </script>
    </body>
    </html>
