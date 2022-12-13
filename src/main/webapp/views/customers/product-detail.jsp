<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html; charset=UTF-8" %>

<c:url value="/views/customers/css/" var="url"></c:url>
<c:url value="/views/customers/images/" var="urlImage"></c:url>
<c:url value="/views/customers/js/" var="urljs"></c:url>
<!DOCTYPE html>
<html>
<head>
	<title>Shop</title>
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
                            <a class="dropdown-item active" href="Shop">Sản phẩm</a>
                            <a class="dropdown-item" href="Cart">Giỏ hàng</a>
                            <a class="dropdown-item" href="otod">Thanh toán</a>
                        </div>
                    </li>
                    <li class="nav-item"><a href="About" class="nav-link">Về chúng tôi</a></li>
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
<div class="hero-wrap hero-bread" style="background-image: url('${urlImage}bg_1.jpg');">
      <div class="container">
        <div class="row no-gutters slider-text align-items-center justify-content-center">
          <div class="col-md-9 ftco-animate text-center">
          	<p class="breadcrumbs"><span class="mr-2"><a href="Home">Home</a></span> <span class="mr-2"><a href="Shop">Sản phẩm</a></span> <span>Chi tiết sản phẩm</span></p>
            <h1 class="mb-0 bread">Chi tiết sản phẩm</h1>
          </div>
        </div>
      </div>
    </div>

    <section class="ftco-section">
    	<div class="container">
    		<div class="row">
    			<div class="col-lg-6 mb-5 ftco-animate">
    				<a href="${detail.productImage }" class="image-popup"><img src="${detail.productImage }" class="img-fluid" alt="Colorlib Template"></a>
				<div class="pt-5 mt-5">
					<h3 class="mb-5">Đánh giá sản phẩm</h3>
					<c:forEach items="${reviewbyid}" var="review">
					<ul class="comment-list">
						<li class="comment">
				
							<div class="comment-body">
								<h3>${review.name}</h3>
								<div class="aa-product-rating" style="color:orange">
                                                <span class="fa fa-star"></span>
                                                <span class="fa fa-star"></span>
                                                <span class="fa fa-star"></span>
                                                <span class="fa fa-star"></span>
                                                <span class="fa fa-star"></span>
                                            </div>
								<div class="meta">${review.created}</div>
								<p>${review.content}</p>
				
							</div>
						</li>
				
				
					</ul>
					</c:forEach>
					<!-- END comment-list -->
				
					<div class="comment-form-wrap pt-5">
						<h3 class="mb-5">Thêm bình luận</h3>
						<form method="post" action="${pageContext.request.contextPath}/Review?pid=${detail.productId }" class="p-5 bg-light">
							<div class="form-group">
								<label for="name">Họ và tên *</label>
								<input type="text" class="form-control" id="name" name="name">
							</div>
							<div class="form-group">
								<label for="email">Email *</label>
								<input type="email" class="form-control" id="email" name="email">
							</div>
							
				
							<div class="form-group">
								<label for="message">Bình luận</label>
								<textarea name="content" id="message" cols="30" rows="10" class="form-control"></textarea>
							</div>
							<div class="form-group">
								<input type="submit" value="Đăng tải" class="btn py-3 px-4 btn-primary">
							</div>
				
						</form>
					</div>
				</div>
				</div>
				
    			<div class="col-lg-6 product-details pl-md-5 ftco-animate">
    				<h3>${detail.productName }</h3>
    				
    				<p class="price"><span>${detail.price } VNĐ</span></p>
    				<p>${detail.information }
					</p>
					<p><a href="add_to_cart?productId=${detail.productId }&quantity=1" class="btn btn-black py-3 px-5">Thêm vào giỏ hàng</a></p>
				</div>		
          	</div>
    			</div>
    		
		
    </section>

    <section class="ftco-section">
    	<div class="container">
				<div class="row justify-content-center mb-3 pb-3">
          <div class="col-md-12 heading-section text-center ftco-animate">
          	<span class="subheading">Sản phẩm</span>
            <h2 class="mb-4">Sản phẩm bán chạy</h2>
            
          </div>
        </div>   		
    	</div>
    	<div class="container">
    		<div class="row">   			
    			<c:forEach items="${listP}" var="o">
    			<div class="col-md-6 col-lg-3 ftco-animate">
    				<div class="product">
    					<a href="#" class="img-prod"><img class="img-fluid" src="${o.productImage }" alt="Colorlib Template">
    						<div class="overlay"></div>
    					</a>
    					<div class="text py-3 pb-4 px-3 text-center">
    						<h3><a href="#">${o.productName }</a></h3>
    						<div class="d-flex">
    							<div class="pricing">
		    						<p class="price"><span>${o.price }</span></p>
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