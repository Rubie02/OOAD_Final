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
	<script src="https://kit.fontawesome.com/342ad22942.js" crossorigin="anonymous"></script>
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
                    <li class="nav-item active dropdown">
                        <a class="nav-link dropdown-toggle" href="Shop" id="dropdown04" data-toggle="dropdown"
                            aria-haspopup="true" aria-expanded="false">Mua h??ng</a>
                        <div class="dropdown-menu" aria-labelledby="dropdown04">
                            <a class="dropdown-item" href="Shop">S???n ph???m</a>
                            <a class="dropdown-item" href="Cart">Gi??? h??ng</a>
                            <a class="dropdown-item" href="otod">Thanh to??n</a>
                        </div>
                    </li>
                    <li class="nav-item"><a href="About" class="nav-link">V??? ch??ng t??i</a></li>
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
          	<p class="breadcrumbs"><span class="mr-2"><a href="Home">Home</a></span> <span>Mua h??ng</span></p>
            <h1 class="mb-0 bread">Mua h??ng </h1>
          </div>
        </div>
      </div>
    </div>

    <section class="ftco-section ftco-cart">
			<div class="container">
				<div class="row">
    			<div class="col-md-12 ftco-animate">
    				<div class="cart-list">
	    				<table class="table">
						    <thead class="thead-primary">
						      <tr class="text-center">
						        <th>&nbsp;</th>
						        <th>&nbsp;</th>
						        <th>T??n s???n ph???m</th>
						        <th>Gi??</th>
						        <th>S??? l?????ng</th>
						        <th>T???ng ti???n</th>
						      </tr>
						    </thead>
						    <tbody>
						    <c:forEach items="${sessionScope.cart }" var="map">
						      <tr class="text-center">
						        <td class="product-remove"><a href="remove_from_cart?productId=${ map.value.product.productId}"><span class="ion-ios-close"></span></a></td>
						        
						        <td class="image-prod"><div class="img" style="background-image:url(${map.value.product.productImage });"></div></td>
						        
						        <td class="product-name">
						        	<h3>${map.value.product.productName }</h3>
						        	
						        </td>
						        
						        <td class="price">${map.value.product.price }</td>
						        
						        <td class="quantity">
						        	<div class="input-group mb-3">
						        	<a class="btn btn-sm btn decre"  href="quantity_inc_dec?action=dec&id=${map.value.product.productId }"><i class="fas fa-minus-square"></i></a>
					             	<input type="text" name="quantity" class="quantity form-control input-number" value="${map.value.quantity }" min="1" max="100">
					          		<a class="btn btn-sm btn incre" href="quantity_inc_dec?action=inc&id=${map.value.product.productId }"><i class="fas fa-plus-square"></i></a>
					          	</div>
					          </td>
						        
						        <td class="total">${map.value.product.price*map.value.quantity }</td>
						      </tr><!-- END TR-->

						      </c:forEach>
						    </tbody>
						  </table>
					  </div>
    			</div>
    		</div>
    		<div class="row justify-content-end">
    			<div class="col-lg-4 mt-5 cart-wrap ftco-animate">
    				<div class="cart-total mb-3">
    					<h3>Ki???m tra th??ng tin</h3>
    					
  						<form action="order_list" method="post" class="info">
			              <div class="form-group">
			              	<label for="">H??? v?? t??n</label>
			                <input type="text" name="cusName" value="${cus.cusName }" class="form-control text-left px-3" placeholder="">
			              </div>
			              <div class="form-group">
			              	<label for="">?????a ch???</label>
			                <input type="text" name="cusAddress" value="${cus.cusAddress }" class="form-control text-left px-3" placeholder="">
			              </div>
			              <div class="form-group">
			              	<label for="">S??? ??i???n tho???i</label>
			                <input type="text" name="cusPhoneNumber" value="${cus.cusPhoneNumber }" class="form-control text-left px-3" placeholder="">
			              </div>
			              <div class="form-group">
			              	<label for="">Username</label>
			                <input type="text" name="username" value="${sessionScope.acc.username }" class="form-control text-left px-3" placeholder="">
			              </div>
			              <p><a href="ordered_list_after" class="btn btn-primary py-3 px-4">Mua h??ng</a></p>
	            		</form>
    				</div>
    				
    			</div>
    			
    			<div class="col-lg-4 mt-5 cart-wrap ftco-animate">
    				<div class="cart-total mb-3">
    					<h3>T???ng ti???n</h3>
    					<p class="d-flex">
    						<span>T???ng</span>
    						<c:set var="total" value="${0 }"/>   
                            <c:forEach items="${sessionScope.cart }" var="map">
                            	<c:set var="total" value="${total+map.value.quantity*map.value.product.price }"/>
                            	</c:forEach> 
    						<span>${total } VN??</span>
    					</p>
    					<p class="d-flex">
    						<span>Ph?? v???n chuy???n</span>
    						<span>0 VN??</span>
    					</p>
    					<p class="d-flex">
    						<span>Gi???m gi??</span>
    						<span>0 VN??</span>
    					</p>
    					<hr>
    					<p class="d-flex total-price">
    						<span>T???ng c???ng</span>
    						<span>${total } VN??</span>
    					</p>
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
<jsp:include page="/views/customers/commons/footer.jsp"></jsp:include>
</body>
</html>