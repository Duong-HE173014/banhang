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
                <div>

                </div>
            </div>
        </div>
        <!-- đáy -->
        <jsp:include page="Footer.jsp"></jsp:include>
    </body>
</html>
