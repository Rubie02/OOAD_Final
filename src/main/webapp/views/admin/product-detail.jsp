<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<c:url value="/css/" var="url"></c:url>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Product</title>
<link
	href="//maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css"
	rel="stylesheet" id="bootstrap-css">
<script
	src="//maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js"></script>
<script
	src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<link href="${url }style.css" rel="stylesheet" type="text/css" />
<style>
.gallery-wrap .img-big-wrap img {
	height: 450px;
	width: auto;
	display: inline-block;
	cursor: zoom-in;
}

.gallery-wrap .img-small-wrap .item-gallery {
	width: 60px;
	height: 60px;
	border: 1px solid #ddd;
	margin: 7px 2px;
	display: inline-block;
	overflow: hidden;
}

.gallery-wrap .img-small-wrap {
	text-align: center;
}

.gallery-wrap .img-small-wrap img {
	max-width: 100%;
	max-height: 100%;
	object-fit: cover;
	border-radius: 4px;
	cursor: zoom-in;
}

.img-big-wrap img {
	width: 100% !important;
	height: auto !important;
}
</style>
</head>
<body>
	<jsp:include page="/views/admin/menu.jsp"></jsp:include>
	<div class="container">
		<div class="row">
			<jsp:include page="/views/admin/left.jsp"></jsp:include>
			<div class="col-sm-9">
				<div class="container">
					<div class="card">
						<div class="row">
							<aside class="col-sm-5 border-right">
								<article class="gallery-wrap">
									<div class="img-big-wrap">
										<div>
											<a href="#"><img src="${detail.productImage}"></a>
										</div>
									</div>
									<!-- slider-product.// -->
									<div class="img-small-wrap"></div>
									<!-- slider-nav.// -->
								</article>
								<!-- gallery-wrap .end// -->
							</aside>
							<aside class="col-sm-7">
								<article class="card-body p-5">
									<h3 class="title mb-3">${detail.productName}</h3>

									<p class="price-detail-wrap">
										<span class="price h3 text-warning"> <span
											class="currency"></span><span class="num">${detail.price} VND</span>
										</span>
										<!--<span>/per kg</span>-->
									</p>
									<!-- price-detail-wrap .// -->
									<dl class="item-property">
										<dt>Description</dt>
										<dd>
											<p>${detail.information}</p>
										</dd>
									</dl>
									<!--                                        <dl class="param param-feature">
                                            <dt>Model#</dt>
                                            <dd>12345611</dd>
                                        </dl>   item-property-hor .// 
                                        <dl class="param param-feature">
                                            <dt>Color</dt>
                                            <dd>Black and white</dd>
                                        </dl>   item-property-hor .// 
                                        <dl class="param param-feature">
                                            <dt>Delivery</dt>
                                            <dd>Russia, USA, and Europe</dd>
                                        </dl>   item-property-hor .// -->

									<hr>
									<div class="row">
										<div class="col-sm-5">
											<dl class="param param-inline">
												<dt>Quantity:</dt>
												<dd>
													<input type="text" class="form-control" required>
												</dd>
											</dl>
											<!-- item-property .// -->
										</div>
										<!-- col.// -->

									</div>
									<!-- row.// -->
									<hr>
									<a href="#" class="btn btn-lg btn-primary text-uppercase">
										Buy now </a> <a href="#"
										class="btn btn-lg btn-outline-primary text-uppercase"> <i
										class="fas fa-shopping-cart"></i> Add to cart
									</a>
								</article>
								<!-- card-body.// -->
							</aside>
							<!-- col.// -->
						</div>
						<!-- row.// -->
					</div>
					<!-- card.// -->


				</div>
			</div>
		</div>
	</div>
	<!-- Footer -->
	<jsp:include page="/views/admin/footers.jsp"></jsp:include>]
</body>
</html>