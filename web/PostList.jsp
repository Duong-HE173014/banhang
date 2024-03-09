<%-- 
    Document   : PostList
    Created on : Feb 24, 2024, 6:00:12 PM
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
        <link href="css/manage.css" rel="stylesheet" type="text/css"/>
        <style>
            img{
                width: 200px;
                height: 120px;
            }
        </style>
    <body>
        <jsp:include page="Menu.jsp"></jsp:include>  
            <section class="home-section">
                <div class="container">
                    <div class="table-wrapper">
                        <div class="table-title">
                            <div class="row">
                                <div class="col-sm-6">
                                    <h2>Post List</h2>
                                </div>
                                <div style="color: black">
                                <c:set var="index1" value="1" />
                                <select class="header-address__select" id="categorySelect" onchange="redirectToServlet()" >
                                    <option >----Sellect Category----</option>
                                    <c:forEach items="${requestScope.listcc}" var="i">
                                        <option value="${i.postCategoryID}">${index1}(${i.postCategoryname})</option>
                                        <c:set var="index" value="${index1 + 1}" />
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
                                <th>Title</th>
                                <th>Image</th>
                                <th>Author</th>
                                <th>Brief Info</th>
                                <th>Actions</th>
                            </tr>
                        </thead>
                        <tbody>
                            <c:forEach items="${listpo}" var="o">
                                <tr>
                                    <td>
                                        <span class="custom-checkbox">
                                            <input type="checkbox" id="checkbox1" name="options[]" value="1">
                                            <label for="checkbox1"></label>
                                        </span>
                                    </td>
                                    <td>${o.postID}</td>
                                    <td>${o.pTitle}</td>
                                    <td><img src="${o.postThumbnail}"></td>
                                    <td>${o.postAuthor}</td>
                                    <td>${o.postBriefInfo}</td>
                                    <td>
                                        <a href="mktloadpost?postID=${o.postID}"  class="edit" data-toggle="modal"><i class="material-icons" data-toggle="tooltip" title="Edit">&#xE254;</i></a>
                                        <a href="mktdeletepost?postID=${o.postID}" class="delete" data-toggle="modal"><i class="material-icons" data-toggle="tooltip" title="Delete">&#xE872;</i></a>
                                    </td>
                                </tr>
                            </c:forEach>
                        </tbody>
                    </table>
                    <div class="container-fluid text-center d-flex align-items-center justify-content-center">
                        <c:set var="page" value="${requestScope.page}" /> 
                        <div class="pagination" style="display: flex; flex-wrap: wrap;">
                            <h5 style="margin-right: 5px;">Page: </h5>
                            <c:forEach begin="${1}" end="${endPo}" var="i">
                                <a href="mktpostlist?index1=${i}" style="display: inline-block; margin-right: 5px; margin-bottom: 5px;"><h5>${i}</h5></a>
                                    </c:forEach>
                        </div>
                    </div>

                    <a href="mktdashboard"><button type="button" class="btn btn-primary">Back to home</button>

                </div>
                <!-- Edit Modal HTML -->
                <div id="addEmployeeModal" class="modal fade">
                    <div class="modal-dialog">
                        <div class="modal-content">
                            <form action="mktaddpost" method="post">
                                <div class="modal-header">						
                                    <h4 class="modal-title">Add Post</h4>
                                    <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
                                </div>
                                <div class="modal-body">					
                                    <div class="form-group">
                                        <label>Title</label>
                                        <input name="pTitle" type="text" class="form-control" required>
                                    </div>
                                    <div class="form-group">
                                        <label>Image</label>
                                        <input name="postThumbnail" type="text" class="form-control" required>
                                    </div>
                                    <div class="form-group">
                                        <label>Author</label>
                                        <input name="postAuthor" type="text" class="form-control" required>
                                    </div>
                                    <div class="form-group">
                                        <label>Brief Info</label>
                                        <textarea name="postBriefInfo" class="form-control" required></textarea>
                                    </div>
                                    <div class="form-group">
                                        <label>Description</label>
                                        <textarea name="postDetails" class="form-control" required></textarea>
                                    </div> 
                                    <div class="form-group">
                                        <label>Category</label>
                                        <select name="categoryID" class="form-select" aria-label="Default select example">
                                            <c:forEach items="${listcc}" var="o">
                                                <option value="${o.postCategoryID}">${o.postCategoryname}</option>
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
        </section>
        <script src="js/manager.js" type="text/javascript"></script>
        <script>
                            function redirectToServlet() {
                                var selectedValue = document.getElementById("categorySelect").value;
                                window.location.href = "mktpostlist?postcateID=" + selectedValue;
                            }
        </script>
        <script>
            // JavaScript
            document.addEventListener("DOMContentLoaded", function () {
                var checkboxes = document.querySelectorAll('input[name="options[]"]');
                checkboxes.forEach(function (checkbox) {
                    checkbox.checked = true; // Đánh dấu đã được chọn mặc định
                    checkbox.addEventListener('change', function () {
                        // Khi ô checkbox được thay đổi, không làm gì cả
                        // Ô checkbox vẫn có thể thay đổi trạng thái bình thường
                    });
                });
            });
        </script>
    </body>
</html>
