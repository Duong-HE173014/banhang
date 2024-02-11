/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package entity;

import dao.OrderDAO;
import dao.DAO;

public class OrderDetail {
    
    private int orderDetailId;
    private int orderId;
    private int productId;
    private String thumbnail;
    private String productName;
    private double unitPrice;
    private int quantity;
    private double totalCost;

    public OrderDetail() {
    }

    public OrderDetail(int orderDetailId, int orderId, int productId, String thumbnail, String productName, double unitPrice, int quantity, double totalCost) {
        this.orderDetailId = orderDetailId;
        this.orderId = orderId;
        this.productId = productId;
        this.thumbnail = thumbnail;
        this.productName = productName;
        this.unitPrice = unitPrice;
        this.quantity = quantity;
        this.totalCost = totalCost;
    }

    public int getOrderDetailId() {
        return orderDetailId;
    }

    public void setOrderDetailId(int orderDetailId) {
        this.orderDetailId = orderDetailId;
    }

    public int getOrderId() {
        return orderId;
    }

    public void setOrderId(int orderId) {
        this.orderId = orderId;
    }

    public int getProductId() {
        return productId;
    }

    public void setProductId(int productId) {
        this.productId = productId;
    }

    public String getThumbnail() {
        return thumbnail;
    }

    public void setThumbnail(String thumbnail) {
        this.thumbnail = thumbnail;
    }

    public String getProductName() {
        return productName;
    }

    public void setProductName(String productName) {
        this.productName = productName;
    }

    public double getUnitPrice() {
        return unitPrice;
    }

    public void setUnitPrice(double unitPrice) {
        this.unitPrice = unitPrice;
    }

    public int getQuantity() {
        return quantity;
    }

    public void setQuantity(int quantity) {
        this.quantity = quantity;
    }

    public double getTotalCost() {
        return totalCost;
    }

    public void setTotalCost(double totalCost) {
        this.totalCost = totalCost;
    }
    
    private Order order;
    private Product product;

    public Order getOrder() {
        if (order==null) order = new OrderDAO().getOrderById(orderId);
        return order;
    }

    public void setOrder(Order order) {
        this.order = order;
    }

    public Product getProduct() {
        if (product==null) product = new DAO().getProductByID(productId+"");
        return product;
    }

    public void setProduct(Product product) {
        this.product = product;
    }
    
    
}
