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
            Post lastPost = (Post)request.getAttribute("lPost");
            Vector<Slider> listS = (Vector<Slider>)request.getAttribute("listS");
            Vector<Product> listP =(Vector<Product>)request.getAttribute("listP");
            Vector<Category> listC =(Vector<Category>)request.getAttribute("listC");
            Product last = (Product)request.getAttribute("p");
             int tag = (int)request.getAttribute("tag");
            Object value = request.getAttribute("txtS");
            String txtS;
                if(value==null){
                txtS="";
            }else txtS = (String)request.getAttribute("txtS");
        %>
        <jsp:include page="Header.jsp"></jsp:include>
        <div class="container">
            <div class="row">
                <div class="col">
                    <nav aria-label="breadcrumb">
                        <ol class="breadcrumb">
                            <li class="breadcrumb-item"><a href="home">Home</a></li>
                            <li class="breadcrumb-item"><a href="#">Category</a></li>
                            <li class="breadcrumb-item active" aria-current="#">Sub-category</li>
                        </ol>
                    </nav>
                </div>
            </div>
        </div>
        <div class="container"> <%-- category --%> 
            <div class="row">
                <div class="col-sm-3">
                    <div class="card bg-light mb-2">
                        <div class="card-header bg-dark text-white text-uppercase"><i class="fa fa-list"></i> Categories</div>
                        <ul class="list-group category_block">
                            <%for (Category cat : listC){%>
                            <li class="list-group-item text-white <%=cat.getCategoryId()==tag?"active":""%>"><a class="text-decoration-none" href="category?categoryId=<%=cat.getCategoryId()%>"><%=cat.getCategoryName()%></a></li>
                                <%}%>
                        </ul>
                    </div>   
                    <div class="card bg-light mb-3"> <%-- quảng cáo --%> 
                        <div class="card-header bg-dark text-white text-uppercase">Last product</div>
                        <div class="card-body">
                            <img class="img-fluid" src="${p.image}" />
                            <a class="nav-link" href="detail?pid=${p.productID}"> <h5 class="card-title">${p.title}</h5></a>
                            <p class="card-text">${p.briefInfo}</p>
                            <del class="bloc_left_price">${p.price}VND</del>
                            <h3 class="bloc_left_price">${p.salePrice}VND</h3>
                        </div>
                    </div>
                    <%-- post mới nhất --%>
                    <div class="card bg-light mb-3"> 
                        <div class="card-header bg-dark text-white text-uppercase">NEW POST</div>
                        <div class="card-body">                            
                            <img class="img-fluid" src="${lPost.postThumbnail}" />
                           <a class="nav-link" href="postDetail"> <h5 class="card-title">${lPost.pTitle}</h5></a>
                            <p class="card-text">${lPost.postAuthor}</p>
                            <p class="card-text">${lPost.postBriefInfo}</p>                           
                        </div>
                    </div>
                </div>


                <div class="col-sm-9"> <%-- show sản phẩm --%> 
                    <div class="row text-center">
                        <% for (Product pro : listP){%>
                        <div class="col-12 col-md-6 col-lg-3">
                            <div class="card cardp">
                                <img class="cardp-img-top" src="<%=pro.getImage()%>" alt="Card image cap">
                                <div class="cardp-body">
                                    <h4 class="cardp-title show_txt"><a class="text-decoration-none" href="detail?pid=<%=pro.getProductID()%>" title="View Product"><%=pro.getTitle()%></a></h4>
                                    <p class="cardp-text show_txt"><%=pro.getBriefInfo()%></p>
                                    <div class="row">                              
                                        <div class="col">
                                             <del class="cardp-text text-muted me-2"><%=pro.getPrice()%>VND</del>
                                             <h2 class="cardp-text" style="color: red"><%=pro.getSalePrice()%>VND</h2> 
                                        </div>
                                        <div class="col">
                                            <a href="showCart?go=add&id=<%=pro.getProductID()%>" class="btn btn-dark btn-block">Add to cart</a>
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
                        <div class="container-fluid text-center d-flex align-items-center justify-content-center">
                        <c:set var="page" value="${requestScope.page}" />
                        
                        <div class="pagination">
                            <h2>Page: </h2>
                            <c:forEach begin="${1}" end="${requestScope.num}" var="i">
                                <a href="products?page=${i}" class="${i==page?"active":""}" ><h5>${i}</h5> </a>
                            </c:forEach>
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
