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

    <link rel="stylesheet" type="text/css" href="${url}open-iconic-bootstrap.min.css">
    <link rel="stylesheet" type="text/css" href="${url}animate.css">
    
    <link rel="stylesheet" type="text/css" href="${url}owl.carousel.min.css">
    <link rel="stylesheet" type="text/css" href="${url}owl.theme.default.min.css">
    <link rel="stylesheet" type="text/css" href="${url}magnific-popup.css">

    <link rel="stylesheet" type="text/css" href="${url}aos.css">

    <link rel="stylesheet" type="text/css" href="${url}ionicons.min.css">

    <link rel="stylesheet" type="text/css" href="${url}bootstrap-datepicker.css">
    <link rel="stylesheet" type="text/css" href="${url}jquery.timepicker.css">

    
    <link rel="stylesheet" type="text/css" href="${url}flaticon.css">
    <link rel="stylesheet" type="text/css" href="${url}icomoon.css">
    <link rel="stylesheet" type="text/css" href="${url}style.css">
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
                    <li class="nav-item active"><a href="Home" class="nav-link">Trang ch???</a></li>
                    <li class="nav-item dropdown">
                        <a class="nav-link dropdown-toggle" href="Shop" id="dropdown04" data-toggle="dropdown"
                            aria-haspopup="true" aria-expanded="false">Mua h??ng</a>
                        <div class="dropdown-menu" aria-labelledby="dropdown04">
                            <a class="dropdown-item" href="Shop">S???n ph???m</a>
                            <a class="dropdown-item" href="Cart">Gi??? h??ng</a>
                            <a class="dropdown-item" href="otod">Thanh to??n</a>
                        </div>
                    </li>
                    <li class="nav-item"><a href="about.html" class="nav-link">V??? ch??ng t??i</a></li>
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
<section id="home-section" class="hero">
		  <div class="home-slider owl-carousel">
	      <div class="slider-item" style="background-image: url(${urlImage}/bg_1.jpg);">
	      	<div class="overlay"></div>
	        <div class="container">
	          <div class="row slider-text justify-content-center align-items-center" data-scrollax-parent="true">

	            <div class="col-md-12 ftco-animate text-center">
	              <h1 class="mb-2">Ch??ng t??i cung c???p rau c??? &amp; qu???</h1>
	              <h2 class="subheading mb-4">Ch??ng t??i cung c???p rau c??? &amp; qu???</h2>
	              <p><a href="#" class="btn btn-primary">Xem chi ti???t</a></p>
	            </div>

	          </div>
	        </div>
	      </div>

	      <div class="slider-item" style="background-image: url(${urlImage}bg_2.jpg);">
	      	<div class="overlay"></div>
	        <div class="container">
	          <div class="row slider-text justify-content-center align-items-center" data-scrollax-parent="true">

	            <div class="col-sm-12 ftco-animate text-center">
	              <h1 class="mb-2">100% Fresh &amp; Organic Foods</h1>
	              <h2 class="subheading mb-4">Ch??ng t??i cung c???p rau c??? &amp; qu???</h2>
	              <p><a href="#" class="btn btn-primary">Xem chi ti???t</a></p>
	            </div>

	          </div>
	        </div>
	      </div>
	    </div>
    </section>

    <section class="ftco-section">
			<div class="container">
				<div class="row no-gutters ftco-services">
          <div class="col-md-3 text-center d-flex align-self-stretch ftco-animate">
            <div class="media block-6 services mb-md-0 mb-4">
              <div class="icon bg-color-1 active d-flex justify-content-center align-items-center mb-2">
            		<span class="flaticon-shipped"></span>
              </div>
              <div class="media-body">
                <h3 class="heading">Mi???n ph?? v???n chuy???n</h3>
                <span>H??a ????n tr??n 100 000 VN??</span>
              </div>
            </div>      
          </div>
          <div class="col-md-3 text-center d-flex align-self-stretch ftco-animate">
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
          <div class="col-md-3 text-center d-flex align-self-stretch ftco-animate">
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
          <div class="col-md-3 text-center d-flex align-self-stretch ftco-animate">
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

		<section class="ftco-section ftco-category ftco-no-pt">
			<div class="container">
				<div class="row">
					<div class="col-md-8">
						<div class="row">
							<div class="col-md-6 order-md-last align-items-stretch d-flex">
								<div class="category-wrap-2 ftco-animate img align-self-stretch d-flex" style="background-image: url(${urlImage}category.jpg);">
									<div class="text text-center">
										<h2>Rau c??? qu???</h2>
										<p>An to??n s???c kh???e cho m???i nh??</p>
										<p><a href="#" class="btn btn-primary">Mua ngay</a></p>
									</div>
								</div>
							</div>
							<div class="col-md-6">
								<div class="category-wrap ftco-animate img mb-4 d-flex align-items-end" style="background-image: url(${urlImage}category-1.jpg);">
									<div class="text px-3 py-1">
										<h2 class="mb-0"><a href="#">Fruits</a></h2>
									</div>
								</div>
								<div class="category-wrap ftco-animate img d-flex align-items-end" style="background-image: url(${urlImage}category-2.jpg);">
									<div class="text px-3 py-1">
										<h2 class="mb-0"><a href="#">Vegetables</a></h2>
									</div>
								</div>
							</div>
						</div>
					</div>

					<div class="col-md-4">
						<div class="category-wrap ftco-animate img mb-4 d-flex align-items-end" style="background-image: url(${urlImage}category-3.jpg);">
							<div class="text px-3 py-1">
								<h2 class="mb-0"><a href="#">Juices</a></h2>
							</div>		
						</div>
						<div class="category-wrap ftco-animate img d-flex align-items-end" style="background-image: url(${urlImage}category-4.jpg);">
							<div class="text px-3 py-1">
								<h2 class="mb-0"><a href="#">Dried</a></h2>
							</div>
						</div>
					</div>
				</div>
			</div>
		</section>

    <section class="ftco-section">
    	<div class="container">
				<div class="row justify-content-center mb-3 pb-3">
          <div class="col-md-12 heading-section text-center ftco-animate">
          	<span class="subheading">S???n ph???m m???i</span>
            <h2 class="mb-4">S???n ph???m</h2>
            <p>Tr???i nghi???m c???a kh??ch h??ng lu??n lu??n ?????t l??n h??ng ?????u t???i Organic Fruit</p>
          </div>
        </div>   		
    	</div>
    	<div class="container">
    		<div class="row">
    			<c:forEach items="${listP}" var="o"  >
    			<div class="col-md-6 col-lg-3 ftco-animate d-flex align-items-stretch">
    				<div class="product">
    					<a href="#" class="img-prod"><img class="img-fluid" src="${o.productImage }" alt="Colorlib Template">
    						
    						<div class="overlay"></div>
    					</a>
    					<div class=" text py-3 pb-4 px-3  text-center justify-content-end">
    						<h3><a href="#">${o.productName}</a></h3>
    						<div class="d-flex ">
    							<div class="pricing">
		    						<p class="price"><span class="price-sale">${o.price } VN??</span></p>
		    					</div>
	    					</div>
	    					<div class="bottom-area d-flex px-3">
	    						<div class="m-auto d-flex">
	    							<a href="product_detail?pid=${o.productId }" class="add-to-cart d-flex justify-content-center align-items-center text-center">
	    								<span><i class="ion-ios-eye"></i></span>
	    							</a>
	    							<a href="add_to_cart?productId=${o.productId }&quantity=1" class="buy-now d-flex justify-content-center align-items-center mx-1">
	    								<span><i class="ion-ios-cart"></i></span>
	    							</a>
	    							<a href="#" class="heart d-flex justify-content-center align-items-center ">
	    								<span><i class="ion-ios-heart"></i></span>
	    							</a>
    							</div>
    						</div>
    					</div>
    				</div>
    			</div>
    			</c:forEach>
    			
    			</div>
    			


    			
    	</div>
    </section>
		
		<section class="ftco-section img" style="background-image: url(${urlImage}bg_3.jpg);">
    	<div class="container">
				<div class="row justify-content-end">
          <div class="col-md-6 heading-section ftco-animate deal-of-the-day ftco-animate">
          	<span class="subheading">Gi?? t???t nh???t cho b???n</span>
            <h2 class="mb-4">Best Sale</h2>
            <p>Tr???i nghi???m c???a kh??ch h??ng lu??n lu??n ?????t l??n h??ng ?????u t???i Organic Fruit</p>
            <h3><a href="#">Rau X?? l??ch</a></h3>
            <span class="price">38000 VN?? <a href="#">ch??? c??n 19000 VN??</a></span>
            <div id="timer" class="d-flex mt-5">
						  
						  <div class="time pl-3" id="hours"></div>
						  <div class="time pl-3" id="minutes"></div>
						  <div class="time pl-3" id="seconds"></div>
						</div>
          </div>
        </div>   		
    	</div>
    </section>

    <section class="ftco-section testimony-section">
      <div class="container">
        <div class="row justify-content-center mb-5 pb-3">
          <div class="col-md-7 heading-section ftco-animate text-center">
          	<span class="subheading">Ph???n h???i</span>
            <h2 class="mb-4">Ph???n h???i c???a kh??ch h??ng</h2>
            <p>Tr???i nghi???m c???a kh??ch h??ng lu??n lu??n ?????t l??n h??ng ?????u t???i Organic Fruit</p>
          </div>
        </div>
        <div class="row ftco-animate">
          <div class="col-md-12">
            <div class="carousel-testimony owl-carousel">
              <div class="item">
                <div class="testimony-wrap p-4 pb-5">
                  <div class="user-img mb-5" style="background-image: url(${urlImage}person_1.jpg)">
                    <span class="quote d-flex align-items-center justify-content-center">
                      <i class="icon-quote-left"></i>
                    </span>
                  </div>
                  <div class="text text-center">
                    <p class="mb-5 pl-4 line">S???n ph???m ???n ??p trong t???m gi?? nh?? v???y, kh??ng th??? ????i h???i ???????c g?? h??n n???a, qu?? tuy???t v???i ???</p>
                    <p class="name">Ng???c Ho??i</p>
                    
                  </div>
                </div>
              </div>
              <div class="item">
                <div class="testimony-wrap p-4 pb-5">
                  <div class="user-img mb-5" style="background-image: url(${urlImage}person_2.jpg)">
                    <span class="quote d-flex align-items-center justify-content-center">
                      <i class="icon-quote-left"></i>
                    </span>
                  </div>
                  <div class="text text-center">
                    <p class="mb-5 pl-4 line">S???n ph???m ???????c c??i ch???t l?????ng t???t v?? gi?? r???, ngo??i ra kh??ng c??n g?? kh??c</p>
                    <p class="name">Xu??n B??ch</p>
                    
                  </div>
                </div>
              </div>
              <div class="item">
                <div class="testimony-wrap p-4 pb-5">
                  <div class="user-img mb-5" style="background-image: url(${urlImage}person_3.jpg)">
                    <span class="quote d-flex align-items-center justify-content-center">
                      <i class="icon-quote-left"></i>
                    </span>
                  </div>
                  <div class="text text-center">
                    <p class="mb-5 pl-4 line">M??nh l?? ng?????i kh?? k??? t??nh trong vi???c mua h??ng, m?? shop n??y l???i l??m m??nh vui v??? khi mua h??ng th?? l?? m???t th??nh c??ng l???n c???a shop n??y r???i ?????y</p>
                    <p class="name">Kh???c T?????ng</p>
                    
                  </div>
                </div>
              </div>
              <div class="item">
                <div class="testimony-wrap p-4 pb-5">
                  <div class="user-img mb-5" style="background-image: url(${urlImage}person_1.jpg)">
                    <span class="quote d-flex align-items-center justify-content-center">
                      <i class="icon-quote-left"></i>
                    </span>
                  </div>
                  <div class="text text-center">
                    <p class="mb-5 pl-4 line">Rau t????i s???ch, r???t uy t??n v?? an t??m ???</p>
                    <p class="name">Ho??ng L????ng</p>
                    
                  </div>
                </div>
              </div>
              <div class="item">
                <div class="testimony-wrap p-4 pb-5">
                  <div class="user-img mb-5" style="background-image: url(${urlImage}person_1.jpg)">
                    <span class="quote d-flex align-items-center justify-content-center">
                      <i class="icon-quote-left"></i>
                    </span>
                  </div>
                  <div class="text text-center">
                    <p class="mb-5 pl-4 line">D???ch v??? ch??m s??c kh??ch h??ng ??? shop n??y r???t t???t lu??n m???i ng?????i ???, s???n ph???m l???i c??n ???n ??p n???a ch???</p>
                    <p class="name">T???n ?????t</p>
                    
                  </div>
                </div>
              </div>
            </div>
          </div>
        </div>
      </div>
    </section>

    <hr>

		

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
<jsp:include page="/views/customers/commons/footer.jsp"></jsp:include>

</body>
</html>