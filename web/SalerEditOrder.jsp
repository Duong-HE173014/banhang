<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.util.Vector" %>
<%@page import="java.sql.ResultSet" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <link href="//cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-T3c6CoIi6uLrA9TneNEoa7RxnatzjcDSCmG1MXxSR1GAsXEV/Dwwykc2MPK8M2HN" crossorigin="anonymous">
        <script src="//cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-C6RzsynM9kWDrMNeT87bh95OGNyZPhcTNXj1NW7RuBCsyN/o0jlpcV8Qyq46cDfL" crossorigin="anonymous"></script>
        <link href="//cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.4/css/all.min.css" rel="stylesheet">
        <script src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
        <style>
            .small-container {
                max-width: 300px; /* Đặt kích thước tối đa cho container */
                margin: 0 auto; /* Căn giữa container */
            }
        </style>
    </head>
    <body>
        <jsp:include page="Menu.jsp"></jsp:include> 
        <%
            ResultSet detail = (ResultSet) request.getAttribute("detail");  
            if (detail != null && detail.next()) {
        %>
        <section class="home-section">
            <div class="container small-container"> 
                <form action="salerEditOrder" method="post">
                    <input name="salerID"  type="hidden" class="form-control" value="${user.userID}" >  
                    <div class="modal-header">
                        <h5 class="modal-title" id="productModalLabel">Order Information</h5>
                        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                            <span aria-hidden="true">&times;</span>
                        </button>
                    </div>
                    <div class="modal-body">
                        <div class="form-group mb-3"> 
                            <label class="mb-1">Order ID</label> 
                            <input value="<%=detail.getInt(1)%>" name="id" type="text" class="form-control form-control-sm" readonly required>
                        </div>
                        <label class="mb-2">Detail</label> 
                        <div class="table-responsive">
                            <table class="table table-sm"> 
                                <thead>
                                    <tr>
                                        <th scope="col" class="border-0 bg-light">
                                            <div class="py-1 text-uppercase">Product Name</div>
                                        </th>
                                        <th scope="col" class="border-0 bg-light">
                                            <div class="py-1 text-uppercase">Product</div>
                                        </th>
                                        <th scope="col" class="border-0 bg-light">
                                            <div class="py-1 text-uppercase">Receiver Name</div> 
                                        </th>
                                    </tr>
                                </thead>
                                <tbody>
                                    <tr>
                                        <td class="align-middle"><strong><%=detail.getString(11)%></strong></td>
                                        <td class="align-middle"><strong><%=detail.getString(12)%></strong></td>
                                        <td class="align-middle"><strong><%=detail.getString(5)%></strong></td>
                                    </tr>

                                </tbody>
                            </table>
                            <table class="table table-sm">   
                                <tr>
                                    <th scope="col" class="border-0 bg-light">
                                        <div class="py-1 text-uppercase">Total Cost</div>
                                    </th>
                                    <th scope="col" class="border-0 bg-light">
                                        <div class="py-1 text-uppercase">Order Date</div>
                                    </th>

                                </tr>
                                </thead>
                                <tbody>
                                    <tr>
                                        <td class="align-middle"><strong><%=detail.getString(3)%> VND</strong></td>
                                        <td class="align-middle"><strong><%=detail.getString(2)%></strong></td>
                                    </tr>
                                </tbody>
                            </table>
                        </div>
                        <div class="form-group mb-3">                            
                            <div class="row">
                                <div class="col">
                                    <label class="mb-1">Receiver Email</label>
                                    <textarea name="email" class="form-control form-control-sm" readonly required><%= detail.getString(6) %></textarea>
                                </div>
                                <div class="col">
                                    <label class="mb-1">Receiver Number</label> 
                                    <textarea name="number" class="form-control form-control-sm" readonly required><%= detail.getString(7) %></textarea>
                                </div>
                            </div>
                        </div>
                        <div class="form-group mb-3"> 
                            <label class="mb-1">Receiver Address</label> 
                            <textarea name="date" class="form-control form-control-sm" readonly required><%=detail.getString(8)%></textarea>
                        </div>                        
                        <div class="form-group mb-3">
                            <label class="mb-1">Customer Note</label> 
                            <textarea name="total" class="form-control form-control-sm" readonly required><%=detail.getString(10)%></textarea>
                        </div>
                        <div class="form-group mb-3"> 
                            <label class="mb-1">Status</label> 
                            <select name="status" class="form-select form-select-sm"> 
                                <option value="Pending" <%=detail.getString(4).equals("Pending") ? "selected" : ""%>>Pending</option>
                                
                                <option value="Successfully" <%=detail.getString(4).equals("Successfully") ? "selected" : ""%>>Successfully</option>
                            </select>
                        </div>
                    </div>
                    <div class="modal-footer">
                        <button type="submit" name="submit" class="btn btn-sm btn-success">Save Change</button> 
                        <span style="margin-left: 10px;"></span> <!-- Khoảng cách -->
                        <button type="button"  class="btn btn-sm btn-danger" onclick="window.history.back()">Back</button>
                    </div>
                </form>
            </div>
        </section>
        <%
            } 
        %>
        <script>
            function goBack() {
                window.history.back();
            }
        </script>
    </body>

</html>
