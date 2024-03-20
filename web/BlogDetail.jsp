<%-- 
    Document   : BlogDetail
    Created on : Feb 2, 2024, 10:02:22 AM
    Author     : Hi
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page import="entity.Post" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.util.Vector" %>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <link href="//cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-T3c6CoIi6uLrA9TneNEoa7RxnatzjcDSCmG1MXxSR1GAsXEV/Dwwykc2MPK8M2HN" crossorigin="anonymous">
        <script src="//cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-C6RzsynM9kWDrMNeT87bh95OGNyZPhcTNXj1NW7RuBCsyN/o0jlpcV8Qyq46cDfL" crossorigin="anonymous"></script>
        <link href="//cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.4/css/all.min.css" rel="stylesheet">
        <script src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
        <link href="css/blog.css" rel="stylesheet" type="text/css"/>
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
                    <div class="col-md-12"> <!-- Đặt phần tìm kiếm vào cột đầy đủ chiều rộng -->
                        <form action="blogsearch" method="post" class="form-inline my-2 my-lg-0 ml-auto">
                            <div class="input-group input-group-sm" style="width: 308px">
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
                    <div class="col-sm-3">
                        <div class="card bg-light mb-2">
                            <div class="card-header bg-dark text-white text-uppercase"><i class="fa fa-list"></i> Categories</div>
                            <ul class="list-group category_block">
                            <c:forEach items="${listpC}" var="o">
                                <li class="list-group-item text-white"><a href="blogcategory?postCategoryID=${o.postCategoryID}">${o.postCategoryname}</a></li>  
                                </c:forEach>
                        </ul>
                    </div> 
                    <div class="card bg-light mb-3">
                        <div class="card-header bg-dark text-white text-uppercase">NEW POST</div>
                        <div class="card-body">                            
                            <img class="img-fluid" src="${po.postThumbnail}" />
                            <a class="nav-link" href="detail1?postID=${po.postID}"> <h5 class="card-title">${po.pTitle}</h5></a>
                            <p class="card-text">${po.postUpdatedDate}</p>
                            <p class="card-text">${po.postBriefInfo}</p>                           
                        </div>
                    </div>
                </div>

                <div class="col-sm-9"> <!-- detail -->
                    <div class="card">
                        <div class="row">
                            <aside class="col-sm-5 border-end">
                                <article class="gallery-wrap"> 
                                    <div class="img-big-wrap">
                                        <div> <a href="#"><img src="${detail1.postThumbnail}" class="img-fluid"></a></div>
                                    </div> <!-- slider-detail -->
                                </article> 
                            </aside>
                            <aside class="col-sm-7">
                                <article class="card-body p-5">
                                    <h3 class="title mb-3">${detail1.pTitle}</h3>
                                    <p class="title mb-3">${detail1.postUpdatedDate}</p> 
                                    <dl class="item-detailperty">
                                        <dt>Description</dt>
                                        <dd><p>
                                                ${detail1.postDetails}
                                            </p></dd>
                                    </dl>
                                    <hr>
                                </article> <!-- card-body.// -->
                            </aside> <!-- col.// -->
                        </div> <!-- row.// -->
                    </div> <!-- card.// -->
                </div> <!-- col.// -->
            </div> <!-- row.// -->
        </div> <!-- container.// -->

    </body>
</html>
