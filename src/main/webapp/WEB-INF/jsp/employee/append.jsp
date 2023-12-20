
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
    <style type="text/css">
        .msg{color:red;font-weight: bold;font-size: 16px}
    </style>
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
                    <h4 class="page-title">员工管理 - 添加</h4>
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
                        <form class="form-horizontal" method="post" action="${pageContext.request.contextPath}/employee/append" enctype="multipart/form-data" onsubmit="return formValidate()">
                            <div class="card-body">
                                <!-- <h4 class="card-title">员工信息</h4> -->
                                <div class="form-group row">
                                    <label for="loginName" class="col-sm-3 text-right control-label col-form-label">登录名</label>
                                    <div class="col-sm-3">
                                        <input type="text" name="loginname"  id="loginname"  class="form-control" placeholder="loginName Here">
                                    </div>

                                    <label id="loginname_msg" class="msg"></label>
                                </div>
                                <div class="form-group row">
                                    <label for="password" class="col-sm-3 text-right control-label col-form-label">密码</label>
                                    <div class="col-sm-4">
                                        <input type="text" name="password" id="password1" class="form-control" placeholder="password Here">
                                    </div>
                                </div>
                                <div class="form-group row">
                                    <label for="password" class="col-sm-3 text-right control-label col-form-label">确认密码</label>
                                    <div class="col-sm-4">
                                        <input type="text" name="password2" id="password2" class="form-control" placeholder="password Here">
                                    </div>
                                </div>
                                <div class="form-group row">
                                    <label for="empName" class="col-sm-3 text-right control-label col-form-label">姓名</label>
                                    <div class="col-sm-4">
                                        <input type="text" name="empname" id="empname" class="form-control" placeholder="empName Here">
                                    </div>
                                </div>
                                <div class="form-group row">
                                    <label for="gender" class="col-sm-3 text-right control-label col-form-label">性别</label>
                                    <div class="col-sm-4">
                                        <input type="radio" checked name="gender" value="女" style="margin-top: 12px" >女
                                        <input type="radio" name="gender" value="男" >男
                                    </div>
                                </div>
                                <div class="form-group row">
                                    <label for="position" class="col-sm-3 text-right control-label col-form-label">职位</label>
                                    <div class="col-sm-4">
                                        <select name="positionid" class="form-control" id="positionid">
                                            <option value="-1">请选择</option>
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
                                            <option selected="selected" value="-1">请选择</option>
                                            <c:forEach items="${listDepart }" var="depart">
                                                <option value="${depart.departid }">${depart.departname }</option>
                                            </c:forEach>
                                        </select>
                                    </div>
                                </div>
                                <div class="form-group row">
                                    <label for="hireDate" class="col-sm-3 text-right control-label col-form-label">入职日期</label>
                                    <div class="col-sm-4">
                                        <input type="date" name="hiredate" id="hiredate" class="form-control" placeholder="hireDate Here">
                                    </div>
                                </div>
                                <div class="form-group row">
                                    <label for="birthday" class="col-sm-3 text-right control-label col-form-label">生日</label>
                                    <div class="col-sm-4">
                                        <input type="date" name="birthday" id="birthday" class="form-control" placeholder="birthday Here">
                                    </div>
                                </div>
                                <div class="form-group row">
                                    <label for="address" class="col-sm-3 text-right control-label col-form-label">地址</label>
                                    <div class="col-sm-4">
                                        <input type="text" name="address" id="address" class="form-control" placeholder="address Here">
                                    </div>
                                </div>
                                <div class="form-group row">
                                    <label for="mobile" class="col-sm-3 text-right control-label col-form-label">移动电话</label>
                                    <div class="col-sm-4">
                                        <input type="text" name="mobile" id="mobile" class="form-control" placeholder="mobile Here">
                                    </div>
                                </div>
                                <div class="form-group row">
                                    <label for="tel" class="col-sm-3 text-right control-label col-form-label">办公电话</label>
                                    <div class="col-sm-4">
                                        <input type="text" name="tel" id="tel" class="form-control" placeholder="tel Here">
                                    </div>
                                </div>
                                <div class="form-group row">
                                    <label for="familyTel" class="col-sm-3 text-right control-label col-form-label">家庭电话</label>
                                    <div class="col-sm-4">
                                        <input type="text" name="familytel" id="familytel" class="form-control" placeholder="familyTel Here">
                                    </div>
                                </div>
                                <div class="form-group row">
                                    <label for="remark" class="col-sm-3 text-right control-label col-form-label">备注</label>
                                    <div class="col-sm-4">
                                        <input type="text" name="remark" id="remark" class="form-control" placeholder="remark Here">
                                    </div>
                                </div>
                                <div class="form-group row">
                                    <label for="position" class="col-sm-3 text-right control-label col-form-label">状态</label>
                                    <div class="col-sm-4">
                                        <select  name="state" id="state" class="form-control">
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
                                            <input type="file" name="file" class="custom-file-input" id="validatedCustomFile">
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
    //表单验证:
    //提交按钮会触发onsubmit事件
    //onsubmit="return 验证的函数()" 函数返回假,表单不提交


    //$("选择器").事件名(function(){})
    //注册事件
    $("#loginname").focus(function (){
        $("#loginname_msg").text('')
    })
    function  formValidate()
    {
        if($("#loginname").val()=='')
        {
           // alert('登录名称不能为空')
            $("#loginname_msg").text('登录名称不能为空')
            return false
        }
        if(!$("#loginname").val().match(USERNAME_REGEXP))
        {
            //alert('姓名不合法')
            $("#loginname_msg").text('姓名不合法')
            return  false
        }

        if($("#password1").val()=='')
        {
            alert('密码不能为空')
            //获取焦点
            $('#password1').focus()
            return  false
        }
        if(!$("#password1").val().match(PASSWORD_REGEXP))
        {
            alert('密码不合法')
            $('#password1').focus()
            return  false
        }

        if($("#password1").val()!=$("#password2").val())
        {
            $('#password1').focus()
            alert('2次输入的密码不相同!')
            return  false
        }



        if($("#positionid").val()==-1)
        {
            alert('请选择职位!')
            $("#positionid").focus()
            return  false

        }

        if($("#departid").val()==-1)
        {
            alert('请选择部门!')
            $("#departid").focus()
            return  false

        }
    }
</script>
</body>

</html>