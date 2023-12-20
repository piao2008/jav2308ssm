
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
                    <h4 class="page-title">文件管理</h4>
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
                                <form class="form-inline navbar-form navbar-left" method="get" action="${pageContext.request.contextPath}/fileinfo/list">
                                    <!-- 搜索框 -->
                                    <div class="input-group" style="margin-right: 0.3125rem;">
                                        <input type="text" name="filename" value="${fileInfo.filename}" class="form-control" placeholder="请输入文件名查询" >
                                    </div>
                                    <!-- 下拉列表搜索 -->
                                    <div class="input-group" style="margin-right: 0.3125rem;">
                                        <select class="form-control"  name="departid" id="departid" >
                                            <option selected="selected" value="-1">==选择上传部门==</option>
                                            <c:forEach items="${listDepart}" var="depart">
                                                <option value="${depart.departid}">${depart.departname}</option>
                                            </c:forEach>

                                        </select>
                                    </div>
                                    <!-- 搜索框 -->
                                    <div class="input-group" style="margin-right: 0.3125rem;">
                                        <input type="text" name="empname" value="${fileInfo.empname}" class="form-control" placeholder="请输入上传员工姓名查询" >
                                    </div>
                                    <!-- 按钮和超链接 -->
                                    <div class="input-group" style="margin-right: 0.3125rem;">
								   	<span class="input-group-btn">
										<button type="submit" class="btn  btn-success">查询</button>
									</span>
                                        <span class="input-group-btn">
										<a href="fileinfo/append" class="btn btn-primary" style="margin-left: 5px;">添加</a>
									</span>
                                        <span class="input-group-btn">
										<a href="javascript:;" class="btn btn-danger"  deletes_url="${pageContext.request.contextPath}/fileinfo/removebyids?fileIds=" id="deleteAll" style="margin-left: 5px;">批量删除</a>
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
                                    <th scope="col">上传时间</th>
                                    <th scope="col">文件信息</th>
                                    <th scope="col">文件大小</th>
                                    <th scope="col">下载次数</th>
                                    <th scope="col">操作</th>
                                </tr>
                                </thead>
                                <tbody class="customtable">
                                <c:forEach items="${pages.list}" var="fileInfo" varStatus="vs">
                                <tr>
                                    <th>
                                        <label class="customcheckbox">
                                            <input type="checkbox" class="listCheckbox" value="${fileInfo.fileid}" name="c"/>
                                            <span class="checkmark"></span>
                                        </label>
                                    </th>
                                    <td>${(pages.currPage-1)*pages.pageSize+vs.count}</td>
                                    <td>${fileInfo.posttime}</td>
                                    <td>
                                        <div>文件名称：${fileInfo.filename}</div>
                                        <div>文件介绍：${fileInfo.filedesc}</div>
                                        <div>上传员工：${fileInfo.departname}-${fileInfo.empname}</div>
                                    </td>
                                    <td>${fileInfo.filesize}</td>
                                    <td id="count">${fileInfo.count}</td>
                                    <td>


                                        <a href="javascript:;" name="deleteRow"  delete_url="${pageContext.request.contextPath}/fileinfo/removebyid?fileId=" key="${fileInfo.fileid}">删除</a>
<%--                                        download="文件名"点击下载时,文件直接下载,而不是预览--%>
                                        <a download="${fileInfo.fileurl}" href="${pageContext.request.contextPath}/upload/${fileInfo.fileurl}"  style="font-size: 17px;margin-left: 20px">下载1</a>
<%--                                        onclick="downloadFile(${fileInfo.fileid},this) 其中this表示当前元素--%>
                                        <a href="javascript:;"   fileurl="${fileInfo.fileurl}" url="${pageContext.request.contextPath}/upload/${fileInfo.fileurl}"  style="font-size: 17px;margin-left: 20px" onclick="downloadFile(${fileInfo.fileid},this)">下载2</a>
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
                                                <li class="page-item"><a class="page-link" href="${pageContext.request.contextPath}/fileinfo/list?currPage=${pages.first}&filename=${fileInfo.filename}&departid=${fileInfo.departid}&empname=${fileInfo.empname}">首页</a></li>
                                                <li class="page-item"><a class="page-link" href="${pageContext.request.contextPath}/fileinfo/list?currPage=${pages.pre}&filename=${fileInfo.filename}&departid=${fileInfo.departid}&empname=${fileInfo.empname}">上一页</a></li>
                                                <li class="page-item"><a class="page-link" href="${pageContext.request.contextPath}/fileinfo/list?currPage=${pages.next}&filename=${fileInfo.filename}&departid=${fileInfo.departid}&empname=${fileInfo.empname}">下一页</a></li>
                                                <li class="page-item"><a class="page-link" href="${pageContext.request.contextPath}/fileinfo/list?currPage=${pages.last}&filename=${fileInfo.filename}&departid=${fileInfo.departid}&empname=${fileInfo.empname}">末页</a></li>
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
    <jsp:include page="../share/resources_js.jsp"></jsp:include>

    <script src="${pageContext.request.contextPath}/resources/js/fileinfo.js"></script>
    </body>
    </html>

