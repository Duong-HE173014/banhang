<%-- 
    Document   : SalerOrderEdit
    Created on : Mar 10, 2024, 3:10:47 AM
    Author     : Admin
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.util.Vector" %>
<%@page import="java.sql.ResultSet" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
         <link href="//cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-T3c6CoIi6uLrA9TneNEoa7RxnatzjcDSCmG1MXxSR1GAsXEV/Dwwykc2MPK8M2HN" crossorigin="anonymous">
        <script src="//cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-C6RzsynM9kWDrMNeT87bh95OGNyZPhcTNXj1NW7RuBCsyN/o0jlpcV8Qyq46cDfL" crossorigin="anonymous"></script>
        <link href="//cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.4/css/all.min.css" rel="stylesheet">
        <script src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
        <style>
            .small-container {
    max-width: 300px; /* Đặt kích thước tối đa cho container */
    margin: 0 auto; /* Căn giữa container */
}
</style>
    </head>
 <body>
    <jsp:include page="Menu.jsp"></jsp:include> 
    <%
        ResultSet detail = (ResultSet) request.getAttribute("detail");  
        if (detail != null && detail.next()) {
    %>
    <section class="home-section">
        <div class="container small-container"> 
        <div class="modal-header">
            <h5 class="modal-title" id="productModalLabel">Order Information</h5>
            <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                <span aria-hidden="true">&times;</span>
            </button>
        </div>
        <div class="modal-body">
            <div class="form-group mb-3"> <!-- Thêm class mb-3 để tạo khoảng cách dưới của phần tử -->
                <label class="mb-1">Order ID</label> <!-- Thêm class mb-1 để tạo khoảng cách dưới của nhãn -->
                <input value="<%=detail.getInt(1)%>" name="id" type="text" class="form-control form-control-sm" readonly required>
            </div>
            <label class="mb-2">Detail</label> <!-- Thêm class mb-2 để tạo khoảng cách dưới của nhãn -->
            <div class="table-responsive">
                <table class="table table-sm"> <!-- Thêm class table-sm để làm cho bảng nhỏ hơn -->
                    <thead>
                        <tr>
                            <th scope="col" class="border-0 bg-light">
                                <div class="py-1 text-uppercase">Product</div> <!-- Thêm class py-1 để tạo khoảng cách dưới của phần tử -->
                            </th>
                            <th scope="col" class="border-0 bg-light">
                                <div class="py-1 text-uppercase">Receiver Name</div> <!-- Thêm class py-1 để tạo khoảng cách dưới của phần tử -->
                            </th>
                        </tr>
                    </thead>
                    <tbody>
                        <tr>
                            <td class="align-middle"><strong><%=detail.getString(10)%></strong></td>
                            <td class="align-middle"><strong><%=detail.getString(5)%></strong></td>
                        </tr>
                        <!-- Add additional rows for other order details if needed -->
                    </tbody>
                </table>
            </div>
            <div class="form-group mb-3"> <!-- Thêm class mb-3 để tạo khoảng cách dưới của phần tử -->
                <label class="mb-1">Order Date</label> <!-- Thêm class mb-1 để tạo khoảng cách dưới của nhãn -->
                <textarea name="date" class="form-control form-control-sm" readonly required><%=detail.getString(2)%></textarea>
            </div>
            <div class="form-group mb-3"> <!-- Thêm class mb-3 để tạo khoảng cách dưới của phần tử -->
                <label class="mb-1">Total Cost</label> <!-- Thêm class mb-1 để tạo khoảng cách dưới của nhãn -->
                <textarea name="total" class="form-control form-control-sm" readonly required><%=detail.getString(3)%> $</textarea>
            </div>
            <div class="form-group mb-3"> <!-- Thêm class mb-3 để tạo khoảng cách dưới của phần tử -->
                <label class="mb-1">Status</label> <!-- Thêm class mb-1 để tạo khoảng cách dưới của nhãn -->
                <select name="status" class="form-select form-select-sm"> <!-- Thêm class form-select-sm để làm cho dropdown nhỏ hơn -->
                    <option value="Pending" <%=detail.getString(4).equals("Pending") ? "selected" : ""%>>Pending</option>
                    <option value="Shipped" <%=detail.getString(4).equals("Shipped") ? "selected" : ""%>>Shipped</option>
                    <option value="Delivered" <%=detail.getString(4).equals("Delivered") ? "selected" : ""%>>Delivered</option>
                </select>
            </div>
        </div>
        <div class="modal-footer">
            <button type="submit" name="submit" class="btn btn-sm btn-success">Edit</button> <!-- Thêm class btn-sm để làm cho nút nhỏ hơn -->
        </div>
        </div>
    </section>
    <%
        } 
    %>
   
</body>

</html>
