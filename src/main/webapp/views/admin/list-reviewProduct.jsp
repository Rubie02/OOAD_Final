<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:url value="/css/" var="url"></c:url>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
    <link rel="stylesheet" href="https://cdn.datatables.net/1.10.14/css/jquery.dataTables.min.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.css">
    <link
        href="https://fonts.googleapis.com/css2?family=Raleway:ital,wght@0,300;0,400;0,500;0,600;0,700;1,800&display=swap"
        rel="stylesheet">
    <link href="${url }list.css" rel="stylesheet" type="text/css" />
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/sweetalert2@11.6.10/dist/sweetalert2.min.css">
    <script src="https://cdn.jsdelivr.net/npm/sweetalert2@11.6.10/dist/sweetalert2.min.js"></script>
    <script type="text/javascript">
    	function testDialogConfirm(id){
    		Swal.fire({
    			  title: 'Bạn có chắc chắn muốn xóa không?',
    			  
    			  icon: 'warning',
    			  showCancelButton: true,
    			  confirmButtonColor: '#3085d6',
    			  cancelButtonColor: '#d33',
    			  confirmButtonText: 'Yes!'
    			}).then((result) => {
    			  if (result.isConfirmed) {
    				window.location.href="delete_review?id=" + id;
    			    Swal.fire(
    			      'Review đã bị xóa',
    			      '',
    			      'success'
    			    )
    			  }
    			})
    	}
    </script>
    <title>Danh sách review</title>
</head>

<body>
	<jsp:include page="/views/admin/menu.jsp"></jsp:include>
    <div class="container p-30">
        <div class="row">
            <div class="col-md-12 main-datatable">
                <div class="card_body">
                    <div class="row d-flex">
                        <div class="col-sm-4 createSegment">
                            <a class="btn dim_button create_new" href="#"> <span class="glyphicon glyphicon-plus"></span> Tạo mới</a>
                        </div>
                        <div class="col-sm-8 add_flex">
                            <div class="form-group searchInput">
                                <label for="email">Search:</label>
                                <input type="search" class="form-control" onkeyup="myFunction()" id="filterbox" placeholder="Nội dung ">
                            </div>
                        </div>
                    </div>
                    <div class="overflow-x">
                        <table style="width:100%;" id="filtertable" class="table cust-datatable dataTable no-footer">
                            <thead>
                                <tr>
                                    <th style="min-width:50px;">Tên</th>
                                    <th style="min-width:150px;">ID Sản phẩm</th>
                                    <th style="min-width:150px;">Email</th>
                                    <th style="min-width:150px;">Nội dung</th>
                                    <th style="min-width:150px;">Thời gian</th>
                                    <th style="min-width:150px;">Action</th>
                                </tr>
                            </thead>
                            <tbody>
                            <c:forEach items="${reviewlist}" var="p">
                                <tr>
                                    <td><c:out value="${p.name}"></c:out></td>
                                    <td><c:out value="${p.product_id}"></c:out></td>
                                    <td><c:out value="${p.email}"></c:out></td>
                                    <td><c:out value="${p.content}"></c:out></td>
                                    <td><c:out value="${p.created}"></c:out></td>
                                    
                                    <td>
                                        
                                        <div class="btn-group">
                                            <a class="dropdown-toggle dropdown_icon" data-toggle="dropdown">
                                                <i class="fa fa-ellipsis-h"></i>
                                            </a>
                                            <ul class="dropdown-menu dropdown_more">
                                                
                                                <li>
                                                    <a href="#" onclick="testDialogConfirm(${p.id})" target="_self">
                                                        <i class="fa fa-trash"></i> Delete
                                                    </a>
                                                </li>
                                                
                                            </ul>
                                        </div>
                                    </td>
                                </tr>
                                
                                </c:forEach>
                            </tbody>
                        </table>
                        
                    </div>
                </div>
            </div>
        </div>
    </div>


    <script src="https://code.jquery.com/jquery-3.2.1.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
    <script src="https://cdn.datatables.net/1.10.14/js/jquery.dataTables.min.js"></script>
    <script >
    
        function myFunction() {
                
                var input, filter, table, tr, td, i, txtValue;
                input = document.getElementById("filterbox");
                filter = input.value.toUpperCase();
                table = document.getElementById("filtertable");
                tr = table.getElementsByTagName("tr");

                
                for (i = 0; i < tr.length; i++) {
                    td = tr[i].getElementsByTagName("td")[3];
                    if (td) {
                        txtValue = td.textContent || td.innerText;
                        if (txtValue.toUpperCase().indexOf(filter) > -1) {
                            tr[i].style.display = "";
                        } else {
                            tr[i].style.display = "none";
                        }
                    }
                }
                
                
            }
    </script>
    
    
    <jsp:include page="/views/admin/footers.jsp"></jsp:include>
</body>

</html>