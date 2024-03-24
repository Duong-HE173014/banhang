<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html lang="en">
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Order Details</title>
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
        <jsp:include page="Header.jsp"></jsp:include>

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

                <h2 class="text-center mb-4">Order Details</h2>

                <!-- Display Order Information -->
                <div class="mb-4 row">
                    <div class="col-md-6">
                        <p><strong>Order ID:</strong> ${order.orderId}</p>
                        <p><strong>Order Date:</strong> <fmt:formatDate value="${order.orderDate}" pattern="yyyy-MM-dd HH:mm:ss"/></p>
                        <p><strong>Total Cost:</strong> ${order.totalCost}VND</p>
                        <p><strong>Status:</strong> ${order.status}</p>
                    </div>
                    <div class="col-md-6">
                        <p><strong>Receiver Name:</strong> ${order.receiverFullName}</p>
                        <p><strong>Receiver Email:</strong> ${order.receiverEmail}</p>
                        <p><strong>Receiver Mobile:</strong> ${order.receiverMobile}</p>
                        <p><strong>Receiver Address:</strong> ${order.receiverAddress}</p>
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
                            <th>Action</th>
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
                                <td>
                                    <button type="button" class="btn btn-secondary" data-toggle="modal" data-target="#productModal${orderDetail.productId}">
                                        View
                                    </button>
                                    <a class="btn btn-primary" target="_blank" href="detail?pid=${orderDetail.productId}">Rebuy</a>
                                    <c:if test="${order.status eq 'Successfully'}">
                                        <button type="button" class="btn btn-warning feedback-button"
                                                data-order-detail-id="${orderDetail.orderDetailId}"
                                                data-product-id="${orderDetail.productId}"
                                                data-product-title="${orderDetail.product.title}">
                                            Feedback
                                        </button>
                                    </c:if>
                                </td>
                            </tr>

                            <!-- Product Modal -->
                        <div class="modal fade" id="productModal${orderDetail.productId}" tabindex="-1" role="dialog" aria-labelledby="productModalLabel" aria-hidden="true">
                            <div class="modal-dialog" role="document">
                                <div class="modal-content">
                                    <div class="modal-header">
                                        <h5 class="modal-title" id="productModalLabel">Product Information</h5>
                                        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                                            <span aria-hidden="true">&times;</span>
                                        </button>
                                    </div>
                                    <div class="modal-body">
                                        <!-- Display product information here -->
                                        <div class="w-100 text-center mb-3">
                                            <img src="${orderDetail.product.image}" class="w-100">
                                        </div>
                                        <p><strong>Title:</strong> ${orderDetail.product.title}</p>
                                        <p><strong>Brief Info:</strong> ${orderDetail.product.briefInfo}</p>
                                        <p><strong>Price:</strong> ${orderDetail.product.price}VND</p>
                                    </div>
                                    <div class="modal-footer">
                                        <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
                                    </div>
                                </div>
                            </div>

                        </c:forEach>
                        </tbody>
                </table>

                <c:if test="${param.success ne null}">
                    <div class="alert alert-success" role="alert">
                        Feedback success!
                    </div>
                </c:if>

                <!-- Order Actions -->
                <div class="text-center mt-5">
                    <!-- Cancel button (if not "Delivered") -->
                    <c:if test="${order.status ne 'Successfully'}">
                        <a class="btn btn-danger" href="order-details?id=${order.orderId}&action=cancel">Cancel Order</a>
                    </c:if>


                </div>

            </div>

        </div>
        <!-- đáy -->


        <!-- Feedback Modal -->
        <div class="modal fade" id="feedbackModal" tabindex="-1" role="dialog" aria-labelledby="feedbackModalLabel" aria-hidden="true">
            <div class="modal-dialog" role="document">
                <div class="modal-content">
                    <div class="modal-header">
                        <h5 class="modal-title" id="feedbackModalLabel">Feedback</h5>
                        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                            <span aria-hidden="true">&times;</span>
                        </button>
                    </div>
                    <div class="modal-body">
                        <!-- Feedback form -->
                        <form id="feedbackForm" action="feedback" method="post">
                            <input type="hidden" id="productId" name="id" value="">
                            <input type="hidden" id="orderDetailId" name="orderDetailId" value="">
                            <input type="hidden" id="orderId" name="orderId" value="${order.orderId}">
                            <div class="form-group">
                                <label for="feedbackContent">Your Feedback:</label>
                                <textarea class="form-control" id="feedbackContent" name="content" rows="3" required></textarea>
                            </div>
                            <div class="form-group">
                                <label for="feedbackRating">Rating:</label>
                                <select class="form-control" id="feedbackRating" name="rating" required>
                                    <option value="1">1 Star</option>
                                    <option value="2">2 Stars</option>
                                    <option value="3">3 Stars</option>
                                    <option value="4">4 Stars</option>
                                    <option value="5">5 Stars</option>
                                </select>
                            </div>
                            <button type="submit" class="btn btn-primary">Submit</button>
                        </form>
                    </div>
                </div>
            </div>
        </div>

        <jsp:include page="Footer.jsp"></jsp:include>
        <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
        <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.10.2/dist/umd/popper.min.js"></script>
        <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/js/bootstrap.min.js"></script>

        <script>
            $(document).ready(function () {
                // Show feedback modal when "Feedback" button is clicked
                $('.feedback-button').click(function () {
                    // Get the order detail information from data attributes
                    var orderDetailId = $(this).data('order-detail-id');
                    var productId = $(this).data('product-id');
                    var productTitle = $(this).data('product-title');

                    // Set the order detail information in the modal
                    $('#feedbackModal').find('#orderDetailId').val(orderDetailId);
                    $('#feedbackModal').find('#productId').val(productId);
                    $('#feedbackModal').find('#productTitle').val(productTitle);

                    // Show the modal
                    $('#feedbackModal').modal('show');
                });
            });
        </script>


    </body>
</html>
