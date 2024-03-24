
<%@page import="entity.User"%>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Electronic Funds Transfer</title>
        <!-- Google Fonts - Montserrat -->
        <link href="https://fonts.googleapis.com/css?family=Montserrat:400,700&display=swap" rel="stylesheet">
        <!-- Bootstrap CSS -->
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.1/dist/css/bootstrap.min.css" rel="stylesheet">
        <!-- ThÃÂªm thÃ¡ÂºÂ» link cho Bootstrap Icons tÃ¡Â»Â« CDN -->
        <link href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.8.1/font/bootstrap-icons.css" rel="stylesheet">
        <!-- Font Awesome CSS -->
        <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.7.2/css/all.css">
        <style>
            * {
                margin: 0;
                padding: 0;
                box-sizing: border-box;
                list-style: none;
                font-family: 'Montserrat', sans-serif
            }

            body{
                background-color:#343a40;
            }

            .container {
                margin: 20px auto;
                width: 800px;
                padding: 30px
            }

            .card.box1 {
                width: 350px;
                height: 500px;
                background-color: #343a40;
                color: #ffffff;
                border-radius: 0
            }

            .card.box2 {
                width: 450px;
                height: 580px;
                background-color: #ffffff;
                border-radius: 0
            }

            .text {
                font-size: 13px
            }

            .box2 .btn.btn-primary.bar {
                width: 20px;
                background-color: transparent;
                border: none;
                color: #343a40
            }

            .box2 .btn.btn-primary.bar:hover {
                color: #baf0c3
            }

            .box2 .btn.btn-primary {
                background-color: #343a40;
                width: 45px;
                height: 45px;
                display: flex;
                justify-content: center;
                align-items: center;
                border: 1px solid #ddd
            }

            .box2 .btn.btn-primary:hover {
                background-color: #f6f8f7;
                color: #343a40
            }

            .btn.btn-success {
                width: 40px;
                height: 40px;
                border-radius: 50%;
                background-color: #ddd;
                color: black;
                display: flex;
                justify-content: center;
                align-items: center;
                border: none
            }

            .nav.nav-tabs {
                border: none;
                border-bottom: 2px solid #ddd
            }

            .nav.nav-tabs .nav-item .nav-link {
                border: none;
                color: black;
                border-bottom: 2px solid transparent;
                font-size: 14px
            }

            .nav.nav-tabs .nav-item .nav-link:hover {
                border-bottom: 2px solid #343a40;
                color: #343a40
            }

            .nav.nav-tabs .nav-item .nav-link.active {
                border: none;
                border-bottom: 2px solid #343a40
            }

            .form-control {
                border: none;
                border-bottom: 1px solid #ddd;
                box-shadow: none;
                height: 20px;
                font-weight: 600;
                font-size: 14px;
                padding: 15px 0px;
                letter-spacing: 1.5px;
                border-radius: 0
            }

            .inputWithIcon {
                position: relative
            }

            img {
                width: 50px;
                height: 20px;
                object-fit: cover
            }

            .inputWithIcon span {
                position: absolute;
                right: 0px;
                bottom: 9px;
                color: #343a40;
                cursor: pointer;
                transition: 0.3s;
                font-size: 14px
            }

            .form-control:focus {
                box-shadow: none;
                border-bottom: 1px solid #ddd
            }

            .btn-outline-primary {
                color: black;
                background-color: #ddd;
                border: 1px solid #ddd
            }

            .btn-outline-primary:hover {
                background-color: #05cf48;
                border: 1px solid #ddd
            }

            .btn-check:active+.btn-outline-primary,
            .btn-check:checked+.btn-outline-primary,
            .btn-outline-primary.active,
            .btn-outline-primary.dropdown-toggle.show,
            .btn-outline-primary:active {
                color: #baf0c3;
                background-color: #343a40;
                box-shadow: none;
                border: 1px solid #ddd
            }

            .btn-group>.btn-group:not(:last-child)>.btn,
            .btn-group>.btn:not(:last-child):not(.dropdown-toggle),
            .btn-group>.btn-group:not(:first-child)>.btn,
            .btn-group>.btn:nth-child(n+3),
            .btn-group>:not(.btn-check)+.btn {
                border-radius: 50px;
                margin-right: 20px
            }

            form {
                font-size: 14px
            }

            form .btn.btn-primary {
                width: 100%;
                height: 45px;
                display: flex;
                flex-direction: column;
                justify-content: center;
                align-items: center;
                background-color: #343a40;
                border: 1px solid #ddd
            }

            form .btn.btn-primary:hover {
                background-color: #05cf48
            }

            @media (max-width:750px) {
                .container {
                    padding: 10px;
                    width: 100%
                }

                .text-green {
                    font-size: 14px
                }

                .card.box1,
                .card.box2 {
                    width: 100%
                }

                .nav.nav-tabs .nav-item .nav-link {
                    font-size: 12px
                }
            }
        </style>
        <!-- Bootstrap JavaScript -->
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.1/dist/js/bootstrap.bundle.min.js"></script>
        <!-- jQuery -->
        <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
        <!-- Font Awesome -->
        <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.7.2/css/all.css">
    </head>
    <body>
        <%  
            int i = 0;
            User user = (User) session.getAttribute("user");
            String userRole = (String) session.getAttribute("role");
