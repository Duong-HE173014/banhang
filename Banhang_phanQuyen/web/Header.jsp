<%-- 
    Document   : Header
    Created on : Feb 2, 2024, 10:32:27 AM
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
    </head>
    <body>
        <%  
            String userRole = (String) session.getAttribute("role");
            User acc = (User) session.getAttribute("user");
            Object value = request.getAttribute("txtS");
            String txtS;
                    if(value==null){
                    txtS="";
                }else txtS = (String)request.getAttribute("txtS");
        %>
        <nav class="navbar navbar-expand-md navbar-dark bg-dark">
            <div class="container-fluid">
                <a class="navbar-brand mx-5" href="home">Shop</a>
                <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarsExampleDefault" aria-controls="navbarsExampleDefault" aria-expanded="false" aria-label="Toggle navigation">
                    <span class="navbar-toggler-icon"></span>
                </button>

                <div class="collapse navbar-collapse" id="navbarsExampleDefault">
                    <form action="search" method="post" class="form-inline my-2 my-lg-0 mx-5 w-50">
                        <div class="input-group input-group-sm">
                            <input value ="<%=txtS%>"  name="txt" type="text" class="form-control" aria-label="Small" aria-describedby="inputGroup-sizing-sm" placeholder="Search...">
                            <div class="input-group-append">
                                <button type="submit" class="btn btn-secondary btn-number">
                                    <i class="fa fa-search"></i>
                                </button>
                            </div>
                        </div>
                    </form>                                   

                    <div class="d-flex ms-auto">
                        <ul class="navbar-nav">
                            <%if(acc != null){%> 
                            <%if("Saler".equals(userRole)){%> 
                            <li class="nav-item">
                                <a class="nav-link" href="managerOrder">Manager Order</a>
                            </li>

                            <li class="nav-item">
                                <a class="nav-link" href="managerPro">Manager Product</a>    <%-- sản phẩm người đó bán --%>     
                            </li>

                            <%}%>
                            <%if("Admin".equals(userRole)){%>  
                            <li class="nav-item">
                                <a class="nav-link" href="managerAcc">Manager Account</a>
                            </li>
                            <li class="nav-item">
                                <a class="nav-link" href="adDashboard">Dashboard</a> 
                            </li>

                            <%}%>
                            <%if("Marketing".equals(userRole)){%>  
                            <li class="nav-item">
                                <a class="nav-link" href="postList">Post list</a>
                            </li>
                            <li class="nav-item">
                                <a class="nav-link" href="mktDashboard">Dashboard</a> 
                            </li>
                            <li class="nav-item">
                                <a class="nav-link" href="productList">All Product</a> <%-- tất cả sản phẩm --%> 
                            </li>
                            <li class="nav-item">
                                <a class="nav-link" href="customerList">Customer List</a>
                            </li>
                            <li class="nav-item">
                                <a class="nav-link" href="feedList">Feed List</a>
                            </li>

                            <%}%>
                            <%if("SaleManager".equals(userRole)){%> 
                            <li class="nav-item">
                                <a class="nav-link" href="manager">Manager All Product</a> <%-- tất cả sản phẩm --%> 
                            </li>
                            <li class="nav-item">
                                <a class="nav-link" href="smdashboard">Dashboard</a> 
                            </li>
                            <%}%>
              
                            <li class="nav-item">
                                <a class="nav-link" href="blog">Blog</a>
                            </li> 
                            <li class="nav-item">
                                <a class="nav-link" href="logout">Logout</a>
                            </li> 
                            
                            <%}%>       
                            <%if(acc == null){%>   
                            <li class="nav-item">
                                <a class="nav-link" href="blog">Blog</a>
                            </li> 
                            <li class="nav-item">
                                <a class="nav-link" href="login">Login</a>
                            </li>                                                                  
                            <%}%>                       
                        </ul>

                        <div class="d-flex align-items-center">
                            <a class="btn btn-success btn-md mx-2" href="show">
                                <i class="fa fa-shopping-cart"></i> Cart
                                <span class="badge badge-light"> <%--<%=proInCart%>--%></span>
                            </a>                          

                            <% if (acc != null) { %>                              
                            <a class="icon-link d-flex align-items-center my-2 ml-2" href="userprofile"> 
                                <div>
                                    <svg xmlns="http://www.w3.org/2000/svg" width="30" height="30" fill="currentColor" class="bi bi-person-vcard" viewBox="0 0 16 16">
                                    <path d="M5 8a2 2 0 1 0 0-4 2 2 0 0 0 0 4m4-2.5a.5.5 0 0 1 .5-.5h4a.5.5 0 0 1 0 1h-4a.5.5 0 0 1-.5-.5M9 8a.5.5 0 0 1 .5-.5h4a.5.5 0 0 1 0 1h-4A.5.5 0 0 1 9 8m1 2.5a.5.5 0 0 1 .5-.5h3a.5.5 0 0 1 0 1h-3a.5.5 0 0 1-.5-.5"/>
                                    <path d="M2 2a2 2 0 0 0-2 2v8a2 2 0 0 0 2 2h12a2 2 0 0 0 2-2V4a2 2 0 0 0-2-2zM1 4a1 1 0 0 1 1-1h12a1 1 0 0 1 1 1v8a1 1 0 0 1-1 1H8.96q.04-.245.04-.5C9 10.567 7.21 9 5 9c-2.086 0-3.8 1.398-3.984 3.181A1 1 0 0 1 1 12z"/>
                                    </svg>
                                </div>
                                <span class="ml-2">User Profile</span>
                            </a>
                            <% } %>    
                        </div>
                    </div>
                </div>
        </nav> 
    </body>
</html>
