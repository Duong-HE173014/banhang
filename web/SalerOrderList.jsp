<%-- 
    Document   : SalerOrderList
    Created on : Mar 14, 2024, 3:10:15 AM
    Author     : Admin
--%>

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/css/bootstrap.min.css">

        <!------ Include the above in your HEAD tag ---------->
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
            .equal-button {
                width: 130px;
            }
            .hidden {
                display: none;
            }

            #table2 {
                table-layout: fixed;
            }

            #table2 tbody tr {
                height: 30px;
            }

            #table1 {
                table-layout: fixed;
            }

            #table1 tbody tr {
                height: 30px;
            }
            .btn-confirm,
            .btn-successfully {
                width: 150px;
                color: #ffffff; /* Màu chữ của nút */           
                font-size: 14px; /* Cỡ chữ */
            }
        </style>
    </head>
    <body class="sb-nav-fixed">
        <jsp:include page="Menu.jsp"></jsp:include>  
        <%  
            Object value = request.getAttribute("txtS");
                 String txtS;
                         if(value==null){
                         txtS="";
                     }else txtS = (String)request.getAttribute("txtS");
        %>
        <section class="home-section">
            <div class="container">
                <div class="main">
                    <h2 class="text-center mb-5">Orders List</h2>
                    <div class="form-group mb-3">
                        <label class="mb-1">Choose Order:</label> 

                        <button onclick="showTable1()" class="btn btn-primary mr-2 equal-button">Not received</button>
                        <button onclick="showTable2()" class="btn btn-primary equal-button">Accept</button>

                        <hr>
                    </div>

                    <div class="row">
                        <div class="col-sm-8">
                            <form action="salerOrderListControl" method="post" id="dateRangeForm">
                                FILTER BY DATE:
                                <label for="startDate"></label>
                                <input type="date" id="startDate" name="startDate">
                                <label for="endDate">To:</label>
                                <input type="date" id="endDate" name="endDate">
                                <input type="hidden" name="go" value="dateOrder">
                                <input type="submit" value="Submit">
                            </form> 
                        </div>
                        <div class="col-sm-4">                                                     
                            <span>
                                <form action="salerOrderListControl" method="post" class="form-inline my-2 my-lg-0">
                                    <input type="hidden" name="go" value="searchOrder">
                                    <div class="input-group input-group-sm">
                                        <td><input value ="<%=txtS%>"  name="txt" type="text" class="form-control" aria-label="Small" aria-describedby="inputGroup-sizing-sm" placeholder="Search..."></td>
                                    </div>
                                </form>
                            </span>
                        </div>
                    </div>       
                    <table id="table1" class="table table-bordered">
                        <thead class="thead-dark">
                            <tr>
                                <th>Order ID</th>
                                <th>Order Date</th>
                                <th>Total Cost</th>
                                <th>Product</th>
                                <th>Receiver Name</th>
                                <th>Status</th> 
                                <th>Action</th>
                                <th>Details</th>
                            </tr>
                        </thead>
                        <tbody>
                            <c:forEach var="order" items="${orderList1}">
                                <tr>
                                    <td>${order.orderId}</td>
                                    <td><fmt:formatDate value="${order.orderDate}" pattern="yyyy-MM-dd HH:mm:ss"/></td>
                                    <td>${order.totalCost}VND</td>
                                    <td>
                                        <c:if test="order.orderDetailList.size>0">${order.orderDetailList.get(0).product.title}</c:if>                                 
                                        ${order.orderDetailList.size()} Products
                                    </td>
                                    <td>${order.receiverFullName}</td>
                                    <td>${order.status}</td>
                            <form action="salerEditOrder" method="post">
                                <input type="hidden" name="id" value="${order.orderId}">
                                <input type="hidden" name="status" value="Confirm">
                                <input name="salerID"  type="hidden" class="form-control" value="${user.userID}" >
                                <td><button type="submit" name="submit" class="btn btn-primary"type="submit" name="submit">confirm</button></td>
                            </form>
                            <td class="align-items-center"> <a href="salerEditOrder?orderId=${order.orderId}"><svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-exclamation-circle-fill" viewBox="0 0 16 16">
                                    <path d="M16 8A8 8 0 1 1 0 8a8 8 0 0 1 16 0M8 4a.905.905 0 0 0-.9.995l.35 3.507a.552.552 0 0 0 1.1 0l.35-3.507A.905.905 0 0 0 8 4m.002 6a1 1 0 1 0 0 2 1 1 0 0 0 0-2"/>
                                    </svg></a></td>
                            </tr>
                        </c:forEach>
                        </tbody>
                    </table>

                    <table id="table2" class="table table-bordered hidden">
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
                            <c:forEach var="order" items="${orderList2}">
                                <tr>
                                    <td>${order.orderId}</td>
                                    <td><fmt:formatDate value="${order.orderDate}" pattern="yyyy-MM-dd HH:mm:ss"/></td>
                                    <td>${order.totalCost}VND</td>
                                    <td>
                                        <c:if test="order.orderDetailList.size>0">${order.orderDetailList.get(0).product.title}</c:if>                                 
                                        ${order.orderDetailList.size()} Products
                                    </td>
                                    <td>${order.receiverFullName}</td>
                                    <td>${order.status}</td>       
                            <td class="align-items-center"> <a href="salerEditOrder?orderId=${order.orderId}"><svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-exclamation-circle-fill" viewBox="0 0 16 16">
                                    <path d="M16 8A8 8 0 1 1 0 8a8 8 0 0 1 16 0M8 4a.905.905 0 0 0-.9.995l.35 3.507a.552.552 0 0 0 1.1 0l.35-3.507A.905.905 0 0 0 8 4m.002 6a1 1 0 1 0 0 2 1 1 0 0 0 0-2"/>
                                    </svg></a></td>
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
        </section>
        <script>
            function showTable1() {
                document.getElementById("table1").classList.remove("hidden");
                document.getElementById("table2").classList.add("hidden");
            }

            function showTable2() {
                document.getElementById("table1").classList.add("hidden");
                document.getElementById("table2").classList.remove("hidden");
            }
            // Show table 1 by default when the page is loaded

        </script>

        <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
        <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.10.2/dist/umd/popper.min.js"></script>
        <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/js/bootstrap.min.js"></script>
    </body>
</html>

