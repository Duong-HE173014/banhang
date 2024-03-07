<%-- 
    Document   : EditCustomer
    Created on : Feb 23, 2024, 3:16:53 AM
    Author     : Admin
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="entity.User" %>
<%@page import="java.util.Vector" %>
<%@page import="java.sql.ResultSet" %>
<%@page import="java.util.HashMap" %>

<!DOCTYPE html> 

<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <link href="//cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-T3c6CoIi6uLrA9TneNEoa7RxnatzjcDSCmG1MXxSR1GAsXEV/Dwwykc2MPK8M2HN" crossorigin="anonymous">
        <script src="//cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-C6RzsynM9kWDrMNeT87bh95OGNyZPhcTNXj1NW7RuBCsyN/o0jlpcV8Qyq46cDfL" crossorigin="anonymous"></script>
        <link href="//cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.4/css/all.min.css" rel="stylesheet">
        <link rel="stylesheet" href="https://fonts.googleapis.com/icon?family=Material+Icons">
        <script src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>       
        <script src="js/script.js"></script>
    </head>
    <style>
        .tablehis{
            margin-top: 120px;
        }
        .conDetailCus{
            margin-top: 50px;
        }
    </style>
    <body>
        <jsp:include page="Menu.jsp"></jsp:include>
            <section class="home-section">
            <%
            ResultSet rsHistory = (ResultSet)request.getAttribute("rsHistory");
            ResultSet detail = (ResultSet)request.getAttribute("detail");
            ResultSet cus = (ResultSet)request.getAttribute("cus");
            String gender = "";    
            %>
            <div class="container">
                <div class="row">
                    <div class="col-sm-6">
                        <div class="table-wrapper conDetailCus">
                            <div class="table-title">
                                <div class="row">
                                    <div class="col-sm-6">
                                        <h2><b>Detail Customer</b></h2>

                                    </div>
                                    <div class="col-sm-6">
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div id="editEmployeeModal">
                            <div class="modal-dialog">
                                <div class="modal-content">
                                    <form action="managerbill" method="post">
                                        <% while(detail.next()){
                             gender = detail.getBoolean("Gender") ? "Male" : "Female";%>
                                        <div class="formbold-mb-3">
                                            <div>
                                                <label for="firstname" class="formbold-form-label">
                                                    Full Name
                                                </label>
                                                <textarea name="name" class="form-control" readonly required><%=detail.getString(2)%></textarea>
                                            </div>  
                                            <div>
                                                <label for="email" class="formbold-form-label"> Gender </label>                                   
                                                <textarea name="Gender" class="form-control" readonly required><%= gender %></textarea>
                                            </div>
                                        </div>

                                        <div class="formbold-input-flex">
                                            <div>
                                                <label for="email" class="formbold-form-label"> Email </label>
                                                <textarea name="Email" class="form-control" readonly required><%=detail.getString(4)%></textarea>
                                            </div>
                                            <div>
                                                <label for="phone" class="formbold-form-label"> Phone number </label>
                                                <textarea name="Phone Number" class="form-control" readonly required><%=detail.getString(6)%></textarea>
                                            </div>
                                        </div>

                                        <div class="formbold-mb-3">
                                            <label for="address" class="formbold-form-label">
                                                Address
                                            </label>
                                            <textarea name="Address" class="form-control" readonly required><%=detail.getString(5)%></textarea>
                                        </div>

                                        <div class="formbold-mb-3">
                                            <label for="address2" class="formbold-form-label">
                                                Note
                                            </label>
                                            <textarea name="Note" class="form-control" readonly required><%=detail.getString(7)%></textarea>
                                        </div>

                                        <!-- Status dropdown -->
                                        <div class="form-group">
                                            <label for="status" class="formbold-form-label">Status</label>
                                            <% if (detail.getInt(8) == 1) { %>
                                            <textarea name="Note" class="form-control" readonly required>VIP</textarea>
                                            <% } else if (detail.getInt(8) == 2) { %>
                                            <textarea name="Note" class="form-control" readonly required>Normal</textarea>                                            
                                            <% } %>
                                        </div>
                                        <%}%>
                                    </form>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="col-sm-6">
                        <table class="table tablehis">
                            <thead>
                                <tr>
                                    <th>Date</th>
                                    <th>From</th>
                                    <th>To</th>
                                </tr>
                            </thead>
                            <tbody>
                                <% while (rsHistory.next()) { %>
                                <% 
                                    String oldStatusID = rsHistory.getString("OldStatusID");
                                    String newStatusID = rsHistory.getString("NewStatusID");
                                    String changedDate = rsHistory.getString("ChangedDate");
                                    String oldStatus = (oldStatusID.equals("1")) ? "VIP" : "Normal";
                                    String newStatus = (newStatusID.equals("1")) ? "VIP" : "Normal";
                                %>
                                <tr>
                                    <td><%= changedDate %></td>
                                    <td><%= oldStatus %></td>
                                    <td><%= newStatus %></td>
                                </tr>
                                <% } %>
                            </tbody>
                        </table>
                    </div>


                </div>
            </div>
        </section>
    </body>
</html>


