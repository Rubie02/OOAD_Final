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
            <a class="navbar-brand" href="Home">Organic Fruit</a>
            <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#ftco-nav"
                aria-controls="ftco-nav" aria-expanded="false" aria-label="Toggle navigation">
                <span class="oi oi-menu"></span> Menu
            </button>

            <div class="collapse navbar-collapse" id="ftco-nav">
                <ul class="navbar-nav ml-auto">
                    <li class="nav-item "><a href="Home" class="nav-link">Trang ch???</a></li>
                    <li class="nav-item dropdown">
                        <a class="nav-link dropdown-toggle" href="Shop" id="dropdown04" data-toggle="dropdown"
                            aria-haspopup="true" aria-expanded="false">Mua h??ng</a>
                        <div class="dropdown-menu" aria-labelledby="dropdown04">
                            <a class="dropdown-item" href="Shop">S???n ph???m</a>
                            <a class="dropdown-item" href="Cart">Gi??? h??ng</a>
                            <a class="dropdown-item" href="otod">????n h??ng</a>
                        </div>
                    </li>
                    <li class="nav-item active"><a href="About" class="nav-link">V??? ch??ng t??i</a></li>
                    <li class="nav-item"><a href="Blog" class="nav-link">B??i vi???t</a></li>
                    <li class="nav-item"><a href="Contact" class="nav-link">Li??n h???</a></li>
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
						        <a class="dropdown-item" href="cus_info">Th??ng tin c?? nh??n</a>
                            	<a class="dropdown-item" href="Logout">????ng xu???t</a>
						    
						</c:if>
						<c:if test="${sessionScope.acc == null}">
						    
                            <a class="dropdown-item" href="Login">????ng nh???p</a>
                            <a class="dropdown-item" href="Signup">????ng k??</a>
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
          	<p class="breadcrumbs"><span class="mr-2"><a href="Home">Trang ch???</a></span> <span>V??? ch??ng t??i</span></p>
            <h1 class="mb-0 bread">v??? ch??ng t??i</h1>
          </div>
        </div>
      </div>
    </div>

    <section class="ftco-section ftco-no-pb ftco-no-pt bg-light">
			<div class="container">
				<div class="row">
					<div class="col-md-5 p-md-5 img img-2 d-flex justify-content-center align-items-center" style="background-image: url(${urlImage}about.jpg);">
						<a href="#" class="icon popup-vimeo d-flex justify-content-center align-items-center">
							<span class="icon-play"></span>
						</a>
					</div>
					<div class="col-md-7 py-5 wrap-about pb-md-5 ftco-animate">
	          <div class="heading-section-bold mb-4 mt-md-5">
	          	<div class="ml-md-0">
		            <h2 class="mb-4">Ch??o m???ng b???n ?????n v???i Organic Fruit</h2>
	            </div>
	          </div>
	          <div class="pb-md-5">
	          	<p>Tr???i nghi???m c???a kh??ch h??ng lu??n lu??n ?????t l??n h??ng ?????u t???i Organic Fruit</p>
							
							<p><a href="Shop" class="btn btn-primary">Xem s???n ph???m</a></p>
						</div>
					</div>
				</div>
			</div>
		</section>

		<section class="ftco-section ftco-no-pt ftco-no-pb py-5 bg-light">
      <div class="container py-4">
        <div class="row d-flex justify-content-center py-5">
          <div class="col-md-6">
          	<h2 style="font-size: 22px;" class="mb-0">Subcribe to our Newsletter</h2>
          	<span>Get e-mail updates about our latest shops and special offers</span>
          </div>
          <div class="col-md-6 d-flex align-items-center">
            <form action="#" class="subscribe-form">
              <div class="form-group d-flex">
                <input type="text" class="form-control" placeholder="Enter email address">
                <input type="submit" value="Subscribe" class="submit px-3">
              </div>
            </form>
          </div>
        </div>
      </div>
    </section>
		
		<section class="ftco-section ftco-counter img" id="section-counter" style="background-image: url(${urlImage}bg_3.jpg);">
    	<div class="container">
    		<div class="row justify-content-center py-5">
    			<div class="col-md-10">
		    		<div class="row">
		          <div class="col-md-3 d-flex justify-content-center counter-wrap ftco-animate">
		            <div class="block-18 text-center">
		              <div class="text">
		                <strong class="number" data-number="10000">0</strong>
		                <span>Happy Customers</span>
		              </div>
		            </div>
		          </div>
		          <div class="col-md-3 d-flex justify-content-center counter-wrap ftco-animate">
		            <div class="block-18 text-center">
		              <div class="text">
		                <strong class="number" data-number="100">0</strong>
		                <span>Branches</span>
		              </div>
		            </div>
		          </div>
		          <div class="col-md-3 d-flex justify-content-center counter-wrap ftco-animate">
		            <div class="block-18 text-center">
		              <div class="text">
		                <strong class="number" data-number="1000">0</strong>
		                <span>Partner</span>
		              </div>
		            </div>
		          </div>
		          <div class="col-md-3 d-flex justify-content-center counter-wrap ftco-animate">
		            <div class="block-18 text-center">
		              <div class="text">
		                <strong class="number" data-number="100">0</strong>
		                <span>Awards</span>
		              </div>
		            </div>
		          </div>
		        </div>
	        </div>
        </div>
    	</div>
    </section>
		
		

    <section class="ftco-section bg-light">
			<div class="container">
				<div class="row no-gutters ftco-services">
          <div class="col-lg-3 text-center d-flex align-self-stretch ftco-animate">
            <div class="media block-6 services mb-md-0 mb-4">
              <div class="icon bg-color-1 active d-flex justify-content-center align-items-center mb-2">
            		<span class="flaticon-shipped"></span>
              </div>
              <div class="media-body">
                <h3 class="heading">Mi???n ph?? v???n chuy???n</h3>
                <span>H??a ????n tr??n 100000 VN??</span>
              </div>
            </div>      
          </div>
          <div class="col-lg-3 text-center d-flex align-self-stretch ftco-animate">
            <div class="media block-6 services mb-md-0 mb-4">
              <div class="icon bg-color-2 d-flex justify-content-center align-items-center mb-2">
            		<span class="flaticon-diet"></span>
              </div>
              <div class="media-body">
                <h3 class="heading">Uy t??n</h3>
                <span>????ng g??i c???n th???n</span>
              </div>
            </div>    
          </div>
          <div class="col-lg-3 text-center d-flex align-self-stretch ftco-animate">
            <div class="media block-6 services mb-md-0 mb-4">
              <div class="icon bg-color-3 d-flex justify-content-center align-items-center mb-2">
            		<span class="flaticon-award"></span>
              </div>
              <div class="media-body">
                <h3 class="heading">Ch???t l?????ng</h3>
                <span>S???n ph???m ch???t l?????ng cao</span>
              </div>
            </div>      
          </div>
          <div class="col-lg-3 text-center d-flex align-self-stretch ftco-animate">
            <div class="media block-6 services mb-md-0 mb-4">
              <div class="icon bg-color-4 d-flex justify-content-center align-items-center mb-2">
            		<span class="flaticon-customer-service"></span>
              </div>
              <div class="media-body">
                <h3 class="heading">H??? tr???</h3>
                <span>H??? tr??? 24/7</span>
              </div>
            </div>      
          </div>
        </div>
			</div>
		</section>
<jsp:include page="/views/customers/commons/footer.jsp"></jsp:include>
</body>
</html>