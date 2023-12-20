
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
                    <h4 class="page-title">权限分配</h4>
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
                                    <input type="checkbox" class="custom-control-input" id="ckAllMenu" name="AllMenu">
                                    <label class="custom-control-label text-danger" for="ckAllMenu">-全选/全不选-</label>
                                </div>
                            </div>
                        </div>

                        <!--    begin     -->


                        <div class="form-group row  border-bottom">
                            <c:forEach items="${listMenu}" var="menu">
                            <!-- 上级开始-->
                            <div class="col-sm-3 form-inline">
                                <div class="custom-control custom-checkbox mr-sm-2" style="margin-left: 30px;">
                                    <input type="checkbox" class="custom-control-input"  id="c${menu.menuid}" name="c" value="${menu.menuid}">
                                    <label class="custom-control-label text-danger" for="c${menu.menuid}">${menu.menuname}/${menu.menuid}</label>
                                </div>
                            </div>
                            <!-- 上级结束 -->
                            <!-- 下级开始-->
                            <div class="col-sm-9 form-inline">
                                <c:forEach items="${menu.list}" var="subMenu">

                                <div class="custom-control custom-checkbox mr-sm-2">
                                    <input type="checkbox" class="custom-control-input" name="c${menu.menuid}" id="sub${subMenu.menuid}" value="${subMenu.menuid}">
                                    <label class="custom-control-label" for="sub${subMenu.menuid}">${subMenu.menuname}/${subMenu.menuid}</label>
                                </div>
                                </c:forEach>

                            </div>
                            <!-- 下级结束-->
                            </c:forEach>
                        </div>

                        <!--   end    -->

                        <div class="comment-footer">
                            <button type="button" id="saveMenu" class="btn btn-success btn-sm">保存</button>
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
    <input type="hidden" id="empid" value="${empid}">
</div>
<!-- ============================================================== -->
<!-- All Jquery -->
    <jsp:include page="../share/resources_js.jsp"></jsp:include>

    <script>
        //全选或全不选
        //id=ckAllMenu注册change事件
        $("#ckAllMenu").change(function (){
            $("input[name^=c]").prop("checked",$(this).prop("checked"))

        })


        //id以c开头的input注册change事件
        $("input[id^=c]").change(function (){
           // console.log($(this).get(0),$(this).attr("id"))
            //选中上级同时选中对应下级
            let id=$(this).attr("id")
            //上级id对应下级name
            $("input[name="+id+"]").prop("checked",$(this).prop("checked"))
        })

        //选中一个下级同时选中上级
        //id以sub开头的input注册change事件
        $("input[id^=sub]").change(function (){
           // console.log($(this)[0],$(this).attr("name"))
            //下级name对应上级id
            let name=$(this).attr("name") //c13
            //$("input[name="+name+"]:checked") 匹配所有input元素name=c13被 选中的
            if ($("input[name="+name+"]:checked").length>0)
                $("#"+name).prop("checked",true)
            else
                $("#"+name).prop("checked",false)
        })

        //要分配权限用户对应权限默认选中
        let url='${pageContext.request.contextPath}/menu/getbyempid?empId='+$("#empid").val()
        $.get(url,function (data){
            //console.log(data)
            $.each(data,function (index,obj){
                //console.log(obj.menuid) 1 2 3

                //$("input[value="+obj.menuid+"]").prop("checked",true)
                //匹配所有input元素name以c开头的(或包含c)
                $("input[name^=c]").each(function (i,o){
                    //console.log(this,o)
                    //console.log($(o).val(),$(this).val())
                    //判断是否相同
                    if(obj.menuid==$(this).val())
                    {
                        $(this).prop("checked",true)
                    }
                })
            })
        },"json")

        //保存
        //id=saveMenu注册事件
        $("#saveMenu").click(function (){
            let menuids=[]
            $("input[name^=c]:checked").each(function (index,obj){
                menuids.push($(this).val())
            })
            //
            location.href='${pageContext.request.contextPath}/menu/modifybyid?menuids='+menuids+"&empId="+$("#empid").val()
        })
    </script>
    </body>
    </html>
