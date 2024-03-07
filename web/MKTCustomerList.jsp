<%-- 
    Document   : MKTCustomerList
    Created on : Feb 22, 2024, 1:33:18 AM
    Author     : Admin
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="entity.User" %>
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
        <link href="css/style.css" rel="stylesheet" type="text/css"/>
        <script src="js/script.js"></script>
        <script>
            function sortTable(columnIndex, sortOrder) {
                var table, rows, switching, i, x, y, shouldSwitch;
                table = document.getElementById("customerTable");
                switching = true;

                while (switching) {
                    switching = false;
                    rows = table.rows;

                    for (i = 1; i < (rows.length - 1); i++) {
                        shouldSwitch = false;
                        x = rows[i].getElementsByTagName("TD")[columnIndex - 1]; // Điều chỉnh chỉ số cột
                        y = rows[i + 1].getElementsByTagName("TD")[columnIndex - 1]; // Điều chỉnh chỉ số cột

                        if (sortOrder === 'asc') {
                            if (x.innerHTML.toLowerCase() > y.innerHTML.toLowerCase()) {
                                shouldSwitch = true;
                                break;
                            }
                        } else if (sortOrder === 'desc') {
                            if (x.innerHTML.toLowerCase() < y.innerHTML.toLowerCase()) {
                                shouldSwitch = true;
                                break;
                            }
                        }
                    }

                    if (shouldSwitch) {
                        rows[i].parentNode.insertBefore(rows[i + 1], rows[i]);
                        switching = true;
                    }
                }
            }
        </script>
        <style>
            body {
                background-color: #f8f9fa;
            }

            .tablecss {
                background-color: #ffffff;
                width: 90%;
                margin: 0 auto;
                padding: 20px;
                box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
                border-radius: 8px;
            }
            .table th, .table td {
                text-align: center;

            }
            .rowArrange{
                margin-top: 20px;
            }
            .table1 {
                margin-top: 20px;
            }
            .pagination {
                justify-content: center;
                margin-top: 20px;
            }
            .thead-dark th {
                background-color: #343a40;
                color: #ffffff;
                text-align: center;
            }
            
        </style>
    </head>
    <body>
        <%   
            ResultSet listCustomer = (ResultSet)request.getAttribute("listCustomer");
            String gender = "";            
             Object value = request.getAttribute("txtS");
                 String txtS;
                         if(value==null){
                         txtS="";
                     }else txtS = (String)request.getAttribute("txtS");
        %>
        <jsp:include page="Menu.jsp"></jsp:include>
        <section class="home-section">
        <div class="container d-flex justify-content-center align-items-center">     
            <div class="table-wrapper tablecss">
                <div class="table-title">

                    <div class="col-sm-6">
                        <h1><b>List Customer</b></h1>
                    </div>                        

                    <div class="row rowArrange">
                        <div class="col-sm-4">
                            <label for="sortByName">Arrange By Name:</label>
                            <select id="sortByName" onchange="sortTable(1, this.value)">
                                <option value="asc">Ascending</option>
                                <option value="desc">Descending</option>
                            </select>
                        </div>
                        <div class="col-sm-4">
                            <label for="sortByEmail">Arrange By Email:</label>
                            <select id="sortByEmail" onchange="sortTable(2, this.value)">
                                <option value="asc">Ascending</option>
                                <option value="desc">Descending</option>
                            </select>
                        </div>
                        <div class="col-sm-4">                                                     
                            <span>
                                <form action="mktCustomerList" method="post" class="form-inline my-2 my-lg-0">
                                    <input type="hidden" name="go" value="searchUser">
                                    <div class="input-group input-group-sm">
                                        <td><input value ="<%=txtS%>"  name="txt" type="text" class="form-control" aria-label="Small" aria-describedby="inputGroup-sizing-sm" placeholder="Search..."></td>
                                    </div>
                                </form>
                            </span>
                        </div>

                    </div>
                </div>
                <table id="customerTable" class="table table1 table-bordered">
                    <thead class="thead-dark">                  
                        <tr>
                            <th>ID</th>
                            <th>Name Customer</th>
                            <th>Gender</th>
                            <th>Email</th>

                            <th>Phone</th>    
                            <th>Status</th>
                            <th>View</th>
                            <th>Detail</th>
                        </tr>
                    </thead>
                    <tbody>
                        <% while (listCustomer.next()) { 
             gender = listCustomer.getBoolean("Gender") ? "Male" : "Female";
                        %>
                        <tr>
                            <td><%= listCustomer.getInt(1) %></td>
                            <td><%= listCustomer.getString(2) %></td>
                            <td><%= gender %></td>       
                            <td><%= listCustomer.getString(4) %></td>

                            <td><%= listCustomer.getString(6) %></td>
                            <td><%= listCustomer.getString(7) %></td>
                            <td>
                                <a href="mktCustomerList?cusId=<%=listCustomer.getString(1)%>&go=edit"  class="edit" data-toggle="modal">
                                    <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-eye-fill" viewBox="0 0 16 16">
                                    <path d="M10.5 8a2.5 2.5 0 1 1-5 0 2.5 2.5 0 0 1 5 0"/>
                                    <path d="M0 8s3-5.5 8-5.5S16 8 16 8s-3 5.5-8 5.5S0 8 0 8m8 3.5a3.5 3.5 0 1 0 0-7 3.5 3.5 0 0 0 0 7"/>
                                    </svg>
                                </a>
                            </td>
                            <td class="align-items-center"> <a href="mktDetailCustomer?cusId=<%=listCustomer.getString(1)%>"><svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-exclamation-circle-fill" viewBox="0 0 16 16">
                                    <path d="M16 8A8 8 0 1 1 0 8a8 8 0 0 1 16 0M8 4a.905.905 0 0 0-.9.995l.35 3.507a.552.552 0 0 0 1.1 0l.35-3.507A.905.905 0 0 0 8 4m.002 6a1 1 0 1 0 0 2 1 1 0 0 0 0-2"/>
                                    </svg></a></td>
                        </tr>
                        <% } %>
                    </tbody>
                </table>
            </div>
        </div>
                    </section>
    </body>
</html>
