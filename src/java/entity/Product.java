package entity;

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
    private int categoryID;
    private String updatedDate;
    private String image;
    private String briefInfo;
    private String description;  
    private double price;   
    private double salePrice;
    private int quantity = 1;

    public Product() {
    }

    public Product(String productID, String title, int categoryID, String updatedDate, String image, String briefInfo, String description, double price, double salePrice) {
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

    public Product(String productID, String title, String image, String briefInfo, double price, double salePrice) {
        this.productID = productID;
        this.title = title;
        this.image = image;
        this.briefInfo = briefInfo;
        this.price = price;
        this.salePrice = salePrice;
    }

    public Product(String productID, String title, String updatedDate, String image, String description, double price, double salePrice) {
        this.productID = productID;
        this.title = title;
        this.updatedDate = updatedDate;
        this.image = image;
        this.description = description;
        this.price = price;
        this.salePrice = salePrice;
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

    public int getCategoryID() {
        return categoryID;
    }

    public void setCategoryID(int categoryID) {
        this.categoryID = categoryID;
    }

    public String getUpdatedDate() {
        return updatedDate;
    }

    public void setUpdatedDate(String updatedDate) {
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

    public double getPrice() {
        return price;
    }

    public void setPrice(double price) {
        this.price = price;
    }

    public double getSalePrice() {
        return salePrice;
    }

    public void setSalePrice(double salePrice) {
        this.salePrice = salePrice;
    }

    public int getQuantity() {
        return quantity;
    }

    public void setQuantity(int quantity) {
        this.quantity = quantity;
    }

    @Override
    public String toString() {
        return "Product{" + "productID=" + productID + ", title=" + title + ", categoryID=" + categoryID + ", updatedDate=" + updatedDate + ", image=" + image + ", briefInfo=" + briefInfo + ", description=" + description + ", price=" + price + ", salePrice=" + salePrice + '}';
    }

   
}
