<%-- 
    Document   : CheckOut.jsp
    Created on : Feb 11, 2024, 6:00:26 AM
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
////            Vector<Product> listP =(Vector<Product>)request.getAttribute("listP");
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
            <!--end of menu-->
            <div class="container"> <%-- category --%> 
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
                            <del class="bloc_left_price">${p.price}</del>
                            <h3 class="bloc_left_price">${p.salePrice}</h3>
                        </div>
                    </div>

                </div>
                <div class="col-md-9">
                    <main role="main">
                        <div class="container mt-4">
                            <form class="needs-validation" name="frmthanhtoan" method="post"
                                  action="cartcompletion">
                                <input type="hidden" name="kh_tendangnhap" value="tqc">

                                <div class="py-5 text-center">
                                    <i class="fa fa-credit-card fa-4x" aria-hidden="true"></i>
                                    <h2>Thanh toán</h2>
                                    <p class="lead">Vui lòng kiểm tra thông tin Khách hàng, thông tin Giỏ hàng trước khi Đặt hàng.</p>
                                </div>

                                <div class="row">
                                    <div class="col-md-4 order-md-2 mb-4">
                                        <h4 class="d-flex justify-content-between align-items-center mb-3">
                                            <span class="text-muted">Giỏ hàng</span>
                                        </h4>
                                        <%
    double totalCost = 0; // Tổng thành tiền của giỏ hàng
    double totalCostOfProducts = 0; // Tổng thành tiền của các sản phẩm
    double shipFeeRate = 0.05; // Tỷ lệ phí ship (5%)
    double shipFee = 0; // Phí ship
    // Lấy thông tin từ request
    Object totalCostOfProductsObj = request.getAttribute("totalCostOfProducts");
    Object shipFeeObj = request.getAttribute("shipFee");

    // Ép kiểu từ Object sang double
    if(totalCostOfProductsObj != null) {
        totalCostOfProducts = (double) totalCostOfProductsObj;
    }

    if(shipFeeObj != null) {
        shipFee = (double) shipFeeObj;
    }
    Vector<Cart> cart = (Vector<Cart>) session.getAttribute("cart"); // Lấy thông tin giỏ hàng từ session

    if (cart != null && !cart.isEmpty()) { // Kiểm tra xem giỏ hàng có dữ liệu hay không
        for (Cart items : cart) { // Duyệt qua từng sản phẩm trong giỏ hàng
        totalCostOfProducts += items.getProducts().getSalePrice() * items.getQuantity();

                                        %>
                                        <ul class="list-group mb-3">
                                            <li class="list-group-item d-flex justify-content-between lh-condensed">
                                                <div>
                                                    <h6 class="my-0"><%= items.getProducts().getTitle() %></h6>
                                                    <small class="text-muted"><%= items.getProducts().getSalePrice() %>VND x <%= items.getQuantity() %></small>
                                                </div>
                                                <span class="text-muted"><%= items.getProducts().getSalePrice() * items.getQuantity() %>VND</span>
                                            </li>
                                            <%
                                                                                            }
                                            }
                                                shipFee = totalCostOfProducts * shipFeeRate; // Tính phí ship
                                                totalCost = totalCostOfProducts + shipFee; // Tính tổng giá trị cuối cùng của giỏ hàng bao gồm cả phí ship
                                            %>
                                            <li class="list-group-item d-flex justify-content-between">
                                                <div>Shipping Fee(5%):</div>
                                                <span><%= shipFee %>VND</span>
                                            </li>
                                            <li class="list-group-item d-flex justify-content-between">
                                                <div>Tổng thành tiền</div>
                                                <span name="total"><%= totalCost %>VND</span>
                                            </li>
                                        </ul>
                                            <input hidden="" name="total" type="text" value="<%= totalCost %>">
                                        <div class="input-group">
                                            <input type="text" class="form-control" placeholder="Mã khuyến mãi">
                                            <div class="input-group-append">
                                                <button type="submit" class="btn btn-secondary">Xác nhận</button>
                                            </div>
                                        </div>

                                    </div>
                                    <div class="col-md-8 order-md-1">
                                        <h4 class="mb-3">Thông tin khách hàng</h4>
                                        <input type="hidden" name="uid" value="${uid}">
                                        <form class="needs-validation" novalidate>
                                            <div class="row">
                                                <%
    // Kiểm tra xem người dùng đã đăng nhập chưa
    if (user != null) {
        // Lấy thông tin người dùng từ session
        String fullName = user.getFullName();
        boolean gender = user.isGender();
        String email = user.getEmail();
        String mobile = user.getPhone();
        String address = user.getAddress();
                                                %>
                                                <div class="col-md-12 mb-3">
                                                    <label for="full_name">Full Name</label>
                                                    <input name="full_name" type="text" class="form-control" id="full_name" placeholder="Enter your full name" required value="<%= fullName %>">
                                                    <div class="invalid-feedback">
                                                        Valid full name is required.
                                                    </div>
                                                </div>
                                                <div class="col-md-12 mb-3">
                                                    <label for="gender">Gender</label>
                                                    <select name="gender" class="custom-select d-block w-100" id="gender" required>
                                                        <option value="">Choose...</option>
                                                        <option value="1" <%= gender ? "selected" : "" %>>Male</option>
                                                        <option value="0" <%= !gender ? "selected" : "" %>>Female</option>
                                                    </select>
                                                    <div class="invalid-feedback">
                                                        Please select a valid gender.
                                                    </div>
                                                </div>
                                                <div class="col-md-12 mb-3">
                                                    <label for="email">Email</label>
                                                    <input name="email" type="email" class="form-control" id="email" placeholder="you@example.com" required value="<%= email %>">
                                                    <div class="invalid-feedback">
                                                        Please enter a valid email address.
                                                    </div>
                                                </div>
                                                <div class="col-md-12 mb-3">
                                                    <label for="mobile">Mobile</label>
                                                    <input name="mobile" type="text" class="form-control" id="mobile" placeholder="Enter your mobile number" required value="<%= mobile %>">
                                                    <div class="invalid-feedback">
                                                        Please enter your mobile number.
                                                    </div>
                                                </div>
                                                <div class="col-md-12 mb-3">
                                                    <label for="address">Address</label>
                                                    <input name="address" type="text" class="form-control" id="address" placeholder="Enter your address" required value="<%= address %>">
                                                    <div class="invalid-feedback">
                                                        Please enter your address.
                                                    </div>
                                                </div>
                                                <%
    } else {
                                                %>
                                                <div class="col-md-12 mb-3">
                                                    <label for="full_name">Full Name</label>
                                                    <input name="full_name" type="text" class="form-control" id="full_name" placeholder="Enter your full name" required>
                                                    <div class="invalid-feedback">
                                                        Valid full name is required.
                                                    </div>
                                                </div>
                                                <div class="col-md-12 mb-3">
                                                    <label for="gender">Gender</label>
                                                    <select name="gender" class="custom-select d-block w-100" id="gender" required>
                                                        <option value="">Choose...</option>
                                                        <option>Male</option>
                                                        <option>Female</option>
                                                    </select>
                                                    <div class="invalid-feedback">
                                                        Please select a valid gender.
                                                    </div>
                                                </div>
                                                <div class="col-md-12 mb-3">
                                                    <label for="email">Email</label>
                                                    <input name="email" type="email" class="form-control" id="email" placeholder="you@example.com" required>
                                                    <div class="invalid-feedback">
                                                        Please enter a valid email address.
                                                    </div>
                                                </div>
                                                <div class="col-md-12 mb-3">
                                                    <label for="mobile">Mobile</label>
                                                    <input name="mobile" type="text" class="form-control" id="mobile" placeholder="Enter your mobile number" required>
                                                    <div class="invalid-feedback">
                                                        Please enter your mobile number.
                                                    </div>
                                                </div>
                                                <div class="col-md-12 mb-3">
                                                    <label for="address">Address</label>
                                                    <input name="address" type="text" class="form-control" id="address" placeholder="Enter your address" required>
                                                    <div class="invalid-feedback">
                                                        Please enter your address.
                                                    </div>
                                                </div>
                                                <%
                                                    }
                                                %>
                                                <div class="col-md-12 mb-3">
                                                    <label for="notes">Notes</label>
                                                    <textarea name="notes" class="form-control" id="notes" placeholder="Enter any notes"></textarea>
                                                </div>
                                            </div>
                                        </form>

                                        <h4 class="mb-3">Hình thức thanh toán</h4>

                                        <div class="d-block my-3">
                                            <div class="custom-control custom-radio">
                                                <input id="httt-2" name="httt_ma" type="radio" class="custom-control-input" required=""
                                                       value="1">
                                                <label class="custom-control-label" for="httt-2">Chuyển khoản</label>
                                            </div>
                                            <div class="custom-control custom-radio">
                                                <input id="httt-3" name="httt_ma" type="radio" class="custom-control-input" required=""
                                                       value="2">
                                                <label class="custom-control-label" for="httt-3">Ship COD</label>
                                            </div>
                                        </div>
                                        <hr class="mb-4">
                                        <button class="btn btn-primary btn-lg btn-block" type="submit" name="btnDatHang">Đặt hàng</button>
                                    </div>
                                </div>
                            </form>
                            <form action="showCart" method="post">
                                <button class="submitbutton w-100 mt-3" type="submit">Change</button>
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