//            Vector<Product> listP =(Vector<Product>)request.getAttribute("listP");
//            Vector<Category> listC =(Vector<Category>)request.getAttribute("listC");
//            Product last = (Product)request.getAttribute("p");
        %>
        <form action="cartcompletion" method="post">
            <input value="<%= request.getAttribute("uid") %>" name="uid" type="hidden" >
            <input value="<%= request.getAttribute("gender") %>" name="gender" type="hidden" >
            <input value="<%= request.getAttribute("total") %>"  name="total" type="hidden" >
            <input value="<%= request.getAttribute("fullName") %>"  name="full_name" type="hidden" >
            <input value="<%= request.getAttribute("mobile") %>"  name="mobile" type="hidden" >
            <input value="<%= request.getAttribute("address") %>"  name="address" type="hidden" >
            <input value="<%= request.getAttribute("email") %>"  name="email" type="hidden" >
            <input value="2" name="httt_ma" type="hidden">
            

            <input value="<%= request.getAttribute("notes") %>" name="notes" type="hidden" >
            
            <div class="container bg-light d-md-flex align-items-center">
                <div class="card box1 shadow-sm p-md-5 p-md-5 p-4">
                    <div class="fw-bolder mb-4">
                        <span class="ps-1">Total bill:
                            <%= request.getAttribute("total") %>VND</span>
                    </div>
                    <div class="d-flex flex-column">
                        <div class="border-bottom mb-2"></div>
                        <div class="d-flex flex-column mb-4">
                            <span class="bi bi-person mb-4" style="display: flex; align-items: center;">
                                <span class="ps-2" style="font-size: 18px;">Recipient Information</span>
                            </span>
                            <span class="bi bi-award-fill">
                                <span class="ps-2">Recipient's name:</span>
                            </span> <span class="ps-3"><%= request.getAttribute("fullName") %></span>

                        </div>
                        <div class="d-flex flex-column mb-4"> 
                            <span class="bi bi-telephone">
                                <span class="ps-2">Phone Number:</span>
                            </span> <span class="ps-3"><%= request.getAttribute("mobile") %></span>
                        </div>
                        <div class="d-flex flex-column mb-4"> 
                            <span class="bi bi-house-door">
                                <span class="ps-2">Delivery address:</span>
                            </span> <span class="ps-3"><%= request.getAttribute("address") %></span>
                        </div> 
                        <div class="d-flex flex-column mb-4"> 
                            <span class="bi bi-envelope">
                                <span class="ps-2">Email:</span>
                            </span> <span class="ps-3"><%= request.getAttribute("email") %></span>
                        </div> 

                    </div> 
                </div>
                <div class="card box2 shadow-sm">
                    <div class="d-flex align-items-center justify-content-between p-md-5 p-4">
                        <span class="h5 fw-bold m-0">Payment methods</span>
                        <!-- comment<div class="btn btn-primary bar">
                            <span class="fas fa-bars">Back to Cart Contact</span>
                        </div>-->
                    </div>
                    <ul class="nav nav-tabs mb-3 px-md-4 px-2 justify-content-between">
                        <li class="nav-item">
                            <a class="nav-link px-2 credit-card active" aria-current="page" href="#">Credit Card</a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link px-2 mobile-payment" href="#">Mobile Payment</a>
                        </li>
                    </ul>
                    <div id="credit-card-form">
                        <form action="">
                            <div class="row">
                                <div class="col-12">
                                    <div class="d-flex flex-column px-md-5 px-4 mb-4">
                                        <span>Credit Card</span>
                                        <div class="inputWithIcon">
                                            <input class="form-control" type="text" value="5136 1845 5468 3894">
                                            <span class="">
                                                <img src="https://www.freepnglogos.com/uploads/visa-and-mastercard-logo-26.png" alt="" style="width: 100%;">
                                            </span>
                                        </div>
                                    </div>
                                </div>
                                <div class="col-md-6">
                                    <div class="d-flex flex-column ps-md-5 px-md-0 px-4 mb-4">
                                        <span>Expiration
                                            <span class="ps-1">Date</span>
                                        </span>
                                        <div class="inputWithIcon">
                                            <input type="text" class="form-control" value="05/20">
                                            <span class="fas fa-calendar-alt"></span>
                                        </div>
                                    </div>
                                </div>
                                <div class="col-md-6">
                                    <div class="d-flex flex-column pe-md-5 px-md-0 px-4 mb-4">
                                        <span>Code CVV</span>
                                        <div class="inputWithIcon">
                                            <input type="password" class="form-control" value="123">
                                            <span class="fas fa-lock"></span>
                                        </div>
                                    </div>
                                </div>
                                <div class="col-12">
                                    <div class="d-flex flex-column px-md-5 px-4 mb-4">
                                        <span>Name</span>
                                        <div class="inputWithIcon">
                                            <input class="form-control text-uppercase" type="text" value="valdimir berezovkiy">
                                            <span class="far fa-user"></span>
                                        </div>
                                    </div>
                                </div>
                                <div class="col-12 px-md-5 px-4 mt-3">
                                    <button type="submit" class="btn btn-primary w-100" id="payButton">Pay <%= request.getAttribute("total") %>VND</button>
                                </div>
                            </div>
                        </form>
                    </div>
                    <div id="qr-code" style="display: none;  text-align: center;">
                        <!-- Place your QR code image or HTML here -->
                        <img src="https://vietqr.co/api/generate/mb/0918260603/TRAN%20QUYNH%20CHI/null?isMask=0&logo=1&style=1&bg=56" alt="QR Code" style="width: 250px; height: 250px;">
                        <div class="col-12 px-md-5 px-4 mt-3">
                            <div class="btn btn-primary w-100" id="completeOrderButton">Complete the order</div>
                        </div>
                    </div>
                </div>
            </div>
        </form>
        <!-- footer -->
        <jsp:include page="Footer.jsp"></jsp:include>

        <!-- Bootstrap JavaScript -->
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.1/dist/js/bootstrap.bundle.min.js"></script>
        <!-- jQuery -->
        <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
        <script>
            $(document).ready(function () {
                $('.credit-card').click(function () {
                    $('#credit-card-form').show();
                    $('#qr-code').hide();
                });

                $('.mobile-payment').click(function () {
                    $('#credit-card-form').hide();
                    $('#qr-code').show();
                });
            });

            $(document).ready(function () {
                $('.nav-link').click(function () {
                    // Remove 'active' class from all nav links
                    $('.nav-link').removeClass('active');
                    // Add 'active' class to the clicked nav link
                    $(this).addClass('active');
                });
            });
            
            document.getElementById("payButton").addEventListener("click", function () {
                window.location.href = "cartcompletion?completed=true";
            });

            document.getElementById("completeOrderButton").addEventListener("click", function () {
                window.location.href = "cartcompletion?completed=true";
            });
        </script>
    </body>
</html>
