<%-- 
    Document   : MKTProductList
    Created on : Mar 11, 2024, 7:25:22 AM
    Author     : Hi
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
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
        <link href="css/manager.css" rel="stylesheet" type="text/css"/>
        <style>
            img{
                width: 200px;
                height: 120px;
            }
        </style>
    <body>
        <div class="container">
            <div class="table-wrapper">
                <div class="table-title">
                    <div class="row">
                        <div class="col-sm-6">
                            <h2>Product List</h2>
                        </div>
                        <div class="col-sm-6">
                            <a href="#addEmployeeModal"  class="btn btn-success" data-toggle="modal"><i class="material-icons">&#xE147;</i> <span>Add New Product</span></a>					
                        </div>
                    </div>
                </div>
                <table class="table table-striped table-hover">
                    <thead>
                        <tr>
                            <th>ID</th>
                            <th>Name</th>
                            <th>Image</th>
                            <th>Brief Info</th>
                            <th>Price</th>
                            <th>Sale Price</th>
                            <th>Actions</th>
                        </tr>
                    </thead>
                    <tbody>
                        <c:forEach items="${listpo}" var="o">
                            <tr>
                                <td>${o.productID}</td>
                                <td>${o.title}</td>
                                <td>
                                    <img src="${o.image}">
                                </td>
                                <td>${o.briefInfo}</td>
                                <td><del>${o.price}VND</del></td>
                                <td>${o.salePrice}VND</td>
                                <td>
                                    <a href="mkteditproduct?productID=${o.productID}"  class="edit" data-toggle="modal"><i class="material-icons" data-toggle="tooltip" title="Edit">&#xE254;</i></a>
                                    <a href="mktdeleteproduct?productID=${o.productID}" class="delete" data-toggle="modal"><i class="material-icons" data-toggle="tooltip" title="Delete">&#xE872;</i></a>
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
            </div>
            <a href="mktdashboard"><button type="button" class="btn btn-primary">Back to home</button></a>

        </div>
        <!-- Edit Modal HTML -->
        <div id="addEmployeeModal" class="modal fade">
            <div class="modal-dialog">
                <div class="modal-content">
                    <form action="mktaddproduct" method="post">
                        <div class="modal-header">						
                            <h4 class="modal-title">Add Product</h4>  
                        </div>
                        <div class="modal-body">					
                            <div class="form-group">
                                <label>Name</label>
                                <input name="title" type="text" class="form-control" required>
                            </div>
                            <div class="form-group">
                                <label>Image</label>
                                <input name="image" type="text" class="form-control" required>
                            </div>
                            <div class="form-group">
                                <label>Price (VND):</label>
                                <input name="price" type="text" class="form-control" required>
                            </div>
                            <div class="form-group">
                                <label>Sale Price (VND):</label>
                                <input name="salePrice" type="text" class="form-control" required>
                            </div>
                            <div class="form-group">
                                <label>Brief Info</label>
                                <textarea name="briefInfo" class="form-control" required></textarea>
                            </div>
                            <div class="form-group">
                                <label>Description</label>
                                <textarea name="description" class="form-control" required></textarea>
                            </div>
                            <div class="form-group">
                                <label>Category</label>
                                <select name="categoryID" class="form-select" aria-label="Default select example">
                                    <c:forEach items="${listCa}" var="o">
                                        <option value="${o.categoryId}">${o.categoryName}</option>
                                    </c:forEach>
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
    </body>
</html>
