<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<html lang="en">
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>My Orders</title>
        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/css/bootstrap.min.css">
        <style>
            body {
                background-color: #f8f9fa;
            }

            .main {
                background-color: #ffffff;
                box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
                padding: 20px;
                border-radius: 8px;
                margin-top: 50px;
            }

            .table th, .table td {
                text-align: center;
            }

            .pagination {
                justify-content: center;
                margin-top: 20px;
            }
        </style>
    </head>
    <body>

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
                        <del class="bloc_left_price">${product.price}</del>
                        <h3 class="bloc_left_price">${product.salePrice}</h3>
                    </div>
                </div>
            </div>


            <div class="col-sm-9 main">

                <h2 class="text-center mb-5">My Orders</h2>
                <table class="table table-bordered">
                    <thead class="thead-dark">
                        <tr>
                            <th>Order ID</th>
                            <th>Order Date</th>
                            <th>Total Cost</th>
                            <th>Product</th>
                            <th>Receiver Name</th>
                            <th>Status</th>
                            <th>Details</th>
                        </tr>
                    </thead>
                    <tbody>
                        <c:forEach var="order" items="${orderList}">
                            <tr>
                                <td>${order.orderId}</td>
                                <td><fmt:formatDate value="${order.orderDate}" pattern="yyyy-MM-dd HH:mm:ss"/></td>
                                <td>${order.totalCost}</td>
                                <td>
                                    <c:if test="order.orderDetailList.size>0">${order.orderDetailList.get(0).product.title}</c:if>
                                    <br>
                                    ${order.orderDetailList.size()} Products
                                </td>
                                <td>${order.receiverFullName}</td>
                                <td>${order.status}</td>
                                <th>
                                    <a class="btn btn-secondary" href="order-details?id=${order.orderId}">Details</a>
                                </th>
                            </tr>
                        </c:forEach>
                    </tbody>
                </table>

                <!-- Pagination -->
                <ul class="pagination">
                    <li class="page-item <c:if test='${page <= 1}'>disabled</c:if>'">
                        <a class="page-link" href="?page=${page - 1}" tabindex="-1" aria-disabled="true">Previous</a>
                    </li>

                    <c:if test="${page > 2}">
                        <li class="page-item"><a class="page-link" href="?page=${page - 2}">${page - 2}</a></li>
                        </c:if>

                    <c:if test="${page > 1}">
                        <li class="page-item"><a class="page-link" href="?page=${page - 1}">${page - 1}</a></li>
                        </c:if>

                    <li class="page-item active"><a class="page-link" href="?page=${page}">${page}</a></li>

                    <li class="page-item"><a class="page-link" href="?page=${page + 1}">${page + 1}</a></li>

                    <li class="page-item">
                        <a class="page-link" href="?page=${page + 1}" aria-disabled="false">Next</a>
                    </li>
                </ul>

            </div>

        </div>

        <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
        <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.10.2/dist/umd/popper.min.js"></script>
        <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/js/bootstrap.min.js"></script>

    </body>
</html>
