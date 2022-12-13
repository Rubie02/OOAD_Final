<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<div class="col-sm-3">
	<div class="card bg-light mb-3">
		<div class="card-header bg-primary text-white text-uppercase">
			<i class="fa fa-list"></i> Categories
		</div>
		<ul class="list-group category_block">
			<c:forEach items="${listC}" var="o">
				<li class="list-group-item text-white ${tag == o.cateId ? "active":"" }"><a
					href="category?cid=${o.cateId }">${o.cateName}</a></li>
			</c:forEach>

		</ul>
	</div>
	<div class="card bg-light mb-3">
		<div class="card-header bg-success text-white text-uppercase">New product</div>
		<div class="card-body">
			<img class="img-fluid" src="${p.productImage}" />
			<h5 class="card-title">${p.productName}</h5>
			<p class="card-text">${p.information}</p>
			<p class="bloc_left_price">${p.price} VND</p>
		</div>
	</div>
</div>