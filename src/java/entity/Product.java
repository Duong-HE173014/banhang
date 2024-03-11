package entity;

import java.util.Date;

/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
/**
 *
 * @author Admin
 */
public class Product {

    private String productID;
    private String title;
    private Integer categoryID; // Sử dụng Integer để cho phép giá trị null
    private Date updatedDate; // Sử dụng Date của Java
    private String image;
    private String briefInfo;
    private String description;
    private String attachedImages;
    private Double price; // Sử dụng Double để cho phép giá trị null
    private Double salePrice; // Tương tự, sử dụng Double để cho phép giá trị null
    private Integer quantity; // Sử dụng Integer để cho phép giá trị null
    private Boolean featured; // Sử dụng Boolean để cho phép giá trị null
    private String status = "";

    public Product() {
    }

    public Product(String productID, String title, Integer categoryID, Date updatedDate, String image, String briefInfo, String description, String attachedImages, Double price, Double salePrice, Integer quantity, Boolean featured, String status) {
        this.productID = productID;
        this.title = title;
        this.categoryID = categoryID;
        this.updatedDate = updatedDate;
        this.image = image;
        this.briefInfo = briefInfo;
        this.description = description;
        this.attachedImages = attachedImages;
        this.price = price;
        this.salePrice = salePrice;
        this.quantity = quantity;
        this.featured = featured;
        this.status = status;
    }

    public Product(String productID, String title, Integer categoryID, String image, String briefInfo, String description, String attachedImages, Double price, Double salePrice, Integer quantity, Boolean featured, String status) {
        this.productID = productID;
        this.title = title;
        this.categoryID = categoryID;
        this.image = image;
        this.briefInfo = briefInfo;
        this.description = description;
        this.attachedImages = attachedImages;
        this.price = price;
        this.salePrice = salePrice;
        this.quantity = quantity;
        this.featured = featured;
        this.status = status;
    }

    public Product(String productID, String title, Integer categoryID, Date updatedDate, String image, String briefInfo, String description, Double price, Double salePrice) {
        this.productID = productID;
        this.title = title;
        this.categoryID = categoryID;
        this.updatedDate = updatedDate;
        this.image = image;
        this.briefInfo = briefInfo;
        this.description = description;
        this.price = price;
        this.salePrice = salePrice;
    }

    public Product(String productID, String title, String image, String briefInfo, Double price, Double salePrice) {
        this.productID = productID;
        this.title = title;
        this.image = image;
        this.briefInfo = briefInfo;
        this.price = price;
        this.salePrice = salePrice;
    }

    public Product(String productID, String title, Date updatedDate, String image, String description, Double price, Double salePrice) {
        this.productID = productID;
        this.title = title;
        this.updatedDate = updatedDate;
        this.image = image;
        this.description = description;
        this.price = price;
        this.salePrice = salePrice;
    }

    public Product(String title, Integer categoryID, String image, String briefInfo, String description, String attachedImages, Double price, Double salePrice, Boolean featured, String status) {
        this.title = title;
        this.categoryID = categoryID;
        this.image = image;
        this.briefInfo = briefInfo;
        this.description = description;
        this.attachedImages = attachedImages;
        this.price = price;
        this.salePrice = salePrice;
        this.featured = featured;
        this.status = status;
    }

    public String getProductID() {
        return productID;
    }

    public void setProductID(String productID) {
        this.productID = productID;
    }

    public String getTitle() {
        return title;
    }

    public void setTitle(String title) {
        this.title = title;
    }

    public Integer getCategoryID() {
        return categoryID;
    }

    public void setCategoryID(Integer categoryID) {
        this.categoryID = categoryID;
    }

    public Date getUpdatedDate() {
        return updatedDate;
    }

    public void setUpdatedDate(Date updatedDate) {
        this.updatedDate = updatedDate;
    }

    public String getImage() {
        return image;
    }

    public void setImage(String image) {
        this.image = image;
    }

    public String getBriefInfo() {
        return briefInfo;
    }

    public void setBriefInfo(String briefInfo) {
        this.briefInfo = briefInfo;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    public String getAttachedImages() {
        return attachedImages;
    }

    public void setAttachedImages(String attachedImages) {
        this.attachedImages = attachedImages;
    }

    public Double getPrice() {
        return price;
    }

    public void setPrice(Double price) {
        this.price = price;
    }

    public Double getSalePrice() {
        return salePrice;
    }

    public void setSalePrice(Double salePrice) {
        this.salePrice = salePrice;
    }

    public Integer getQuantity() {
        return quantity;
    }

    public void setQuantity(Integer quantity) {
        this.quantity = quantity;
    }

    public Boolean getFeatured() {
        return featured;
    }

    public void setFeatured(Boolean featured) {
        this.featured = featured;
    }

    public String getStatus() {
        return status;
    }

    public void setStatus(String status) {
        this.status = status;
    }

    public String[] getAttachedImage() {
        if (attachedImages != null && !attachedImages.isEmpty()) {
            // Split the attachedImages string by comma and trim each URL
            return attachedImages.split("\\s*,\\s*");
        } else {
            return new String[0]; // Return an empty array if attachedImages is null or empty
        }
    }

    @Override
    public String toString() {
        return "Product{" + "productID=" + productID + ", title=" + title + ", categoryID=" + categoryID + ", updatedDate=" + updatedDate + ", image=" + image + ", briefInfo=" + briefInfo + ", description=" + description + ", attachedImages=" + attachedImages + ", price=" + price + ", salePrice=" + salePrice + ", quantity=" + quantity + ", featured=" + featured + ", status=" + status + '}';
    }
    
}
