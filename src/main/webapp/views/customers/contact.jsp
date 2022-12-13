<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html; charset=UTF-8" %>

<c:url value="/views/customers/css/" var="url"></c:url>
<c:url value="/views/customers/images/" var="urlImage"></c:url>
<c:url value="/views/customers/js/" var="urljs"></c:url>
<!DOCTYPE html>
<html>
<head>
	<title>Contact</title>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    
    <link href="https://fonts.googleapis.com/css?family=Poppins:200,300,400,500,600,700,800&display=swap" rel="stylesheet">
    <link href="https://fonts.googleapis.com/css?family=Lora:400,400i,700,700i&display=swap" rel="stylesheet">
    <link href="https://fonts.googleapis.com/css?family=Amatic+SC:400,700&display=swap" rel="stylesheet">
	<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.4/css/all.min.css" />
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
<body>
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
                    <li class="nav-item"><a href="Home" class="nav-link">Trang chủ</a></li>
                    <li class="nav-item dropdown">
                        <a class="nav-link dropdown-toggle" href="Shop" id="dropdown04" data-toggle="dropdown"
                            aria-haspopup="true" aria-expanded="false">Mua hàng</a>
                        <div class="dropdown-menu" aria-labelledby="dropdown04">
                            <a class="dropdown-item" href="Shop">Sản phẩm</a>
                            <a class="dropdown-item" href="Cart">Giỏ hàng</a>
                            <a class="dropdown-item" href="otod">Thanh toán</a>
                        </div>
                    </li>
                    <li class="nav-item"><a href="About" class="nav-link">Về chúng tôi</a></li>
                    <li class="nav-item"><a href="Blog" class="nav-link">Bài viết</a></li>
                    <li class="nav-item active"><a href="Contact" class="nav-link">Liên hệ</a></li>
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
<div class="hero-wrap hero-bread" style="background-image: url('${urlImage}bg_1.jpg');">
      <div class="container">
        <div class="row no-gutters slider-text align-items-center justify-content-center">
          <div class="col-md-9 ftco-animate text-center">
          	<p class="breadcrumbs"><span class="mr-2"><a href="Home">Trang chủ</a></span> <span>Liên hệ</span></p>
            <h1 class="mb-0 bread">Liên hệ với chúng tôi</h1>
          </div>
        </div>
      </div>
    </div>

    <section class="ftco-section contact-section bg-light">
      <div class="container">
      	<div class="row d-flex mb-5 contact-info">
          <div class="w-100"></div>
          <div class="col-md-3 d-flex">
          	<div class="info bg-white p-4">
	            <p><span>Địa chỉ:</span> 01 Võ Văn Ngân, Linh Chiểu, TP Thủ Đức, TPHCM</p>
	          </div>
          </div>
          <div class="col-md-3 d-flex">
          	<div class="info bg-white p-4">
	            <p><span>Điện thoại:</span> <a href="tel://1234567920">+84 4657 455</a></p>
	          </div>
          </div>
          <div class="col-md-3 d-flex">
          	<div class="info bg-white p-4">
	            <p><span>Email:</span> <a href="mailto:info@yoursite.com">group16@gmail.com</a></p>
	          </div>
          </div>
          <div class="col-md-3 d-flex">
          	<div class="info bg-white p-4">
	            <p><span>Website</span> <a href="#">organicfruit.com</a></p>
	          </div>
          </div>
        </div>
        <div class="row block-9">
          <div class="col-md-6 order-md-last d-flex">
            <form action="#" class="bg-white p-5 contact-form">
              <div class="form-group">
                <input type="text" class="form-control" placeholder="Your Name">
              </div>
              <div class="form-group">
                <input type="text" class="form-control" placeholder="Your Email">
              </div>
              <div class="form-group">
                <input type="text" class="form-control" placeholder="Subject">
              </div>
              <div class="form-group">
                <textarea name="" id="" cols="30" rows="7" class="form-control" placeholder="Message"></textarea>
              </div>
              <div class="form-group">
                <input type="submit" value="Send Message" class="btn btn-primary py-3 px-5">
              </div>
            </form>
          
          </div>

          <div class="col-md-6 d-flex">
          	<div id="map" class="bg-white"></div>
          </div>
        </div>
      </div>
    </section>
<jsp:include page="/views/customers/commons/footer.jsp"></jsp:include>
</body>
</html>