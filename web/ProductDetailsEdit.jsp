<%-- 
    Document   : ProductDetailsEdit.jsp
    Created on : Feb 28, 2024, 10:11:04 AM
    Author     : pc
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.util.Vector" %>
<%@page import="entity.Product" %>
<%@page import="entity.Category" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <style>
            /* CSS để căn chỉnh tên trường thông tin và ô input thẳng hàng về phía bên trái */
            .form-group {
                margin-bottom: 10px; /* Khoảng cách giữa các trường thông tin */
                display: flex; /* Sử dụng flexbox */
                align-items: center; /* Căn các phần tử con theo trục dọc */
            }
            .form-group label {
                width: 150px; /* Độ rộng cố định của tên trường thông tin */
                text-align: right; /* Căn giữa tên trường thông tin */
                margin-right: 10px; /* Khoảng cách giữa tên trường thông tin và ô input */
            }
            .form-group input,
            .form-group textarea,
            .form-group select {
                flex: 1; /* Độ rộng tự động của ô input, textarea, select để lấp đầy không gian còn lại */
            }
            .form-group label,
            .form-group input,
            .form-group textarea,
            .form-group select {
                text-align: left; /* Căn trái các phần tử con */
            }
        </style>
    </head>
    <body>
        <%
    Product details = (Product) request.getAttribute("details");
    Vector<Category> listC = (Vector<Category>) request.getAttribute("listC");
%>

        <h1 style="text-align: center">Edit Product Detail</h1>
<% if (details != null) { %>
        <div style="text-align: center;float:left; width: 50%;">
            <!-- Hiển thị ảnh sản phẩm ở giữa -->
            <img src="<%= details.getImage() %>" alt="Thumbnail" width="200">
        </div>

        <div style="display: inline-block; float:left; width: 50%; vertical-align: middle;">
            <!-- Hiển thị các trường thông tin sản phẩm -->
            <form action="mkteditproduct" method="post" enctype="multipart/form-data">

                <!-- Form group cho category -->
                <div class="form-group">
                    <label for="category">Category:</label>
                    <select name="category">
                        <c:forEach items="${listC}" var="lc">
                            <option value="${lc.categoryId}">${lc.categoryName}</option>
                        </c:forEach>
                    </select>
                </div>

                <!-- Form group cho title -->
                <div class="form-group">
                    <label for="title">Title:</label>
                    <input type="text" name="title" id="title" value="<%= details.getTitle() %>">
                </div>

                <!-- Form group cho brief information -->
                <div class="form-group">
                    <label for="briefInfo" style="width: 150px;">Brief Information:</label>
                    <textarea name="briefInfo" id="briefInfo" style="flex: 1;"><%= details.getBriefInfo() %></textarea>
                </div>

                <!-- Form group cho attached images -->
                <div class="form-group">
                    <label for="attachedImages">Attached Images:</label>
                    <% String[] attachedImages = details.getAttachedImage();
                    if (attachedImages != null) {
                        for (String image : attachedImages) { %>
                    <img src="<%= image %>" alt="Attached Image" width="100"><br>
                    <% }
            } %>
                </div>

                <!-- Form group cho description -->
                <div class="form-group">
                    <label for="description" style="width: 150px;">Description:</label>
                    <textarea name="description" id="description" style="flex: 1;"><%= details.getDescription() %></textarea>
                </div>

                <!-- Form group cho quantity -->
                <div class="form-group">
                    <label for="quantity">Quantity:</label>
                    <input type="number" name="quantity" id="quantity" value="<%= details.getQuantity() %>">
                </div>

                <!-- Form group cho list price -->
                <div class="form-group">
                    <label for="listPrice">List Price:</label>
                    <input type="number" name="listPrice" id="listPrice" value="<%= details.getPrice() %>">
                </div>

                <!-- Form group cho sale price -->
                <div class="form-group">
                    <label for="salePrice">Sale Price:</label>
                    <input type="number" name="salePrice" id="salePrice" value="<%= details.getSalePrice() %>">
                </div>

                <!-- Form group cho flag to turn the featuring on/off -->
                <div class="form-group">
                    <label>Feature:</label>
                    <div>
                        <input type="radio" name="featured" value="true" <%= details.getFeatured() ? "checked" : "" %>On>
                        <input type="radio" name="featured" value="false" <%= !details.getFeatured() ? "checked" : "" %>Off>
                    </div>
                </div>

                <!-- Form group cho status -->
                <div class="form-group">
                    <label for="status">Status:</label>
                    <select name="status" id="status">
                        <option value="Available" <%= (details.getStatus() != null && details.getStatus().equals("Available")) ? "selected" : "" %>>Available</option>
                        <option value="Out of Stock" <%= (details.getStatus() != null && details.getStatus().equals("Out of Stock")) ? "selected" : "" %>>Out of Stock</option>
                        <option value="Pre-order" <%= (details.getStatus() != null && details.getStatus().equals("Pre-order")) ? "selected" : "" %>>Pre-order</option>
                        <option value="Backorder" <%= (details.getStatus() != null && details.getStatus().equals("Backorder")) ? "selected" : "" %>>Backorder</option>
                        <option value="Discontinued" <%= (details.getStatus() != null && details.getStatus().equals("Discontinued")) ? "selected" : "" %>>Discontinued</option>
                        <option value="Featured" <%= (details.getStatus() != null && details.getStatus().equals("Featured")) ? "selected" : "" %>>Featured</option>
                        <option value="Pending Review" <%= (details.getStatus() != null && details.getStatus().equals("Pending Review")) ? "selected" : "" %>>Pending Review</option>
                        <option value="Draft" <%= (details.getStatus() != null && details.getStatus().equals("Draft")) ? "selected" : "" %>>Draft</option>
                        <option value="Sold Out" <%= (details.getStatus() != null && details.getStatus().equals("Sold Out")) ? "selected" : "" %>>Sold Out</option>
                    </select>
                </div>
                <!-- Button để submit form -->
                <div class="form">
                    <input type="submit" value="Save" style="text-align: center; padding: 5px; margin-right: 5px; display: inline-block;">
                    <input type="reset" value="Reset" style="text-align: center; padding: 5px; display: inline-block;">
                </div>
            </form>
        </div>
<% } else { %>
    <p>Không tìm thấy thông tin sản phẩm</p>
<% } %>
    </body>
</html>
