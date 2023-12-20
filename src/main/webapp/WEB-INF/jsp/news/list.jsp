
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
                    <h4 class="page-title">新闻管理</h4>
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
                                <form class="form-inline navbar-form navbar-left" method="get" action="${pageContext.request.contextPath}/news/list">
                                    <!-- 下拉列表搜索 -->
                                    <div class="input-group" style="margin-right: 0.3125rem;">
                                        <select class="form-control"  name="newstypeid" id="newstypeid">
                                            <option selected="selected" value="-1">请选择</option>
                                            <c:forEach items="${listNewsType}" var="newsType">
                                                <option value="${newsType.newstypeid}">${newsType.newsname}</option>
                                            </c:forEach>
                                        </select>
                                    </div>
                                    <!-- 搜索框 -->
                                    <div class="input-group" style="margin-right: 0.3125rem;">
                                        <input type="text" name="newstitle"  value="${news.newstitle}" class="form-control" placeholder="请输入标题查询" >
                                    </div>
                                    <div class="input-group" style="margin-right: 0.3125rem;">
                                        <input type="text" name="newscontent" value="${news.newscontent}" class="form-control" placeholder="请输入内容查询" >
                                    </div>

                                    <div class="input-group" style="margin-right: 0.3125rem;">
                                        <input type="text" name="empname" value="${news.empname}" class="form-control" placeholder="请输入员工姓名查询" >
                                    </div>
                                    <div class="input-group" style="margin-right: 0.3125rem;">
                                        <select class="form-control"  name="state" id="state">
                                            <option value="-1">==选择状态==</option>
                                            <option value="0">未审核</option>
                                            <option value="1">已审核</option>
                                        </select>
                                    </div>
                                    <!-- 按钮和超链接 -->
                                    <div class="input-group" style="margin-right: 0.3125rem;">
								   	<span class="input-group-btn">
										<button type="submit" class="btn  btn-success">查询</button>
									</span>
                                        <span class="input-group-btn">
										<a href="news/append" class="btn btn-primary" style="margin-left: 5px;">添加</a>
									</span>
                                        <span class="input-group-btn">
										<a href="javascript:;" class="btn btn-danger" id="deleteAll" deletes_url="${pageContext.request.contextPath}/news/removebyids?newsIds=" style="margin-left: 5px;">批量删除</a>
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

                                    <th scope="col">新闻信息</th>
                                    <th scope="col">新闻内容</th>
                                    <th scope="col">发布时间</th>
                                    <th scope="col">是否审核</th>
                                    <th scope="col">操作</th>
                                </tr>
                                </thead>
                                <tbody class="customtable">
                                <c:forEach items="${pages.list}" var="news" varStatus="vs">
                                <tr>
                                    <th>
                                        <label class="customcheckbox">
                                            <input type="checkbox"  name="${news.empid==loginEmp.empid?'c':'c1'}" class="listCheckbox" value="${news.newsid}"/>
                                            <span class="checkmark"></span>
                                        </label>
                                    </th>
                                    <td>${(pages.currPage-1)*pages.pageSize+vs.count}</td>
                                    <td>
                                        <div>创建时间 : ${news.addtime}</div>
                                        <div>新闻栏目 : ${news.newsname}</div>
                                        <div>新闻标题 : ${news.newstitle}</div>
                                        <div>新闻作者 : ${news.empname}</div>
                                    </td>
                                    <td>${news.newscontent}</td>
                                    <td>${news.publishtime}</td>
                                    <td>${news.state==0?'未审核':'已审核'}</td>
                                    <td>
                                        <c:if test="${news.empid==loginEmp.empid}">
                                        <a href="javascript:;" name="deleteRow" key="${news.newsid}" delete_url="${pageContext.request.contextPath}/news/removebyid?newsId=">删除</a>
                                        <a href="${pageContext.request.contextPath}/news/edit?newsId=${news.newsid}">修改</a>
                                        <c:if test="${news.state==0}">
                                            <a href="javascript:;" onclick="updateState(${news.newsid})">审核</a>
                                        </c:if>
                                        <c:if test="${news.state==1}">
                                            <span style="color: red;font-weight: bold;">已审核</span>
                                        </c:if>
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
                                                <li class="page-item"><a class="page-link" href="${pageContext.request.contextPath}/news/list?currPage=${pages.first}&newstypeid=${news.newstypeid}&newstitle=${news.newstitle}&state=${news.state}&newscontent=${news.newscontent}">首页</a></li>
                                                <li class="page-item"><a class="page-link" href="${pageContext.request.contextPath}/news/list?currPage=${pages.pre}&newstypeid=${news.newstypeid}&newstitle=${news.newstitle}&state=${news.state}&newscontent=${news.newscontent}">上一页</a></li>
                                                <li class="page-item"><a class="page-link" href="${pageContext.request.contextPath}/news/list?currPage=${pages.next}&newstypeid=${news.newstypeid}&newstitle=${news.newstitle}&state=${news.state}&newscontent=${news.newscontent}">下一页</a></li>
                                                <li class="page-item"><a class="page-link" href="${pageContext.request.contextPath}/news/list?currPage=${pages.last}&newstypeid=${news.newstypeid}&newstitle=${news.newstitle}&state=${news.state}&newscontent=${news.newscontent}">末页</a></li>
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
        $("#newstypeid").val('${news.newstypeid}')
        $("#state").val('${news.state}')
        //
        function  updateState(newsid)
        {
            if(confirm("确认审核?"))
            {
               let url='${pageContext.request.contextPath}/news/updatestate?newsId='+newsid
                location.href=url
            }
        }
    </script>
    </body>
    </html>
