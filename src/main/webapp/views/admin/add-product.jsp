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
  
  <title>Add Product</title>
  
  

</head>
<body>
<input type="hidden" id="status" value="<%= request.getAttribute("status")%>">
   <div class="login">

        <h1 class="text-center">Thêm sản phẩm mới</h1>
        
        <form class="needs-validation" method="post" action="${pageContext.request.contextPath }/add_product">
            <div class="form-group was-validated">
                <label class="form-label">Tên sản phẩm</label>
                <input class="form-control" name="productName"  type="text"  required>
                
            </div>
            <div class="form-group was-validated">
                <label class="form-label">ID Nhà cung cấp</label>
                <input class="form-control" name="supId" type="text"  required>
                
            </div>
            <div class="form-group was-validated">
                <label class="form-label">ID Category (1 - Rau củ, 2 - Trái cây, 3 - Rau lá)</label>
                <input class="form-control" name="cateId"  type="text"  required>
                
            </div>
            <div class="form-group was-validated">
                <label class="form-label">Giá</label>
                <input class="form-control" name="price"  type="text"  required>
                
            </div>
            <div class="form-group was-validated">
                <label class="form-label">Ngày sản xuất</label>
                <input class="form-control" name="mgf"  type="date"  required>
                
            </div>
            <div class="form-group was-validated">
                <label class="form-label">Hạn sử dụng</label>
                <input class="form-control" name="exp"  type="date"  required>
                
            </div>
            <div class="form-group was-validated">
                <label class="form-label">Hình ảnh</label>
                <input class="form-control" name="productImage"  type="text"  required>
                
            </div>
            <div class="form-group was-validated">
                <label class="form-label">Mô tả</label>
                <textarea class="form-control" name="information"  type="text"  required></textarea>
                
            </div>
            
            <input class="btn-submit" type="submit" value="Submit">
            <input class="btn-submit" type="button" onclick="location.href='${pageContext.request.contextPath}/manage_product';" value="Exit">
            
        </form>

    </div>
    <script type="text/javascript">
		var status = document.getElementById("status").value;
		if(status == "success"){
			swal("Xin chúc mừng!","Thêm sản phẩm thành công ", "success");
		}
		else if(status == "invalidCateId"){
			swal("Oops!!","Không tồn tại Category này","error");
		}
		else if(status == "invalidInput"){
			swal("Oops!!","Thông tin không họp lệ","error")
		}
		
	</script>
    
</body>
</html>