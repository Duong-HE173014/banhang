<%-- 
    Document   : CartCompletion
    Created on : Feb 22, 2024, 11:13:16 AM
    Author     : pc
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.util.Vector" %>
<%@page import="entity.Product" %>
<%@page import="entity.Category" %>
<%@page import="entity.User"%>
<%@page import="entity.Cart"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <%  
            int i = 0;
            User user = (User) session.getAttribute("user");
//            String userRole = (String) session.getAttribute("role");
//            Vector<Product> listP =(Vector<Product>)request.getAttribute("listP");
            Vector<Category> listC =(Vector<Category>)request.getAttribute("listC");
            Product last = (Product)request.getAttribute("p");
            int tag = 0; // Default value
            Object tagObject = request.getAttribute("tag");
            if (tagObject != null && tagObject instanceof Integer) {
                tag = (Integer) tagObject;
            }
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
                <div class="col-md-4">
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
                            <del class="bloc_left_price">${p.price}</del>
                            <h3 class="bloc_left_price">${p.salePrice}</h3>
                        </div>
                    </div>

                </div>
                <div class="col-md-8">
                    <main role="main">
                        <div class="container mt-4">
                            <form class="needs-validation" name="ordercompleted" method="post"
                                  action="cartcompletion">
                                <input type="hidden" name="kh_tendangnhap" value="tqc">

                                <div class="py-5 text-center">
                                    <i class="fa fa-credit-card fa-4x" aria-hidden="true"></i>
                                    <h2>Successfully!</h2>
                                    <p class="lead">Bạn đã đặt hàng thành công. Dưới đây là thông tin của bạn.</p>
                                </div>
                                <div class="row">
                                    <div class="col-md-8 order-md-1">
                                        <h4 class="mb-3">Thông tin khách hàng</h4>

                                        <form class="needs-validation" novalidate>
                                            <div class="row">
                                                <div class="col-md-12 mb-3">
                                                    <label for="full_name">Full Name</label>
                                                    <div></div>
                                                </div>
                                                <div class="col-md-12 mb-3">
                                                    <label for="gender">Gender</label>
                                                    
                                                </div>
                                                <div class="col-md-12 mb-3">
                                                    <label for="email">Email</label>
                                                </div>
                                                <div class="col-md-12 mb-3">
                                                    <label for="mobile">Mobile</label>
                                                </div>
                                                <div class="col-md-12 mb-3">
                                                    <label for="address">Address</label>
                                                </div>
                                                <div class="col-md-12 mb-3">
                                                    <label for="notes">Notes</label>
                                                </div>
                                            </div>
                                        </form>
                                    <div class="col-md-4 order-md-2 mb-4">
                                        <h4 class="d-flex justify-content-between align-items-center mb-3">
                                            <span class="text-muted">Đơn hàng:</span>
                                        </h4>
                                       
                                        <ul class="list-group mb-3">
                                            <li class="list-group-item d-flex justify-content-between lh-condensed">
                                                <div>
                                                    <h6 class="my-0"><%= items.getProducts().getTitle() %></h6>
                                                    <small class="text-muted"><%= items.getProducts().getSalePrice() %>VND x <%= items.getQuantity() %></small>
                                                </div>
                                                <span class="text-muted"><%= items.getProducts().getSalePrice() * items.getQuantity() %>VND</span>
                                            </li>
                                            <li class="list-group-item d-flex justify-content-between">
                                                <div>Shipping Fee(5%):</div>
                                                <span><%= shipFee %>VND</span>
                                            </li>
                                            <li class="list-group-item d-flex justify-content-between">
                                                <div>Tổng thành tiền</div>
                                                <strong><%= totalCost %>VND</strong>
                                            </li>
                                        </ul>
                                    </div>
                                    

                                        <h4 class="mb-3">Hình thức thanh toán</h4>
                                        <div></div>
                                        <hr class="mb-4">
                                        <button class="btn btn-primary btn-lg btn-block" type="submit" name="btnDatHang">Đặt hàng</button>
                                    </div>
                                </div>
                            </form>
                            
                        </div>
                    </main>
                </div>
            </div>
        </div>
        <!-- đáy -->
        <jsp:include page="Footer.jsp"></jsp:include>
    </body>
</html>
