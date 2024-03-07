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

        <script>  $(document).ready(function () {//edit
                // Activate tooltip
                $('[data-toggle="tooltip"]').tooltip();

                // Select/Deselect checkboxes
                var checkbox = $('table tbody input[type="checkbox"]');
                $("#selectAll").click(function () {
                    if (this.checked) {
                        checkbox.each(function () {
                            this.checked = true;
                        });
                    } else {
                        checkbox.each(function () {
                            this.checked = false;
                        });
                    }
                });
                checkbox.click(function () {
                    if (!this.checked) {
                        $("#selectAll").prop("checked", false);
                    }
                });
            });
        </script>
        <style>
        .small-modal .modal-dialog {
    max-width: 60%; /* Thiết lập chiều rộng tối đa của modal */
}
        </style>
    </head>
    <body>
        <%
        ResultSet detail = (ResultSet)request.getAttribute("detail");
        ResultSet cus = (ResultSet)request.getAttribute("cus");
        String gender = "";    
        %>
        <jsp:include page="Menu.jsp"></jsp:include>
        <section class="home-section">
        <div class="container">
           
            <div id="editEmployeeModal" class="small-modal">
                <div class="modal-dialog">
                    <div class="modal-content">
                        <form action="mktCustomerList" method="post">
                            <% while(detail.next()){
                             gender = detail.getBoolean("Gender") ? "Male" : "Female";%>
                            <input type="hidden" name="go" value="edit">
                            <input type="hidden" name="oldStatus" value="<%= detail.getInt(8) %>">
                            <div class="modal-header">						
                                <h4 class="modal-title"><b>CUSTOMER</b></h4>
                                <a href="mktCustomerList" type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</a>
                            </div>

                            <div class="modal-body">					
                                <div class="form-group">
                                    <label>ID</label>
                                    <input value="<%=detail.getInt(1)%>" name="id" type="text" class="form-control" readonly required>
                                </div>

                                <div class="form-group">
                                    <label>Full Name</label>
                                    <textarea name="name" class="form-control" readonly required><%=detail.getString(2)%></textarea>
                                </div>
                                <div class="form-group">
                                    <label>Gender</label>
                                    <textarea name="Gender" class="form-control" readonly required><%= gender %></textarea>
                                </div>
                                <div class="form-group">
                                    <label>Email</label>
                                    <textarea name="Email" class="form-control" 
                                              readonly required><%=detail.getString(4)%></textarea>
                                </div>
                                <div class="form-group">
                                    <label>Address</label>
                                    <textarea name="Address" class="form-control" readonly required><%=detail.getString(5)%></textarea>
                                </div>
                                <div class="form-group">
                                    <label>Phone Number</label>
                                    <textarea name="Phone Number" class="form-control" readonly required><%=detail.getString(6)%></textarea>
                                </div>
                                <div class="form-group">
                                    <label>Note</label>
                                    <textarea name="Phone Number" class="form-control" readonly required><%=detail.getString(7)%></textarea>
                                </div>
                                <div class="form-group">
                                    <label>Status</label>
                                    <select name="status" class="form-select">
                                        <option value="1" <%=detail.getInt(8)==1?"selected":""%>>VIP</option>
                                        <option value="2" <%=detail.getInt(8)==2?"selected":""%>>Normal</option>
                                    </select>
                                </div>
                            </div>
                            <%}%>
                           
                            <div class="modal-footer">
                                <input type="submit" name="submit" class="btn btn-success" value="Edit">
                            </div>
                        </form>
                    </div>
                </div>
            </div>

        </div>
</section>
    </body>
</html>


