<%-- 
    Document   : ProductDetail
    Created on : Jan 11, 2024, 12:12:55 PM
    Author     : Admin
--%>

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
    </head>
    <body>
        <%             
            int i = 0;
            Post lastPost = (Post)request.getAttribute("lPost");
            Vector<Slider> listS = (Vector<Slider>)request.getAttribute("listS");
            Product detail = (Product)request.getAttribute("detail");
            Vector<Category> listC =(Vector<Category>)request.getAttribute("listC");
            Product last = (Product)request.getAttribute("p");
            int tag = 0;
            Object value = request.getAttribute("txtS");
            String txtS;
                if(value==null){
                txtS="";
            }else txtS = (String)request.getAttribute("txtS");
        %>
<jsp:include page="Header.jsp"></jsp:include>    
            

        <!--end of menu-->
        
        <div class="container"> <%-- category --%> 
            <div class="row">
                <div class="col-sm-3">
                    <div class="card bg-light mb-2">
                        <div class="card-header bg-dark text-white text-uppercase"><i class="fa fa-list"></i> Categories</div>
                        <ul class="list-group category_block">
                            <%for (Category cat : listC){%>
                            <li class="list-group-item text-white <%=cat.getCategoryId()==tag?"active":""%>"><a class="text-decoration-none" href="category?cid=<%=cat.getCategoryId()%>"><%=cat.getCategoryName()%></a></li>
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
               <div class="col-sm-9"> <%--detail--%>
                    <div class="card">
                        <div class="row">
                            <aside class="col-sm-5 border-end">
                                <article class="gallery-wrap"> 
                                    <div class="img-big-wrap">
                                        <div> <a href="#"><img src="<%=detail.getImage()%>" class="img-fluid"></a></div>
                                    </div> <!-- slider-detail -->

                                </article> 
                            </aside>
                            <aside class="col-sm-7">
                                <article class="card-body p-5">
                                    <h3 class="title mb-3"><%=detail.getTitle()%></h3>

                                    <p class="price-detail-wrap"> 
                                        <span class="price h3 text-warning"> 
                                            <del class="num"><%=detail.getPrice()%>VND</del> <span class="num"> <%=detail.getSalePrice()%>VND</span>
                                        </span> 
                                    </p> <!-- price-detail-wrap .// -->
                                    <dl class="item-detailperty">
                                        <dt>Description</dt>
                                        <dd><p>
                                                <%=detail. getDescription()%>
                                            </p></dd>
                                    </dl>
                                    <hr>
                                    <form action="checkout" method="post">
                                        <input type="hidden" name="go" value="buynow">
                                        <a href="showCart?go=addInDetail&id=<%=detail.getProductID()%>" class="btn btn-lg btn-outline-primary text-uppercase"> <i class="fas fa-shopping-cart"></i> Add to cart </a>
                                    </form>
                                </article> <!-- card-body.// -->
                            </aside> <!-- col.// -->
                        </div> <!-- row.// -->
                    </div> <!-- card.// -->
                </div>
            </div>
        </div>
        <jsp:include page="Footer.jsp"></jsp:include>
    </body>
</html>
