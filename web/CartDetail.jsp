<%-- 
    Document   : CartDetail
    Created on : Feb 7, 2024, 1:14:55 AM
    Author     : Admin
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="entity.Post" %>
<%@page import="entity.Cart" %>
<%@page import="java.util.Vector" %>
<%@page import="entity.Product" %>
<%@page import="entity.Category" %>
<%@page import="entity.Slider" %>
<%@ page import="java.util.Enumeration" %>

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
        <!------ Include the above in your HEAD tag ----------><meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <style>
            .submitbutton {
                background-color: #FF5757;
                color: white;
                border: none;
                padding: 10px 20px;
                font-size: 16px;
                cursor: pointer;
                transition: background-color 0.3s;
            }

            .submitbutton:hover {
                background-color: #FF3333;
            }
        </style>
    </head>
    <body>
        <%  
                    int i = 0;
//                    User acc = (User) session.getAttribute("user");
//                    String userRole = (String) session.getAttribute("role");
                    Vector<Category> listC =(Vector<Category>)request.getAttribute("listC");
                    Vector<Product> list5New =(Vector<Product>)request.getAttribute("5new");
                    Product p = (Product) request.getAttribute("p");
                    int tag = (int)request.getAttribute("tag");
                    Object value = request.getAttribute("txtS");
            String txtS;
                if(value==null){
                txtS="";
            }else txtS = (String)request.getAttribute("txtS");
        %>
        <jsp:include page="Header.jsp"></jsp:include> 

            <section class="h-100" style="background-color: #eee;">

                <div class="row">
                    <div class="col-md-3">
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
                </div>
                <div class="col-md-9 order-md-last">
                    <div class="card-body p-4">
                        <div class="row d-flex justify-content-between align-items-center">
                            <div class="col-md-5 col-lg-5 col-xl-5">Products </div>
                            <div class="col-md-3 col-lg-3 col-xl-2 d-flex">
                                Quantity
                            </div>
                            <div class="col-md-3 col-lg-2 col-xl-2 offset-lg-1">
                                Total
                            </div>                               
                            <div class="col-md-1 col-lg-1 col-xl-1 text-end">
                                Operation
                            </div>
                        </div>
                    </div>
                    <%
                    double totalprice = 0;
                    double discountprice = 0;

                    Vector<Cart> cart = (Vector<Cart>) session.getAttribute("cart");
                    for (Cart item : cart) {
                    %>                    
                    <div class="card w-100">
                        <div class="card-body p-4">
                            <div class="row d-flex justify-content-between align-items-center">
                                <div class="col-md-2 col-lg-2 col-xl-2">
                                    <img src="<%=item.getProducts().getImage()%>" class="img-fluid rounded-3" alt="Cotton T-shirt">
                                </div>
                                <div class="col-md-3 col-lg-3 col-xl-3">
                                    <p class="lead fw-normal mb-2"><%=item.getProducts().getTitle()%></p>
                                </div>
                                <div class="col-md-3 col-lg-3 col-xl-2 d-flex">
                                    <input value="<%= item.getQuantity()%>" type="number" class="form-control form-control-sm" readonly>
                                </div>

                                <div class="col-md-3 col-lg-2 col-xl-2 offset-lg-1">
                                    <del class="mb-0"><%=item.getProducts().getPrice()%>VND</del>
                                    <%
                                    discountprice +=  item.getProducts().getSalePrice() * item.getQuantity();
                                    totalprice +=  item.getProducts().getSalePrice() * item.getQuantity();
                                    %>
                                    <h5 style="color: red" class="mb-0"><%=item.getProducts().getSalePrice()%>VND</h5>
                                </div>                               
                                <div class="col-md-1 col-lg-1 col-xl-1 text-end">
                                    <a href="showCart?go=remove&id=<%=item.getProducts().getProductID()%>" class="text-danger"><i class="fas fa-trash fa-lg"></i></a>
                                </div>
                            </div>
                        </div> 
                    </div>
                    <%
                        }
                    // Tính tổng totalprice và giá trị shipping
                    totalprice += discountprice * 0.02;
                    session.setAttribute("totalprice", totalprice);
                    session.setAttribute("discountprice", discountprice);
                    %>
                    <div class="card w-100">
                        <div class="card-body p-4">
                            <form> 
                                <div style="display: flex; flex-direction: row; justify-content: space-between;">                             
                                    <div>                             
                                        <h2>Shopping Bill</h2>
                                        <table>
                                            <tbody>
                                                <tr>
                                                    <td>Price Shipping 2%</td>
                                                    <td align="right"><%= discountprice * 0.02 %>VND</td>
                                                </tr>
                                                <tr>
                                                    <td>Price Discount</td>
                                                    <td align="right"><%= discountprice %>VND</td>
                                                </tr>
                                            </tbody>
                                            <tfoot>
                                                <tr>
                                                    <td>Price Total</td>
                                                    <td align="right"><%= totalprice %>VND</td>
                                                </tr>
                                            </tfoot>
                                        </table>
                                    </div>
                                    <div class="col-2">
                                        <form action="showCart" method="post">
                                            <input type="hidden" name="go" value="removeAll">
                                            <button class="submitbutton flex-grow-1 mb-3 w-75" type="submit">Remove All</button>
                                        </form>
                                        <form action="checkout" method="post">
                                            <button class="submitbutton w-75" type="submit">Check out</button>
                                        </form>
                                    </div>
                                </div>
                            </form>
                        </div>
                    </div>   
                </div>
            </div>
            <div class="card col-md-12 w-75 m-auto">
                <div class="card-body p-4">           
                    <div class="showmore d-flex justify-content-end">
                        <div class="showmore-title">
                            <div>
                                <font style="vertical-align: inherit">
                                <font style="vertical-align: inherit"> You may also like </font>
                                </font>
                            </div>
                            <a class="seeall" href="products">
                                <font style="vertical-align: inherit;">
                                <font style="vertical-align: inherit;">See all >></font>
                                </font>
                            </a>
                        </div>
                    </div>               
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
                                    </div>
                                </div>
                            </div>
                        </div>
                        <%}%>
                    </div>
                </div> 
            </div>           
        </section>


        <jsp:include page="Footer.jsp"></jsp:include>
    </body>
</html>
