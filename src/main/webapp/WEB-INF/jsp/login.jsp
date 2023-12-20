
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html dir="ltr">

<head>
  <meta charset="utf-8">
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <!-- Tell the browser to be responsive to screen width -->
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <meta name="description" content="">
  <meta name="author" content="">

 <jsp:include page="share/resources_css.jsp"></jsp:include>
</head>

<body>
<div class="main-wrapper">
  <!-- ============================================================== -->
  <!-- Preloader - style you can find in spinners.css -->
  <!-- ============================================================== -->
  <div class="preloader">
    <div class="lds-ripple">
      <div class="lds-pos"></div>
      <div class="lds-pos"></div>
    </div>
  </div>
  <!-- ============================================================== -->
  <!-- Preloader - style you can find in spinners.css -->
  <!-- ============================================================== -->
  <!-- ============================================================== -->
  <!-- Login box.scss -->
  <!-- ============================================================== -->
  <div class="auth-wrapper d-flex no-block justify-content-center align-items-center bg-dark">
    <div class="auth-box bg-dark border-top border-secondary">
      <div id="loginform">
        <div class="text-center p-t-20 p-b-20">
          <span class="db" style="color: white; font-weight: bold;font-size: 1.875rem;">用户登录</span>
        </div>
        <!-- Form -->
        <form method="post" class="form-horizontal m-t-20" id="loginform" action="${pageContext.request.contextPath}/employee/login">
          <div class="row p-b-30">
            <div class="col-12">
              <div class="input-group mb-3">
                <div class="input-group-prepend">
                  <span class="input-group-text bg-success text-white" id="basic-addon1"><i class="ti-user"></i></span>
                </div>
                <input type="text" name="loginname" class="form-control form-control-lg" placeholder="用户名称" aria-label="Username" aria-describedby="basic-addon1" required="">
              </div>
              <div class="input-group mb-3">
                <div class="input-group-prepend">
                  <span class="input-group-text bg-warning text-white" id="basic-addon2"><i class="ti-pencil"></i></span>
                </div>
                <input type="text" name="password" class="form-control form-control-lg" placeholder="用户密码" aria-label="Password" aria-describedby="basic-addon1" required="">
              </div>
              <div class="input-group mb-3">
                <div class="input-group-prepend">
                  <span class="input-group-text bg-success text-white" id="basic-addon1"><i class="bi bi-key"></i></span>
                </div>
                <input type="text" name="verCode" class="form-control form-control-lg col-6" placeholder="验证码" aria-label="Username" aria-describedby="basic-addon1" required="">
                <img src="${pageContext.request.contextPath}/employee/image" onclick="this.src='${pageContext.request.contextPath}/employee/image?d='+Math.random();"class="form-control form-control-lg col-6 " style="cursor: pointer">
              </div>
              <div class="input-group mb-3">
                <div class="custom-control custom-checkbox">
                  <input type="checkbox" class="custom-control-input" id="customControlAutosizing1">
                  <label class="custom-control-label" style="color: white;" for="customControlAutosizing1">记住密码</label>
                  <label class="custom-control-label" style="color: red;">
                   <c:if test="${param.msg==2}">
                     用户加锁
                   </c:if>
                    <c:if test="${param.msg==3}">
                      帐号或密码不对
                    </c:if>
                    <c:if test="${param.msg==4}">
                     验证码不对
                    </c:if>
                  </label>
                </div>
              </div>

            </div>
          </div>

          <div class="row border-top border-secondary">
            <div class="col-12">
              <div class="form-group">
                <div class="p-t-20">
                  <button class="btn btn-info" id="to-recover" type="button"><i class="fa fa-lock m-r-5"></i> 忘记密码?</button>
                  <button class="btn btn-success float-right" type="submit">登录</button>
                </div>
              </div>
            </div>
          </div>
        </form>
      </div>
      <div id="recoverform">
        <div class="text-center">
          <span class="text-white">输入您的电子邮件地址,将密码发送到你的邮箱.</span>
        </div>
        <div class="row m-t-20">
          <!-- Form -->
          <form class="col-12" action="index.html">
            <!-- email -->
            <div class="input-group mb-3">
              <div class="input-group-prepend">
                <span class="input-group-text bg-danger text-white" id="basic-addon1"><i class="ti-email"></i></span>
              </div>
              <input type="text" class="form-control form-control-lg" placeholder="输入电子邮件" aria-label="Username" aria-describedby="basic-addon1">
            </div>
            <!-- pwd -->
            <div class="row m-t-20 p-t-20 border-top border-secondary">
              <div class="col-12">
                <a class="btn btn-success" href="#" id="to-login" name="action">返回登录</a>
                <button class="btn btn-info float-right" type="button" name="action">找回密码</button>
              </div>
            </div>
          </form>
        </div>
      </div>
    </div>
  </div>
  <!-- ============================================================== -->
  <!-- Login box.scss -->
  <!-- ============================================================== -->
  <!-- ============================================================== -->
  <!-- Page wrapper scss in scafholding.scss -->
  <!-- ============================================================== -->
  <!-- ============================================================== -->
  <!-- Page wrapper scss in scafholding.scss -->
  <!-- ============================================================== -->
  <!-- ============================================================== -->
  <!-- Right Sidebar -->
  <!-- ============================================================== -->
  <!-- ============================================================== -->
  <!-- Right Sidebar -->
  <!-- ============================================================== -->
</div>
<!-- ============================================================== -->
<!-- All Required js -->
<!-- ============================================================== -->
<jsp:include page="share/resources_js.jsp"></jsp:include>
<!-- ============================================================== -->
<!-- This page plugin js -->
<!-- ============================================================== -->
<script>

  $('[data-toggle="tooltip"]').tooltip();
  $(".preloader").fadeOut();
  // ==============================================================
  // Login and Recover Password
  // ==============================================================
  $('#to-recover').on("click", function() {
    $("#loginform").slideUp();
    $("#recoverform").fadeIn();
  });
  $('#to-login').click(function(){

    $("#recoverform").hide();
    $("#loginform").fadeIn();
  });
</script>

</body>

</html>
