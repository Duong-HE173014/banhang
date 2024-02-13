<%-- 
    Document   : UserProfile
    Created on : Jan 17, 2024, 7:59:51 AM
    Author     : Hi
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <link href="//cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-T3c6CoIi6uLrA9TneNEoa7RxnatzjcDSCmG1MXxSR1GAsXEV/Dwwykc2MPK8M2HN" crossorigin="anonymous">
        <script src="//cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-C6RzsynM9kWDrMNeT87bh95OGNyZPhcTNXj1NW7RuBCsyN/o0jlpcV8Qyq46cDfL" crossorigin="anonymous"></script>
        <link href="//cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.4/css/all.min.css" rel="stylesheet">
        <script src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
        <!------ Include the above in your HEAD tag ---------->
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
                </div>
            </div>
        </nav>
        <div class="container">
            <div class="main-body">
                <div class="row">

                    <c:if test="${param.successcp ne null}">
                        <div class="alert alert-success" role="alert">
                            Change password success!
                        </div>
                    </c:if>
                    <c:if test="${param.failcp ne null}">
                        <div class="alert alert-danger" role="alert">
                            Wrong old password!
                        </div>
                    </c:if>

                    <form action="userprofile" method="post">
                        <div class="col-lg-10">
                            <div class="card" var="o">
                                <div class="card-body">
                                    <div class="col-lg-5">
                                        <div class="card">
                                            <div class="card-body">
                                                <div class="d-flex flex-column align-items-center text-center">
                                                    <img src="${user.image}" alt="Admin" class="rounded-circle p-1 bg-primary" width="110">
                                                    <div class="mb-3" style="display: flex">
                                                        <h4>Change img:</h4>
                                                        <input type="url" name="image">
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="row mb-3">
                                        <div class="col-sm-3">
                                            <h6 class="mb-0">Full Name</h6>
                                        </div>
                                        <div class="col-sm-9 text-secondary">
                                            <input name="fullname"  type="text" class="form-control" value="${user.fullName}" >
                                        </div>
                                    </div>
                                    <div class="row mb-3">
                                        <div class="col-sm-3">
                                            <h6 class="mb-0">Password</h6>
                                        </div>
                                        <div class="col-sm-9 text-secondary">
                                            <input name="password" type="text" class="form-control" value="${user.password}">
                                        </div>
                                    </div>
                                    <div class="row mb-3">
                                        <div class="col-sm-3">
                                            <h6 class="mb-0">Email</h6>
                                        </div>
                                        <div class="col-sm-9 text-secondary">
                                            <input name="email" type="text" class="form-control" value="${user.email}">
                                        </div>
                                    </div>

                                    <div class="row">
                                        <div class="col-sm-3"></div>
                                        <div class="col-sm-9 text-secondary">
                                            <input type="submit" class="btn btn-primary px-4" value="Update" />
                                            <button type="button" class="btn btn-primary" data-toggle="modal" data-target="#changePasswordModal">
                                                Change Password
                                            </button>
                                        </div>


                                    </div>

                                </div>
                            </div>
                        </div>
                    </form>



                </div>
            </div>
        </div> 


        <!-- Change Password Modal -->
        <div class="modal" id="changePasswordModal" tabindex="-1" role="dialog" aria-labelledby="changePasswordModalLabel" aria-hidden="true">
            <div class="modal-dialog" role="document">
                <div class="modal-content">
                    <div class="modal-header">
                        <h5 class="modal-title" id="changePasswordModalLabel">Change Password</h5>
                        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                            <span aria-hidden="true">&times;</span>
                        </button>
                    </div>
                    <div class="modal-body">
                        <!-- Change Password Form -->
                        <form id="changePasswordForm" action="change-password" method="post">
                            <div class="form-group">
                                <label for="currentPassword">Current Password</label>
                                <input type="password" class="form-control" id="currentPassword" name="oldpassword" required>
                            </div>
                            <div class="form-group">
                                <label for="newPassword">New Password</label>
                                <input type="password" class="form-control" id="newPassword" name="password" required>
                            </div>
                            <div class="form-group">
                                <label for="confirmPassword">Confirm New Password</label>
                                <input type="password" class="form-control" id="confirmPassword" name="repassword" required>
                            </div>
                            <button type="submit" class="btn btn-primary mt-3">Change Password</button>
                        </form>
                    </div>
                </div>
            </div>
        </div>

        <!-- Add Bootstrap JS and Popper.js -->
        <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
        <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.5.2/dist/umd/popper.min.js"></script>
        <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>

        <!-- JavaScript to handle form submission -->
        <script>
            document.getElementById('changePasswordForm').addEventListener('submit', function (event) {
                event.preventDefault();

                // Get input values
                const newPassword = document.getElementById('newPassword').value;
                const confirmPassword = document.getElementById('confirmPassword').value;

                // Check if passwords match
                if (newPassword != confirmPassword) {
                    alert('2 passwords do not match. Please try again.');
                } else if (newPassword.length < 8 || confirmPassword.length < 8) {
                    alert('Passwords must be more than 8 character');
                } else
                    document.getElementById('changePasswordForm').submit();
            });
        </script>


    </body>
</html>

