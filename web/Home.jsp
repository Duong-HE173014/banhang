<%-- 
    Document   : Home
    Created on : Jan 7, 2024, 9:04:10 PM
    Author     : Admin
--%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page import="entity.Post" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.util.Vector" %>
<%@page import="entity.Product" %>
<%@page import="entity.Category" %>
<%@page import="entity.Slider" %>
<%@page import="entity.User" %>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <link href="//cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-T3c6CoIi6uLrA9TneNEoa7RxnatzjcDSCmG1MXxSR1GAsXEV/Dwwykc2MPK8M2HN" crossorigin="anonymous">
        <script src="//cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-C6RzsynM9kWDrMNeT87bh95OGNyZPhcTNXj1NW7RuBCsyN/o0jlpcV8Qyq46cDfL" crossorigin="anonymous"></script>
        <link href="//cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.4/css/all.min.css" rel="stylesheet">
        <script src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
        <link href="css/style.css" rel="stylesheet" type="text/css"/>
        <script src="js/script.js"></script>
        <!------ Include the above in your HEAD tag ---------->
        <style>
            .pagination {
                display: flex;
                margin-left: 20px;
            }
            .pagination a {
                margin-left: 5px;
                color: black;
                font-size: 12px;
                float: left;
                padding: 8px 16px;
                text-decoration: none;
            }
            .pagination a.active {
                background-color: #4CAF50;
                color: white;
            }
            .pagination a:hover:not(.active) {
                background-color: chocolate;
        </style>
    </head>
    <body>
        <%  
            int i = 0;
                User acc = (User) session.getAttribute("user");
                String userRole = (String) session.getAttribute("role");
                Post lastPost = (Post)request.getAttribute("lPost");
                Vector<Slider> listS = (Vector<Slider>)request.getAttribute("listS");               
                Vector<Category> listC =(Vector<Category>)request.getAttribute("listC");
                Vector<Product> list5New =(Vector<Product>)request.getAttribute("5new");
                Vector<Product> list5Last =(Vector<Product>)request.getAttribute("5last");
                 int tag = (int)request.getAttribute("tag");
        %>    
        <jsp:include page="Header.jsp"></jsp:include>    

            <!--end of menu-->
            <div id="carouselExample" class="carousel slide mt-4">
                <div class="carousel-inner">

                    <% for (Slider slider : listS) { %>
                    <div class="carousel-item <%=i == 0 ? "active" : "" %>">
                        <a href="<%= slider.getBacklink() %>">
                            <img src="<%=slider.getsImage()%>" class="d-block mx-auto" alt="<%=slider.getsTitle()%>">
                        </a>
                    </div>
                    <% i++; %>
                    <% } %>
                </div>
                <button class="carousel-control-prev" type="button" data-bs-target="#carouselExample" data-bs-slide="prev">
                    <span class="carousel-control-prev-icon" aria-hidden="true"></span>
                    <span class="visually-hidden">Previous</span>
                </button>
                <button class="carousel-control-next" type="button" data-bs-target="#carouselExample" data-bs-slide="next">
                    <span class="carousel-control-next-icon" aria-hidden="true"></span>
                    <span class="visually-hidden">Next</span>
                </button>


                <span class="carousel-indicators">                
                    <% for ( i = 0; i < listS.size(); i++) { %>               
                    <li data-bs-target="#carouselExample" data-bs-slide-to="<%= i %>" class="<%= i == 0 ? "active" : "" %>"></li>
                        <%}%>            
                </span>

            </div>


            <nav class="navbar mt-4">
                <div class="container">
                    <ul class="nav category_block m-auto">
                        <%for (Category cat : listC) {%>
                        <li class="nav-item me-5 <%=cat.getCategoryId()==tag?"active":""%>">
                            <a class="text-decoration-none text-uppercase fw-bold" href="category?categoryId=<%=cat.getCategoryId()%>"><%=cat.getCategoryName()%></a>
                        </li>
                        <%}%>
                    </ul>
                </div>
            </nav>
            <hr>
            <!--end of nav-->

            <div class="container mt-4" id="mainPage">
                <div class="col-sm-9 m-auto"> <%-- show sản phẩm --%> 
                    <div class="row text-center">
                                            <% for (Product n5 : list5New){%>
                                            <div class="col-12 col-md-6 col-lg-3">
                                                <div class="card cardp">
                                                    <img class="cardp-img-top" src="<%=n5.getImage()%>" alt="Card image cap">
                                                    <div class="card-body">
                                                        <p class="cardp-title show_txt"><a class="text-decoration-none" href="detail?pid=<%=n5.getProductID()%>" title="View Product"><%=n5.getTitle()%></a></p>
                                                        <p class="cardp-text show_txt"><%=n5.getBriefInfo()%></p>
                                                        <div class="row">                              
                                                            <div class="col">
                                                                <del class="cardp-text text-muted me-2"><%=n5.getPrice()%>VND</del> <h2 class="cardp-text" style="color: red"><%=n5.getSalePrice()%>VND</h2> 
                                                            </div>
                                                            <div class="col">
                                                                <a href="showCart?go=addInMain&id=<%=n5.getProductID()%>" class="btn btn-dark btn-block">Add to cart</a>
                                                            </div>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                            <%}%>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>











            <!-- đáy -->
            <footer class="text-light">
                <div class="container-fluid">
                    <div class="row">
                        <div class="col-md-3 col-lg-4 col-xl-3">
                            <h5>About</h5>
                            <hr class="bg-light mb-2 mt-0 d-inline-block mx-auto w-25">
                            <p class="mb-0">
                                liên quan đến sản phẩm
                            </p>
                        </div>

                        <div class="col-md-4 col-lg-3 col-xl-3">
                            <h5>Contact</h5>
                            <hr class="bg-light mb-2 mt-0 d-inline-block mx-auto w-25">
                            <ul class="list-unstyled">
                                <li><i class="fa fa-home mr-2"></i> My Shop</li>
                                <li><i class="fa fa-envelope mr-2"></i> duongvdhe173014@gmail.com</li>
                                <li><i class="fa fa-phone mr-2"></i> + 33 12 14 15 16</li>
                                <li><i class="fa fa-print mr-2"></i> + 33 12 14 15 16</li>
                            </ul>
                        </div>             
                    </div>
                </div>
            </footer>
        </body>
    </html>
