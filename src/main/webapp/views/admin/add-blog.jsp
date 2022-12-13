<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:url value="/css/" var="url"></c:url>
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <!-- Bootstrap -->
  <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet">
  <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"></script>
  <!-- CSS -->
  <link href="${url }edit.css" rel="stylesheet" type="text/css" />
  <!-- JS -->
  <script src="vendor/jquery/jquery.min.js"></script>
  <script src="js/main.js"></script>
  <script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
  <link rel="stylesheet" href="alert/dist/sweetalert.css">
  
  <title>Add Blog</title>
  
  

</head>
<body>
<input type="hidden" id="status" value="<%= request.getAttribute("status")%>">
   <div class="login">

        <h1 class="text-center">Thêm bài viết mới</h1>
        
        <form class="needs-validation" method="post" action="${pageContext.request.contextPath }/add_blog">
            <div class="form-group was-validated">
                <label class="form-label">Tên bài viết</label>
                <input class="form-control" name="name"  type="text"  required>
                
            </div>
            <div class="form-group was-validated">
                <label class="form-label">Hình ảnh</label>
                <input class="form-control" name="image" type="text"  required>
                
            </div>
            <div class="form-group was-validated">
                <label class="form-label">Nội dung</label>
                <input class="form-control" name="details"  type="text"  required>
                
            </div>
            
            
            <input class="btn-submit" type="submit" value="Submit">
            <input class="btn-submit" type="button" onclick="location.href='${pageContext.request.contextPath}/manage_blog';" value="Exit">
            
        </form>

    </div>
    <script type="text/javascript">
		var status = document.getElementById("status").value;
		if(status == "success"){
			swal("Xin chúc mừng!","Thêm bài viết thành công ", "success");
		}
		
	</script>
    
</body>
</html>