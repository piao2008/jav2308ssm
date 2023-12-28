
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
                    <h4 class="page-title">用户分配角色</h4>
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
            <!-- Sales Cards  -->
            <!-- ============================================================== -->



            <!-- ============================================================== -->
            <!-- Sales chart -->
            <!-- ============================================================== -->
            <!-- ============================================================== -->
            <!-- Recent comment and chats -->
            <!-- ============================================================== -->
            <div class="row">
                <!-- column -->
                <div class="col-lg-12">
                    <div class="card">

                        <div class="card-body">
                            <div class="col-sm-3 form-inline">
                                <div class="custom-control custom-checkbox mr-sm-2" style="font-size: 18px">
                                    <input type="checkbox" class="custom-control-input" id="roleAllCheck" name="allCheck">
                                    <label class="custom-control-label text-danger" for="roleAllCheck">-全选/全不选-</label>
                                </div>
                            </div>
                        </div>

                        <!--    begin     -->


                        <div class="form-group row  border-bottom">
                            <c:forEach items="${rolelist}" var="role">
                                <div class="col-sm-3 form-inline">
                                    <div class="custom-control custom-checkbox mr-sm-2" style="margin-left: 30px;">
                                        <input type="checkbox" value="${role.roleid}" class="custom-control-input" name="c"  id="c${role.roleid}">
                                        <label class="custom-control-label text-danger" for="c${role.roleid}">${role.rolename}/${role.roleid}</label>
                                    </div>
                                </div>
                            </c:forEach>

                        </div>

                        <!--   end    -->

                        <div class="comment-footer">
                            <button type="button" id="save" class="btn btn-success btn-sm">保存</button>
                            <button type="button" id="reset" class="btn btn-primary btn-sm">重置</button>
                            <a href="javascript:;" onclick="history.go(-1)" class="btn btn-danger btn-sm" >返回</a>
                        </div>

                    </div>
                </div>
            </div>
            <!-- ============================================================== -->
            <!-- Recent comment and chats -->
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
    <input type="hidden" id="empid" value="${empId}">
</div>
<!-- ============================================================== -->
<jsp:include page="../share/resources_js.jsp"></jsp:include>

<script>
    //id=roleAllCheck注册事件
    $("#roleAllCheck").change(function (){
        $("input[name=c]").prop("checked",$(this).prop("checked"))
    })

    //id=save注册事件
    $("#save").click(function (){
        let roleIds=[]
        $("input[name=c]:checked").each(function (index,obj){
            roleIds.push($(this).val())
        })
        location.href='${pageContext.request.contextPath}/role/save?roleIds='+roleIds+"&empId="+$("#empid").val()

    })
    //实现默认选中
    let url='${pageContext.request.contextPath}/role/getbyempid?empId='+$("#empid").val()
    $.get(url,function (data){

        $.each(data,function (i,o){

            $("input[name=c]").each(function (index,obj){
                    if($(this).val()==o.roleid)
                    {
                        $(this).prop("checked",true)
                    }
            })
        })

    },"json")
</script>
    </body>
    </html>
