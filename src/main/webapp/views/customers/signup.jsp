<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<c:url value="/views/customers/css/" var="url"></c:url>
<c:url value="/views/customers/js/" var="urljs"></c:url>
<c:url value="/views/customers/images/" var="urlImage"></c:url>
<c:url value="/views/customers/vendor/" var="urlvendor"></c:url>
<c:url value="/views/customers/fonts/" var="urlfont"></c:url>
<!DOCTYPE html>
<html>
<head>
	<title>Đăng ký </title>
	<meta charset="UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1">
<!--===============================================================================================-->	
	<link rel="icon" type="image/png" href="${urlImage }icons/favicon.ico"/>
<!--===============================================================================================-->
	<link rel="stylesheet" type="text/css" href="${urlvendor }bootstrap/css/bootstrap.min.css">
<!--===============================================================================================-->
	<link rel="stylesheet" type="text/css" href="${urlfont}font-awesome-4.7.0/css/font-awesome.min.css">
<!--===============================================================================================-->
	<link rel="stylesheet" type="text/css" href="${urlvendor }animate/animate.css">
<!--===============================================================================================-->	
	<link rel="stylesheet" type="text/css" href="${urlvendor }css-hamburgers/hamburgers.min.css">
<!--===============================================================================================-->
	<link rel="stylesheet" type="text/css" href="${urlvendor }select2/select2.min.css">
<!--===============================================================================================-->
	<link rel="stylesheet" type="text/css" href="${url }util.css">
	<link rel="stylesheet" type="text/css" href="${url }main.css">
</head>
<body>
<input type="hidden" id="status" value="<%= request.getAttribute("status")%>">
<div class="limiter">
        <div class="container-login100">
            <div class="wrap-login100">
                <div class="login100-pic js-tilt" data-tilt>
                    <img src="${urlImage }img-01.png" alt="IMG">
                </div>

                <form method="post" action="Signup" class="login100-form validate-form">
                    <span class="login100-form-title">
                        Đăng ký tài khoản
                    </span>
					<div class="wrap-input100 validate-input">
                        <input class="input100" type="text" name="user" placeholder="Username">
                        <span class="focus-input100"></span>
                        <span class="symbol-input100">
                            <i class="fa fa-user" aria-hidden="true"></i>
                        </span>
                    </div>
                    <div class="wrap-input100 validate-input" data-validate="Valid email is required: ex@abc.xyz">
                        <input class="input100" type="text" name="email" placeholder="Email">
                        <span class="focus-input100"></span>
                        <span class="symbol-input100">
                            <i class="fa fa-envelope" aria-hidden="true"></i>
                        </span>
                    </div>

                    <div class="wrap-input100 validate-input" data-validate="Password is required">
                        <input class="input100" type="password" name="pass" placeholder="Password">
                        <span class="focus-input100"></span>
                        <span class="symbol-input100">
                            <i class="fa fa-lock" aria-hidden="true"></i>
                        </span>
                    </div>
                    <div class="wrap-input100 validate-input" data-validate="Password is required">
                        <input class="input100" type="password" name="repass" placeholder="Repeat Password">
                        <span class="focus-input100"></span>
                        <span class="symbol-input100">
                            <i class="fa fa-lock" aria-hidden="true"></i>
                        </span>
                    </div>

                    <div class="container-login100-form-btn">
                        <button class="login100-form-btn">
                            Đăng ký
                        </button>
                    </div>

                    <div class="text-center p-t-12">
                        <span class="txt1">
                            Forgot
                        </span>
                        <a class="txt2" href="#">
                            Username / Password?
                        </a>
                        <a class="txt2" href="Login">
                            Đăng nhập
                            <i class="fa fa-long-arrow-right m-l-5" aria-hidden="true"></i>
                        </a>
                    </div>

                    <div class="text-center p-t-136">
                        
                    </div>
                </form>
            </div>
        </div>
    </div>




    <!--===============================================================================================-->
    <script src="${urlvendor }jquery/jquery-3.2.1.min.js"></script>
    <!--===============================================================================================-->
    <script src="${urlvendor }bootstrap/js/popper.js"></script>
    <script src="${urlvendor }bootstrap/js/bootstrap.min.js"></script>
    <!--===============================================================================================-->
    <script src="${urlvendor }select2/select2.min.js"></script>
    <!--===============================================================================================-->
    <script src="${urlvendor }tilt/tilt.jquery.min.js"></script>
    <script>
        $('.js-tilt').tilt({
            scale: 1.1
        })
    </script>
    <!--===============================================================================================-->
    <script src="${urljs }main.js"></script>
	<script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
	<link rel="stylesheet" href="alert/dist/sweetalert.css">

	<script type="text/javascript">
	var status = document.getElementById("status").value;
	if(status == "success"){
		swal("Xin chúc mừng","Tạo tài khoản thành công ", "success");
	}
	else if(status == "passwordNotMatch"){
		swal("Oops!!","Mật khẩu không trùng khớp","error");
	}
	else if(status == "invalidPassword"){
		swal("Oops!!","Mật khẩu phải bao gồm số, ký tự đặc biệt, chũ in hoa và chữ thường","error");
	}
	else if(status == "existUsername"){
		swal("Oops!!","Username đã tồn tại","error");
	}
	else if(status == "existEmail"){
		swal("Oops!!","Email đã tồn tại","error");
	}
	</script>

</body>
</html>