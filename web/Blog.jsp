<%-- 
    Document   : Blog
    Created on : Jan 28, 2024, 8:03:10 PM
    Author     : Hi
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page import="entity.Post" %>
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

    </head>
    <body>

        <jsp:include page="Header.jsp"></jsp:include>

            <header class="bg-dark py-5 mb-4">
                <div class="container px-4 px-lg-5 my-5">
                    <div class="text-center text-white">
                        <h1 class="display-4 fw-bolder">Blog</h1> 
                    </div>
                </div>
            </header>

            <div class="container">
                <div class="row">
                    <div class="col-md-3"> <!-- Đặt phần tìm kiếm vào cột đầy đủ chiều rộng -->
                        <form action="blogsearch" method="post" class="form-inline my-2 my-lg-0 ml-auto">
                            <div class="input-group input-group-sm">
                                <input value="" name="txt" type="text" class="form-control" aria-label="Small" aria-describedby="inputGroup-sizing-sm" placeholder="Search...">
                                <div class="input-group-append">
                                    <button type="submit" class="btn btn-secondary btn-number">
                                        <i class="fa fa-search"></i>
                                    </button>
                                </div>
                            </div>
                        </form>
                    </div>
                </div>

                <div class="row">
                    <div class="col-md-3"> <!-- Định nghĩa cột cho category -->
                        <div class="card bg-light mb-2">
                            <div class="card-header bg-primary text-white text-uppercase"><i class="fa fa-list"></i> Categories</div>
                            <ul class="list-group category_block">
                            <c:forEach items="${listpC}" var="o">
                                <li class="list-group-item text-white"><a href="blogcategory?postCategoryID=${o.postCategoryID}">${o.postCategoryname}</a></li>  
                                </c:forEach>
                        </ul>
                    </div> 
                </div>

                <div class="col-md-9"> <!-- Định nghĩa cột cho sản phẩm -->
                    <div class="row text-center">
                        <c:forEach items="${requestScope.listPo}" var="o">
                            <div class="col-12 col-md-6 col-lg-4">
                                <div class="card">
                                    <img class="card-img-top" src="${o.postThumbnail}" alt="Card image cap">
                                    <div class="card-body">
                                        <h4 class="card-title show_txt">${o.pTitle}</h4>
                                        <p class="card-text show_txt">${o.postAuthor}</p>
                                        <p class="card-text show_txt">${o.postBriefInfo}</p> 
                                        <div class="row">                              
                                            <div class="col">
                                                <p class="card-text show_txt text-muted">${o.postUpdatedDate}</p> 
                                            </div>
                                            <div class="col">
                                                <a href="detail1?postID=${o.postID}" class="btn btn-dark btn-block">View more</a>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </c:forEach>
                    </div>
                </div>
            </div>
        </div>



        <jsp:include page="Footer.jsp"></jsp:include>
        <!-- Bootstrap core JS-->
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"></script>
        <!-- Core theme JS-->
        <script src="js/scripts.js"></script>
    </body>
</html>
