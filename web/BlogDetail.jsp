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
        <nav class="navbar navbar-expand-md navbar-dark bg-dark">
            <div class="container-fluid">
                <a class="navbar-brand" href="home">Shop</a>
                <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarsExampleDefault" aria-controls="navbarsExampleDefault" aria-expanded="false" aria-label="Toggle navigation">
                    <span class="navbar-toggler-icon"></span>
                </button>

                <div class="collapse navbar-collapse" id="navbarsExampleDefault">
                    <ul class="navbar-nav m-auto">
                        <%-- <%if(acc != null){%> 

                    <%if(acc.getIsSale() == 1){%> 
                    <li class="nav-item">
                        <a class="nav-link" href="managerOrder">Manager Order</a>
                    </li>

                    <li class="nav-item">
                        <a class="nav-link" href="managerPro">Manager Product</a>    <%-- sản phẩm người đó bán --%>     
                        </li>

                        <%--                  <%}%>
                                        <%if(acc.getIsAdmin() == 1){%>  
                                        <li class="nav-item">
                                            <a class="nav-link" href="managerAcc">Manager Account</a>
                                        </li>
                                        <li class="nav-item">
                                            <a class="nav-link" href="adDashboard">Dashboard</a> 
                                        </li>

                    <%}%>
                    <%if(acc.getIsMKT() == 1){%>  
                    <li class="nav-item">
                        <a class="nav-link" href="postList">Post list</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="mktDashboard">Dashboard</a> 
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="productList">All Product</a> <%-- tất cả sản phẩm --%> 
                        <%--          </li>
                                 <li class="nav-item">
                                     <a class="nav-link" href="customerList">Customer List</a>
                                 </li>
                                 <li class="nav-item">
                                     <a class="nav-link" href="feedList">Feed List</a>
                                 </li>

                    <%}%>
                    <%if(acc.getIsSaleManager() == 1){%> 
                    <li class="nav-item">
                        <a class="nav-link" href="manager">Manager All Product</a> <%-- tất cả sản phẩm --%> 
                        <%--         </li>
                                <li class="nav-item">
                                    <a class="nav-link" href="smdashboard">Dashboard</a> 
                                </li>
                                <%}%>

                    <li class="nav-item">
                        <a class="nav-link" href="#">Welcome: <%=acc.getUser()%></a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="blog">Blog</a>
                    </li> 
                    <li class="nav-item">
                        <a class="nav-link" href="logout">Logout</a>
                    </li> 
                    <li class="nav-item">
                        <a class="nav-link" href="feedBack">Feed Back</a>
                    </li>
                    <%}%>       
                    <%if(acc == null){%> --%>  
                        <li class="nav-item">
                            <a class="nav-link" href="blog">Blog</a>
                        </li> 
                        <li class="nav-item">
                            <a class="nav-link" href="login">Login</a>
                        </li>                                       
                        <%-- <%}%>--%> 
                    </ul>

                    <ul class="navbar-nav ml-auto"> 
                        <form action="blogsearch" method="post" class="form-inline my-2 my-lg-0 ml-auto">
                            <div class="input-group input-group-sm">
                                <input value =""  name="txt" type="text" class="form-control" aria-label="Small" aria-describedby="inputGroup-sizing-sm" placeholder="Search...">
                                <div class="input-group-append">
                                    <button type="submit" class="btn btn-secondary btn-number">
                                        <i class="fa fa-search"></i>
                                    </button>
                                </div>
                            </div>
                            <a class="btn btn-success btn-sm ml-3" href="show">
                                <i class="fa fa-shopping-cart"></i> Cart
                                <span class="badge badge-light"> <%--<%=proInCart%>--%></span>
                            </a>                          
                        </form>
                        <%--    <% if (acc != null) { %>  --%>
                        <li class="nav-item">
                            <a class="icon-link d-flex align-items-center my-2 ml-5" href="userprofile"> 
                                <span>
                                    <svg xmlns="http://www.w3.org/2000/svg" width="30" height="30" fill="currentColor" class="bi bi-person-vcard" viewBox="0 0 16 16">
                                    <path d="M5 8a2 2 0 1 0 0-4 2 2 0 0 0 0 4m4-2.5a.5.5 0 0 1 .5-.5h4a.5.5 0 0 1 0 1h-4a.5.5 0 0 1-.5-.5M9 8a.5.5 0 0 1 .5-.5h4a.5.5 0 0 1 0 1h-4A.5.5 0 0 1 9 8m1 2.5a.5.5 0 0 1 .5-.5h3a.5.5 0 0 1 0 1h-3a.5.5 0 0 1-.5-.5"/>
                                    <path d="M2 2a2 2 0 0 0-2 2v8a2 2 0 0 0 2 2h12a2 2 0 0 0 2-2V4a2 2 0 0 0-2-2zM1 4a1 1 0 0 1 1-1h12a1 1 0 0 1 1 1v8a1 1 0 0 1-1 1H8.96q.04-.245.04-.5C9 10.567 7.21 9 5 9c-2.086 0-3.8 1.398-3.984 3.181A1 1 0 0 1 1 12z"/>
                                    </svg>
                                </span>
                                <span class="ml-2">Use Profile</span>
                            </a>
                        </li>   
                        <%--     <% } %>    --%>
                    </ul>
                </div>
            </div>
        </nav> 

        <header class="bg-dark py-5 mb-4">
            <div class="container px-4 px-lg-5 my-5">
                <div class="text-center text-white">
                    <h1 class="display-4 fw-bolder">Blog</h1> 
                </div>
            </div>
        </header>

        <div class="container">
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
