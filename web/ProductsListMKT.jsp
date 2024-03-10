<%-- 
    Document   : Products List
    Created on : Feb 21, 2024, 7:05:04 PM
    Author     : Hi
--%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.util.Vector" %>
<%@page import="entity.Product" %>
<%@page import="entity.Category" %>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="utf-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <title>JSP Page</title>
        <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Roboto|Varela+Round">
        <link rel="stylesheet" href="https://fonts.googleapis.com/icon?family=Material+Icons">
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
        <link href="css/manage.css" rel="stylesheet" type="text/css"/>
        <style>
            img{
                width: 200px;
                height: 120px;
        </style>
    <body>
        <%
            Vector<Category> listC =(Vector<Category>)request.getAttribute("listC");
        %>
        <jsp:include page="Menu.jsp"></jsp:include>  
            <section class="home-section">
                <div class="container">
                    <div class="table-wrapper">
                        <div class="table-title">
                            <div class="row">
                                <div class="col-sm-6">
                                    <h2>Product List</h2>
                                </div>
                                <div style="color: black">
                                <c:set var="index" value="1" />
                                <select class="header-address__select" id="categorySelect" onchange="redirectToServlet()">
                                    <option >----Select Category----</option>
                                    <c:forEach items="${requestScope.listCC}" var="i">
                                        <option value="${i.categoryId}">${index}(${i.categoryName})</option>
                                        <c:set var="index" value="${index + 1}" />
                                    </c:forEach>
                                </select>
                            </div>
                            <div class="col-sm-6">
                                <a href="#addEmployeeModal"  class="btn btn-success" data-toggle="modal"><i class="material-icons">&#xE147;</i> <span>Add New Product</span></a> 			
                            </div>
                        </div>
                    </div>
                    <table class="table table-striped table-hover">
                        <thead>
                            <tr>
                                <th>
                                    <span class="custom-checkbox">
                                        <input type="checkbox" id="selectAll">
                                        <label for="selectAll"></label>
                                    </span>
                                </th>
                                <th>ID</th>
                                <th>Name</th>
                                <th>Image</th>
                                <th>Price</th>
                                <th>Sale Price</th>
                                <th>Actions</th>
                            </tr>
                        </thead>
                        <tbody>
                            <c:forEach items="${listpr}" var="o">
                                <tr>
                                    <td>
                                        <span class="custom-checkbox">
                                            <input type="checkbox" id="checkbox1" name="options[]" value="1">
                                            <label for="checkbox1"></label>
                                        </span>
                                    </td>
                                    <td>${o.productID}</td>
                                    <td>${o.title}</td>
                                    <td><img src="${o.image}"></td>
                                    <td><del class="num">${o.price}</del></td>
                                    <td>${o.salePrice}</td>
                                    <td>
                                        <a href="mkteditproduct?productID=${o.productID}"  class="edit" data-toggle="modal"><i class="material-icons" data-toggle="tooltip" title="Edit">&#xE254;</i></a>
                                        <a href="deleteproductsmkt?productID=${o.productID}" class="delete" data-toggle="modal"><i class="material-icons" data-toggle="tooltip" title="Delete">&#xE872;</i></a>
                                    </td>
                                </tr>
                            </c:forEach>
                        </tbody>
                    </table>
                    <div class="container-fluid text-center d-flex align-items-center justify-content-center">
                        <c:set var="page" value="${requestScope.page}" /> 
                        <div class="pagination" style="display: flex; flex-wrap: wrap;">
                            <h5 style="margin-right: 5px;">Page: </h5>
                            <c:forEach begin="${1}" end="${endP}" var="i">
                                <a href="mktproductlist?index=${i}" style="display: inline-block; margin-right: 5px; margin-bottom: 5px;"><h5>${i}</h5></a>
                                    </c:forEach>
                        </div>
                    </div>
                    <a href="mktdashboard"><button type="button" class="btn btn-primary">Back to home</button>
                </div>
            </div>
            <!-- Edit Modal HTML -->
            <div id="addEmployeeModal" class="modal fade">
                <div class="modal-dialog">
                    <div class="modal-content">
                        <form action="mktaddproduct" method="post">
                            <div class="modal-header">						
                                <h4 class="modal-title">Add Product</h4>
                                <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
                            </div>
                            <div class="modal-body">
                                <div class="form-group">
                                    <label>Category</label>
                                    <select name="category" class="form-select" aria-label="Default select example">
                                        <c:forEach items="${listC}" var="lc">
                                            <option value="${lc.categoryId}">${lc.categoryName}</option>
                                        </c:forEach>
                                    </select>
                                </div>
                                <div class="form-group">
                                    <label>Title</label>
                                    <input name="title" type="text" class="form-control" required>
                                </div>
                                <div class="form-group">
                                    <label>Brief Info</label>
                                    <textarea name="briefInfo" class="form-control" required></textarea>
                                </div>
                                <div class="form-group">
                                    <label>Thumnail Src:</label>
                                    <input name="image" type="text" class="form-control" required>
                                </div>
                                <div class="form-group">
                                    <label>Attached_Image Src:</label>
                                    <textarea name="Attached_Image" class="form-control"></textarea>
                                </div>
                                <div class="form-group">
                                    <label>Description</label>
                                    <textarea name="description" class="form-control" required></textarea>
                                </div>
                                <div class="form-group">
                                    <label>Quantity</label>
                                    <input name="quantity" type="number" class="form-control" required>
                                </div>
                                <div class="form-group">
                                    <label>List Price</label>
                                    <input name="price" type="number" class="form-control" required>
                                </div>
                                <div class="form-group">
                                    <label>Sale Price</label>
                                    <input name="salePrice" type="number" class="form-control" required>
                                </div>
                                <div class="form-group">
                                    <label>Feature:</label>
                                    <div>
                                        <input type="radio" name="featured" value="true" >On
                                        <input type="radio" name="featured" value="false" >Off
                                    </div>
                                </div>

                                <!-- Form group cho status -->
                                <div class="form-group">
                                    <label for="status">Status:</label>
                                    <select name="status" id="status">
                                        <option value="Available"> Available</option>
                                        <option value="Out of Stock" >Out of Stock</option>
                                        <option value="Pre-order"> Pre-order</option>
                                        <option value="Backorder" >Backorder</option>
                                        <option value="Discontinued" >Discontinued</option>
                                        <option value="Featured" >Featured</option>
                                        <option value="Pending Review" >Pending Review</option>
                                        <option value="Draft" >Draft</option>
                                        <option value="Sold Out" >Sold Out</option>
                                    </select>
                                </div>

                            </div>
                            <div class="modal-footer">
                                <input type="button" class="btn btn-default" data-dismiss="modal" value="Cancel">
                                <input type="submit" class="btn btn-success" value="Add">
                            </div>
                        </form>
                    </div>
                </div>
            </div>
        </section>                    
    </body>
</html>
