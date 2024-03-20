<%-- 
    Document   : SalerOrderEdit
    Created on : Mar 10, 2024, 3:10:47 AM
    Author     : Admin
--%>

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
            .readonly-field {
                position: relative;
                margin-bottom: 15px; /* Dãn cách giữa các trường */
            }

            .readonly-textarea {
                width: 100%;
                height: 40px; /* Điều chỉnh chiều cao của textarea tùy theo nhu cầu */
                padding: 0.5rem;
                border: 1px solid #ced4da;
                border-radius: 0.25rem;
                background-color: #fff;
                resize: none;
            }

            .readonly-indicator {
                position: absolute;
                top: 50%;
                right: 10px;
                transform: translateY(-50%);
                color: #6c757d;
            }

        </style>
    </head>
    <body>
        <jsp:include page="Menu.jsp"></jsp:include> 
        <%
            ResultSet rsInfoSaler = (ResultSet) request.getAttribute("rsInfoSaler");  
            
            ResultSet detail = (ResultSet) request.getAttribute("detail"); 
            if (detail != null && detail.next()) {
        %>
        <section class="home-section">
            <div class="container small-container"> 
                <form action="salemanagerOrderEdit" method="post">
                    <input type="hidden" class="form-control" name="status" value="<%= detail.getString(4) %>">

                    <div class="modal-header">
                        <h5 class="modal-title" id="productModalLabel">Order Information</h5>

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
                                    <div class="readonly-field">
                                        <%= detail.getString(6) %>
                                        <span class="readonly-indicator"></span>
                                    </div>
                                </div>
                                <div class="col">
                                    <label class="mb-1">Receiver Number</label>
                                    <div class="readonly-field">
                                        <div><%= detail.getString(7) %></div>
                                        <span class="readonly-indicator"></span>
                                    </div>
                                </div>
                            </div>
                            <div class="form-group mb-3">
                                <label class="mb-1">Receiver Address</label>
                                <div class="readonly-field">
                                    <div class="readonly-textarea" readonly><%= detail.getString(8) %></div>
                                    <span class="readonly-indicator"></span>
                                </div>
                            </div>
                            <div class="form-group mb-3">
                                <label class="mb-1">Customer Note</label>
                                <div class="readonly-field">
                                    <div class="readonly-textarea" readonly><%= detail.getString(10) %></div>
                                    <span class="readonly-indicator"></i></span>
                                </div>
                            </div>

                            <div class="form-group mb-3"> 
                                <div class="row">
                                    <div class="col">
                                        <label class="mb-1">Status</label> 
                                        <div class="readonly-textarea" readonly><%=detail.getString(4)%></div>                                  
                                    </div>
                                    <div class="col">
                                        <label class="mb-1">Order Fulfillment Sales Associate</label> 
                                        <select name="salerID" class="form-select form-select-sm"> 
                                            <% while ( rsInfoSaler.next()) { %>
                                            <option value="<%= rsInfoSaler.getInt(1) %>" <%= detail.getInt(9) == rsInfoSaler.getInt(1) ? "selected" : "" %>>ID Saler: <%= rsInfoSaler.getInt(1) %> - Name Saler: <%= rsInfoSaler.getString(2) %> - Number of orders received: <%= rsInfoSaler.getString(3) %></option>
                                            <% } %>
                                        </select>
                                    </div>
                                </div>
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
