
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<aside class="left-sidebar" data-sidebarbg="skin5">
    <!-- Sidebar scroll-->
    <div class="scroll-sidebar">
        <!-- Sidebar navigation-->
        <nav class="sidebar-nav">
            <ul id="sidebarnav" class="p-t-30">
               <c:forEach items="${menuList}" var="menu">
                <li class="sidebar-item"> <a class="sidebar-link has-arrow waves-effect waves-light" href="javascript:void(0)" aria-expanded="false"><i class="${menu.ico}"></i><span class="hide-menu">${menu.menuname}</span></a>
                    <ul aria-expanded="false" class="collapse  first-level">
                        <c:forEach items="${menu.list}" var="subMenu">
                        <li class="sidebar-item"><a href="${pageContext.request.contextPath}/${subMenu.url}" class="sidebar-link"><i class="bi bi-file-earmark-richtext"></i><span class="hide-menu">${subMenu.menuname}</span></a></li>
                        </c:forEach>
                    </ul>
                </li>
               </c:forEach>
            </ul>
        </nav>
        <!-- End Sidebar navigation -->
    </div>
    <!-- End Sidebar scroll-->
</aside>
