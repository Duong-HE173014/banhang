<%-- 
    Document   : CartCompletion
    Created on : Feb 22, 2024, 11:13:16 AM
    Author     : pc
--%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.util.Vector" %>
<%@page import="entity.Product" %>
<%@page import="entity.Category" %>
<%@page import="entity.User"%>
<%@page import="entity.Cart"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <%  
            int i = 0;
            User user = (User) session.getAttribute("user");
            String userRole = (String) session.getAttribute("role");
            Vector<Product> listP =(Vector<Product>)request.getAttribute("listP");
            Vector<Category> listC =(Vector<Category>)request.getAttribute("listC");
            Product last = (Product)request.getAttribute("p");
            int tag = 0; // Default value
            Object tagObject = request.getAttribute("tag");
            if (tagObject != null && tagObject instanceof Integer) {
                tag = (Integer) tagObject;
            }
            Object value = request.getAttribute("txtS");
            String txtS;
                if(value==null){
                txtS="";
            }else txtS = (String)request.getAttribute("txtS");
        %>
        <jsp:include page="Header.jsp"></jsp:include>
            <!--end of menu-->
            <div class="row">

                <div class="col-sm-3">
                    <div class="card bg-light mb-2">
                        <div class="card-header bg-dark text-white text-uppercase"><i class="fa fa-list"></i> Categories</div>
                        <ul class="list-group category_block">
                        <c:forEach var="category" items="${categoryList}">
                            <li class="list-group-item text-white>"><a class="text-decoration-none" href="category?categoryId=${category.categoryId}">${category.categoryName}</a></li>
                            </c:forEach>
                    </ul>
                </div>   
                <div class="card bg-light mb-3">
                    <div class="card-header bg-dark text-white text-uppercase">Last product</div>
                    <div class="card-body">
                        <img class="img-fluid" src="${product.image}" />
                        <a class="nav-link" href="detail?pid=${product.productID}"> <h5 class="card-title">${product.title}</h5></a>
                        <p class="card-text">${product.briefInfo}</p>
                        <del class="bloc_left_price">${product.price}VND</del>
                        <h3 class="bloc_left_price">${product.salePrice}VND</h3>
                    </div>
                </div>
            </div>


            <div class="col-sm-9 main">
                <div class="py-5 text-center">
                    <i class="fa fa-credit-card fa-4x" aria-hidden="true"></i>
                    <h2>Successfully!</h2>
                    <p class="lead">Bạn đã đặt hàng thành công. Dưới đây là thông tin của bạn.</p>
                </div>

                <h2 class="text-center mb-4">Order Details</h2>

                <!-- Display Order Information -->
                <div class="mb-4 row justify-content-center">
                    <div class="col-md-2 order-md-last">
                        <p><strong>Order ID:</strong></p>
                        <p><strong>Receiver Name:</strong></p>
                        <p><strong>Receiver Email:</strong></p>
                        <p><strong>Receiver Mobile:</strong></p>
                        <p><strong>Receiver Address:</strong></p>
                        <p><strong>Total Cost:</strong></p>
                    </div>
                    <div class="col-md-3 order-md-last">
                        <p>${order.orderId}</p>
                        <p>${order.receiverFullName}</p>
                        <p>${order.receiverEmail}</p>
                        <p>${order.receiverMobile}</p>
                        <p>${order.receiverAddress}</p>
                        <p>${order.totalCost}VND</p>
                    </div>
                </div>

                <!-- Display Order Details Table -->
                <h4>Order Details</h4>
                <table class="table table-bordered">
                    <thead class="thead-dark">
                        <tr>
                            <th>Order Detail ID</th>
                            <th>Product ID</th>
                            <th>Product title</th>
                            <th>Unit Price</th>
                            <th>Quantity</th>
                            <th>Total Cost</th>
                        </tr>
                    </thead>
                    <tbody>
                        <c:forEach var="orderDetail" items="${orderDetails}">
                            <tr>
                                <td>${orderDetail.orderDetailId}</td>
                                <td>${orderDetail.productId}</td>
                                <td>${orderDetail.product.title}</td>
                                <td>${orderDetail.unitPrice}VND</td>
                                <td>${orderDetail.quantity}</td>
                                <td>${orderDetail.totalCost}VND</td>
                            </tr>
                        </c:forEach>
                    </tbody>
                </table>

                <!-- Order Actions -->
                <div class="text-center mt-5">
                        <a class="btn btn-mo" href="my-order?id=${order.orderId}">My Order</a>
                </div>

            </div>

        </div>

        <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
        <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.10.2/dist/umd/popper.min.js"></script>
        <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/js/bootstrap.min.js"></script>
        <!-- đáy -->
        <jsp:include page="Footer.jsp"></jsp:include>
    </body>
</html>
