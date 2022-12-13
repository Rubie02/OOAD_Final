<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<c:url value="/css/" var="url"></c:url>
<!--begin of menu-->
<head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Home</title>
        <link href="//maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css">
        <script src="//maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js"></script>
        <script src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
        <!------ Include the above in your HEAD tag ---------->
        <link href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css" rel="stylesheet" integrity="sha384-wvfXpqpZZVQGK6TAh5PVlGOfQNHSoD2xbE+QkPxCAFlNEevoEH3Sl0sibVcOQVnN" crossorigin="anonymous">
        <link href="${url }style.css" rel="stylesheet" type="text/css"/>
    </head>
    <header>
<nav class="navbar navbar-expand-md navbar-dark bg-dark">
    <div class="container">
        <a class="navbar-brand" href="home">ORGANIC FRUIT</a>
        <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarsExampleDefault" aria-controls="navbarsExampleDefault" aria-expanded="false" aria-label="Toggle navigation">
            <span class="navbar-toggler-icon"></span>
        </button>

        <div class="collapse navbar-collapse justify-content-end" id="navbarsExampleDefault">
            <ul class="navbar-nav m-auto">
            	<c:if test="${sessionScope.acc.type == 1 }">
                <li class="nav-item">
                    <a class="nav-link" href="manage_blog">Manager Blog</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link" href="manage_product">Manager Product</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link" href="manage_account">Manager Account</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link" href="reviewblog_list">Manager ReviewBlog</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link" href="review_list">Manager ReviewProduct</a>
                </li>

                </c:if>
                <c:if test="${sessionScope.acc != null}">
                <li class="nav-item">
                    <a class="nav-link" href="#">Hello ${sessionScope.acc.username}</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link" href="blog">Blog</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link" href="logout">Logout</a>
                </li>
                </c:if>
                <c:if test="${sessionScope.acc == null}">
                <li class="nav-item">
                    <a class="nav-link" href="blog">Blog</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link" href="login">Login</a>
                </li>
                </c:if>
            </ul>

            <form action="search" method="post" class="form-inline my-2 my-lg-0">
                <div class="input-group input-group-sm">
                    <input value="${txtS}" name="txt" type="text" class="form-control" aria-label="Small" aria-describedby="inputGroup-sizing-sm" placeholder="Search...">
                    <div class="input-group-append">
                        <button type="submit" class="btn btn-secondary btn-number">
                            <i class="fa fa-search"></i>
                        </button>
                    </div>
                </div>
                
            </form>
        </div>
    </div>
</nav>
<section class="jumbotron text-center">
    <div class="container">
        <h1 class="jumbotron-heading">ORGANIC FRUIT</h1>
        <p class="lead text-muted mb-0">VÌ SỨC KHỎE MỌI NHÀ</p>
    </div>
</section>
</header>
<!--end of menu-->
