<%-- 
    Document   : Header
    Created on : Feb 2, 2024, 10:32:27 AM
    Author     : Admin
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.util.Vector" %>
<%@page import="entity.Product" %>
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
        <link href="css/menu.css" rel="stylesheet" type="text/css"/>
        <link href='https://unpkg.com/boxicons@2.0.7/css/boxicons.min.css' rel='stylesheet'>
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        

    </head>
    
  
    <body>
        <%  
            String userRole = (String) session.getAttribute("role");           
            User acc = (User) session.getAttribute("user");           
        %>
        <div class="sidebar">
            <div class="logo-details">              
                <div class="logo_name">Manager</div>
                <i class='bx bx-menu' id="btn" ></i>
            </div>
            <ul class="nav-list"> 
                <%if(acc != null){%> 
                <%if("Saler".equals(userRole)){%> 
                <li>
                    <a href="salerDashboard">
                        <i class='bx bx-grid-alt'></i>
                        <span class="links_name">Dashboard</span>
                    </a>
                    <span class="tooltip">Dashboard</span>
                </li>
                <li>
                    <a href="userprofile">
                        <i class='bx bx-user' ></i>
                        <span class="links_name">User</span>
                    </a>
                    <span class="tooltip">User</span>
                </li>      
                <li>
                    <a href="salerOrderListControl">
                        <i class='bx bx-cart-alt' ></i>
                        <span class="links_name">Manager Order</span>
                    </a>
                    <span class="tooltip">Manager Order</span>
                </li>
                <%}%>
                <%if("Admin".equals(userRole)){%>                           
                <li>
                    <a href="#">
                        <i class='bx bx-grid-alt'></i>
                        <span class="links_name">Dashboard</span>
                    </a>
                    <span class="tooltip">Dashboard</span>
                </li>
                <li>
                    <a href="#">
                        <i class='bx bx-user' ></i>
                        <span class="links_name">User</span>
                    </a>
                    <span class="tooltip">User</span>
                </li>                    
                <li>
                    <a href="#">
                        <i class='bx bx-cart-alt' ></i>
                        <span class="links_name">Order</span>
                    </a>
                    <span class="tooltip">Order</span>
                </li>

                <li>
                    <a href="#">
                        <i class='bx bx-cog' ></i>
                        <span class="links_name">Setting</span>
                    </a>
                    <span class="tooltip">Setting</span>
                </li>


                <%}%>
                <%if("Marketing".equals(userRole)){%>               
                <li>
                    <a href="mktdashboard">
                        <i class='bx bx-grid-alt'></i>
                        <span class="links_name">Dashboard</span>
                    </a>
                    <span class="tooltip">Dashboard</span>
                </li>
                <li>
                    <a href="userprofile">
                        <i class='bx bx-user' ></i>
                        <span class="links_name">User</span>
                    </a>
                    <span class="tooltip">User</span>
                </li>
                <li>
                    <a href="mktCustomerList">
                        <i class='bx bx-pie-chart-alt-2' ></i>
                        <span class="links_name">Customer List</span>
                    </a>
                    <span class="tooltip">Customer List</span>
                </li>
                <li>
                    <a href="#">
                        <i class='bx bxs-parking'></i>
                        <span class="links_name">Post list</span>
                    </a>
                    <span class="tooltip">Post list</span>
                </li>
                <li>
                    <a href="#">
                        <i class='bx bx-cart-alt' ></i>
                        <span class="links_name">Product</span>
                    </a>
                    <span class="tooltip">Manager Product</span>
                </li>
                <li>
                    <a href="feedList">
                        <i class='bx bx-heart' ></i>
                        <span class="links_name">Feed List</span>
                    </a>
                    <span class="tooltip">Feed List</span>
                </li>
                <%}%>
                <%if("SaleManager".equals(userRole)){%> 
                <li>
                    <a href="#">
                        <i class='bx bx-grid-alt'></i>
                        <span class="links_name">Dashboard</span>
                    </a>
                    <span class="tooltip">Dashboard</span>
                </li>
                <li>
                    <a href="userprofile">
                        <i class='bx bx-user' ></i>
                        <span class="links_name">User</span>
                    </a>
                    <span class="tooltip">User</span>
                </li>
                <%}%>

                <li class="profile">     
                    <a  href="logout">
                        <i id="log_out" class='bx bx-log-out'></i>
                    </a>
                </li>
                <%}%>
            </ul>
        </div>



        <script>
            let sidebar = document.querySelector(".sidebar");
            let closeBtn = document.querySelector("#btn");
            let searchBtn = document.querySelector(".bx-search");

            closeBtn.addEventListener("click", () => {
                sidebar.classList.toggle("open");
                menuBtnChange();//calling the function(optional)
            });

            searchBtn.addEventListener("click", () => { // Sidebar open when you click on the search iocn
                sidebar.classList.toggle("open");
                menuBtnChange(); //calling the function(optional)
            });
            
            
            // following are the code to change sidebar button(optional)
            function menuBtnChange() {
                if (sidebar.classList.contains("open")) {
                    closeBtn.classList.replace("bx-menu", "bx-menu-alt-right");//replacing the iocns class
                } else {
                    closeBtn.classList.replace("bx-menu-alt-right", "bx-menu");//replacing the iocns class
                }
            }
        </script>
    </body>
</html>
