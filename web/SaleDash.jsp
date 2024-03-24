

<%-- 
    Document   : SaleManagerDash
    Created on : Mar 12, 2024, 11:05:11 AM
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
        <link href="//cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-T3c6CoIi6uLrA9TneNEoa7RxnatzjcDSCmG1MXxSR1GAsXEV/Dwwykc2MPK8M2HN" crossorigin="anonymous">
        <script src="//cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-C6RzsynM9kWDrMNeT87bh95OGNyZPhcTNXj1NW7RuBCsyN/o0jlpcV8Qyq46cDfL" crossorigin="anonymous"></script>
        <link href="//cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.4/css/all.min.css" rel="stylesheet">
        <script src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
        <link href="css/menu.css" rel="stylesheet" type="text/css"/>
        <!------ Include the above in your HEAD tag ---------->
    </head>
    <body class="sb-nav-fixed">
        <jsp:include page="Menu.jsp"></jsp:include>    
            <section class="home-section">
                <div class="text">Dashboard</div>

                <div id="layoutSidenav">
                    <div id="layoutSidenav_nav">
                        <nav class="sb-sidenav accordion sb-sidenav-dark" id="sidenavAccordion">

                            <div class="sb-sidenav-footer">

                                <h2 class="mt-3" style="color:#3333ff" >General statistics</h2>
                            </div>
                        </nav>
                    </div>
                    <div id="layoutSidenav_content">
                        <main>
                            <div class="container-fluid px-4">

                                <div class="row justify-content-center">
                                    <div class="row">
                                        <style>
                                            .card-body {
                                                display: flex;
                                                justify-content: space-between;
                                            }

                                            .card-body span {
                                                margin-left: 10px; /* Điều chỉnh khoảng cách bằng cách thay đổi giá trị của margin */

                                            }
                                            .sb-sidenav-footer{
                                                margin-bottom: 50px;
                                                margin-left: 20px;
                                            }
                                            .show{
                                                margin-bottom: 30px;
                                            }
                                        </style>  
                                        <div class="row show">
                                            <div class="col-xl-6 col-md-6 mb-6">
                                                <div class="card bg-primary text-white">
                                                    <div class="card-body">Waiting for confirm <span>${requestScope.tpending}</span></div>
                                                <div class="card-footer d-flex align-items-center justify-content-between">
                                                    <a class="small text-white stretched-link" href="salemanagerOrderListControl">View Details</a>
                                                    <div class="small text-white"><i class="fas fa-angle-right"></i></div>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="col-xl-6 col-md-6 mb-6">
                                            <div class="card bg-warning text-white">
                                                <div class="card-body">Commercial packaging <span>${requestScope.tconfirm}</span></div>
                                                <div class="card-footer d-flex align-items-center justify-content-between">
                                                    <a class="small text-white stretched-link" href="salemanagerOrderListControl">View Details</a>
                                                    <div class="small text-white"><i class="fas fa-angle-right"></i></div>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="row show">   
                                        <div class="col-xl-6 col-md-6 mb-6">
                                            <div class="card bg-success text-white">
                                                <div class="card-body">Delivering <span>${requestScope.tdelivering}</span></div>
                                                <div class="card-footer d-flex align-items-center justify-content-between">
                                                    <a class="small text-white stretched-link" href="salemanagerOrderListControl">View Details</a>
                                                    <div class="small text-white"><i class="fas fa-angle-right"></i></div>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="col-xl-6 col-md-6 mb-6">
                                            <div class="card bg-danger text-white">
                                                <div class="card-body">Order delivered successfully <span>${requestScope.tsuccessfully}</span></div>
                                                <div class="card-footer d-flex align-items-center justify-content-between">
                                                    <a class="small text-white stretched-link" href="salemanagerOrderListControl">View Details</a>
                                                    <div class="small text-white"><i class="fas fa-angle-right"></i></div>
                                                </div>
                                            </div>
                                        </div>
                                    </div> 
                                </div>
                            </div>


                        </div>
                    </main>
                    <footer class="py-4 bg-light mt-auto">
                        <div class="container-fluid px-4">
                            <div class="d-flex align-items-center justify-content-between small">
                                <div class="text-muted">Copyright &copy; Your Website 2021</div>
                                <div>
                                    <a href="#">Privacy Policy</a>
                                    &middot;
                                    <a href="#">Terms &amp; Conditions</a>
                                </div>
                            </div>
                        </div>
                    </footer>
                </div>
            </div>
        </section>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" crossorigin="anonymous"></script>
        <script src="js/scripts.js"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.8.0/Chart.min.js" crossorigin="anonymous"></script>
        <script src="assets/demo/chart-area-demo.js"></script>
        <script src="assets/demo/chart-bar-demo.js"></script>
        <script src="https://cdn.jsdelivr.net/npm/simple-datatables@latest" crossorigin="anonymous"></script>
        <script src="js/datatables-simple-demo.js"></script>
    </body>
</html>


