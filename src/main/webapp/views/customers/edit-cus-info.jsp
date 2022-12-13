<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html; charset=UTF-8" %>

<c:url value="/views/customers/css/" var="url"></c:url>
<c:url value="/views/customers/images/" var="urlImage"></c:url>
<c:url value="/views/customers/js/" var="urljs"></c:url>
<!DOCTYPE html>
<html>
<head>
	<title>Organic Fruit</title>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    
    <link href="https://fonts.googleapis.com/css?family=Poppins:200,300,400,500,600,700,800&display=swap" rel="stylesheet">
    <link href="https://fonts.googleapis.com/css?family=Lora:400,400i,700,700i&display=swap" rel="stylesheet">
    <link href="https://fonts.googleapis.com/css?family=Amatic+SC:400,700&display=swap" rel="stylesheet">

    <link rel="stylesheet" href="${url}open-iconic-bootstrap.min.css">
    <link rel="stylesheet" href="${url}animate.css">
    
    <link rel="stylesheet" href="${url}owl.carousel.min.css">
    <link rel="stylesheet" href="${url}owl.theme.default.min.css">
    <link rel="stylesheet" href="${url}magnific-popup.css">

    <link rel="stylesheet" href="${url}aos.css">

    <link rel="stylesheet" href="${url}ionicons.min.css">

    <link rel="stylesheet" href="${url}bootstrap-datepicker.css">
    <link rel="stylesheet" href="${url}jquery.timepicker.css">

    
    <link rel="stylesheet" href="${url}flaticon.css">
    <link rel="stylesheet" href="${url}icomoon.css">
    <link rel="stylesheet" href="${url}style.css">
</head>
<body class="goto-here">
<input type="hidden" id="status" value="<%= request.getAttribute("status")%>">
<div class="py-1 bg-primary">
        <div class="container">
            <div class="row no-gutters d-flex align-items-start align-items-center px-md-0">
                <div class="col-lg-12 d-block">
                    <div class="row d-flex">
                        <div class="col-md pr-4 d-flex topper align-items-center">
                            <div class="icon mr-2 d-flex justify-content-center align-items-center"><span
                                    class="icon-phone2"></span></div>
                            <span class="text">+84 394197371</span>
                        </div>
                        <div class="col-md pr-4 d-flex topper align-items-center">
                            <div class="icon mr-2 d-flex justify-content-center align-items-center"><span
                                    class="icon-paper-plane"></span></div>
                            <span class="text">group16@email.com</span>
                        </div>
                        <div class="col-md-5 pr-4 d-flex topper align-items-center text-lg-right">
                            <span class="text">3-5 Business days delivery &amp; Free Returns</span>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <nav class="navbar navbar-expand-lg navbar-dark ftco_navbar bg-dark ftco-navbar-light" id="ftco-navbar">
        <div class="container">
            <a class="navbar-brand" href="index.html">Organic Fruit</a>
            <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#ftco-nav"
                aria-controls="ftco-nav" aria-expanded="false" aria-label="Toggle navigation">
                <span class="oi oi-menu"></span> Menu
            </button>

            <div class="collapse navbar-collapse" id="ftco-nav">
                <ul class="navbar-nav ml-auto">
                    <li class="nav-item "><a href="Home" class="nav-link">Trang chủ</a></li>
                    <li class="nav-item dropdown">
                        <a class="nav-link dropdown-toggle" href="Shop" id="dropdown04" data-toggle="dropdown"
                            aria-haspopup="true" aria-expanded="false">Mua hàng</a>
                        <div class="dropdown-menu" aria-labelledby="dropdown04">
                            <a class="dropdown-item" href="Shop">Sản phẩm</a>
                            <a class="dropdown-item" href="Cart">Giỏ hàng</a>
                            <a class="dropdown-item" href="otod">Thanh toán</a>
                        </div>
                    </li>
                    <li class="nav-item active"><a href="About" class="nav-link">Về chúng tôi</a></li>
                    <li class="nav-item"><a href="Blog" class="nav-link">Bài viết</a></li>
                    <li class="nav-item"><a href="Contact" class="nav-link">Liên hệ</a></li>
                    <c:set var="count" value="${0 }"/>
			    	<c:forEach items="${sessionScope.cart }" var="map">
			    		<c:set var="count" value="${count+map.value.quantity }"/>
			    	</c:forEach>
                    <li class="nav-item cta cta-colored"><a href="Cart" class="nav-link"><span
                                class="icon-shopping_cart"></span>[${count }]</a></li>
                    <li class="nav-item dropdown">
                        <a class="nav-link dropdown-toggle" href="#" id="dropdown04" data-toggle="dropdown" aria-haspopup="true"
                            aria-expanded="false"><span class="icon-user"></span></a>
                        <div class="dropdown-menu" aria-labelledby="dropdown04">
                        <c:if test="${sessionScope.acc != null}">
							
						        <span class="dropdown-item">Hi, ${sessionScope.acc.username}</span>
						        <a class="dropdown-item" href="cus_info">Thông tin cá nhân</a>
                            	<a class="dropdown-item" href="Logout">Đăng xuất</a>
						    
						</c:if>
						<c:if test="${sessionScope.acc == null}">
						    
                            <a class="dropdown-item" href="Login">Đăng nhập</a>
                            <a class="dropdown-item" href="Signup">Đăng ký</a>
						</c:if>
                            
                        </div>
                    </li>
                </ul>
            </div>
        </div>
    </nav>
<section class="ftco-section ftco-degree-bg">

      <div class="container">
               
              <!-- END comment-list -->
             
              <div class="comment-form-wrap pt-5">
                <h3 class="mb-5">Chỉnh sửa tài khoản</h3>
                <form action="update_cus" method="post" class="p-5 bg-light">
                  <div class="form-group">
                    <label for="name">Username</label>
                    <input type="text" class="form-control"  value="${sessionScope.acc.username }" id="name" >
                  </div>
                  <div class="form-group">
                    <label for="email">Email</label>
                    <input type="email" class="form-control" name="email" value="${acc.email }" id="email" >
                  </div>
                  <div class="form-group">
                    <label for="email">Name</label>
                    <input type="text" class="form-control" name="cusName" value="${cus.cusName }" id="email" >
                  </div>
                  <div class="form-group">
                    <label for="email">Password</label>
                    <input type="password" class="form-control" value="${acc.password }" id="password" >
                  </div>
                  <div class="form-group">
                    <label for="website">Địa chỉ</label>
                    <input type="text" class="form-control" name="cusAddress" value="${cus.cusAddress }" id="website" >
                  </div>

                  <div class="form-group">
                    <label for="message">Số điện thoại</label>
                    <input type="text" class="form-control" name="cusPhoneNumber" value="${cus.cusPhoneNumber }" id="message" >
                  </div>
                  <div class="form-group">
                    <input type="submit" value="Chỉnh sửa" class="btn py-3 px-4 btn-primary" >
                    <input class="btn py-3 px-4 btn-primary" type="button" onclick="location.href='${pageContext.request.contextPath}/cus_info';" value="Thoát">
                  </div>

                </form>
              </div>
              </div>
              
              </section>

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
	
	</script>             
<jsp:include page="/views/customers/commons/footer.jsp"></jsp:include>
</body>
</html>