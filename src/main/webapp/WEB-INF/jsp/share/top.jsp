
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%--把项目的名称放在id=oa元素上--%>
<div id="oa" root="${pageContext.request.contextPath}"></div>
<header class="topbar" data-navbarbg="skin5">
  <nav class="navbar top-navbar navbar-expand-md navbar-dark">
    <div class="navbar-header" data-logobg="skin5">
      <!-- This is for the sidebar toggle which is visible on mobile only -->
      <a class="nav-toggler waves-effect waves-light d-block d-md-none" href="javascript:void(0)"><i class="ti-menu ti-close"></i></a>
      <!-- ============================================================== -->
      <!-- Logo -->
      <!-- ============================================================== -->
      <a class="navbar-brand" href="${pageContext.request.contextPath}/employee/main">
        <!-- Logo icon -->
        <b class="logo-icon p-l-10">
          <!--You can put here icon as well // <i class="wi wi-sunset"></i> //-->
          <!-- Dark Logo icon -->

          <img src="/resources/assets/images/asjy.jpg" style="width: 1.875rem;height: 1.4375rem;" alt="homepage" class="light-logo" />

        </b>
        <!--End Logo icon -->
        <!-- Logo text -->
        <span class="logo-text">
		                             <!-- dark Logo text -->
		                             	宙斯-OA办公自动化系统
		                        </span>
        <!-- Logo icon -->
        <!--End Logo icon -->
      </a>
      <!-- ============================================================== -->
      <!-- End Logo -->
      <!-- ============================================================== -->
      <!-- ============================================================== -->
      <!-- Toggle which is visible on mobile only -->
      <!-- ============================================================== -->
      <a class="topbartoggler d-block d-md-none waves-effect waves-light" href="javascript:void(0)" data-toggle="collapse" data-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation"><i class="ti-more"></i></a>
    </div>
    <!-- ============================================================== -->
    <!-- End Logo -->
    <!-- ============================================================== -->
    <div class="navbar-collapse collapse" id="navbarSupportedContent" data-navbarbg="skin5">
      <!-- ============================================================== -->
      <!-- toggle and nav items显示或隐藏 -->
      <!-- ============================================================== -->
      <ul class="navbar-nav float-left mr-auto">
        <li class="nav-item d-none d-md-block"><a class="nav-link sidebartoggler waves-effect waves-light" href="javascript:void(0)" data-sidebartype="mini-sidebar"><i class="mdi mdi-menu font-24"></i></a></li>
        <li class="nav-item search-box">
          <a class="nav-link waves-effect waves-dark" href="javascript:void(0)"><i class="bi bi-person-dash"></i>欢迎 [${loginEmp.loginname}]登录</a>

        </li>
      </ul>
      <!-- ============================================================== -->
      <!-- Right side toggle and nav items -->
      <!-- ============================================================== -->
      <ul class="navbar-nav float-right">
        <!-- ============================================================== -->
        <!-- User profile and search -->
        <!-- ============================================================== -->
        <li class="nav-item dropdown">
          <a class="nav-link dropdown-toggle text-muted waves-effect waves-dark pro-pic" href="" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false"><img src="/resources/assets/images/users/1.jpg" alt="user" class="rounded-circle" width="31"></a>
          <div class="dropdown-menu dropdown-menu-right user-dd animated">
            <a class="dropdown-item" href="/hotel/employee/center?"><i class="ti-user m-r-5 m-l-5"></i>个人中心</a>
            <a class="dropdown-item" href="/hotel/employee/updatePassword"><i class="ti-settings m-r-5 m-l-5"></i>修改密码</a>
            <div class="dropdown-divider"></div>
            <%-- 		                                <a class="dropdown-item" href="/hotel/employee/updateState"><i class="ti-wallet m-r-5 m-l-5"></i>账户设置</a> --%>
            <a name="exits" class="dropdown-item" href="${pageContext.request.contextPath}/employee/exit"><i class="fa fa-power-off m-r-5 m-l-5"></i>安全退出</a>
            <div class="dropdown-divider"></div>

          </div>
        </li>
        <!-- ============================================================== -->
        <!-- User profile and search -->
        <!-- ============================================================== -->
      </ul>
    </div>
  </nav>
</header>
