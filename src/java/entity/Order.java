/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package entity;

import dao.OrderDetailDAO;
import java.util.Date;
import java.util.List;

/**
 *
 * @author lvhn1
 */
public class Order {

    private int orderId;
    private int userId;
    private Date orderDate;
    private double totalCost;
    private String status;
    private String receiverFullName;
    private String receiverEmail;
    private String receiverMobile;
    private String receiverAddress;
    private int receiverGender;
    private String notes;
    private int paymentMethods;

    public Order() {
    }

    public Order(int orderId, int userId, Date orderDate, double totalCost, String status, String receiverFullName, String receiverEmail, String receiverMobile, String receiverAddress) {
        this.orderId = orderId;
        this.userId = userId;
        this.orderDate = orderDate;
        this.totalCost = totalCost;
        this.status = status;
        this.receiverFullName = receiverFullName;
        this.receiverEmail = receiverEmail;
        this.receiverMobile = receiverMobile;
        this.receiverAddress = receiverAddress;
    }

    public Order(int userId, double totalCost, String receiverFullName, String receiverEmail, String receiverMobile, String receiverAddress, int receiverGender, String notes, int paymentMethods) {
        this.userId = userId;
        this.totalCost = totalCost;
        this.receiverFullName = receiverFullName;
        this.receiverEmail = receiverEmail;
        this.receiverMobile = receiverMobile;
        this.receiverAddress = receiverAddress;
        this.receiverGender = receiverGender;
        this.notes = notes;
        this.paymentMethods = paymentMethods;
    }

    public int getOrderId() {
        return orderId;
    }

    public void setOrderId(int orderId) {
        this.orderId = orderId;
    }

    public int getUserId() {
        return userId;
    }

    public void setUserId(int userId) {
        this.userId = userId;
    }

    public Date getOrderDate() {
        return orderDate;
    }

    public void setOrderDate(Date orderDate) {
        this.orderDate = orderDate;
    }

    public double getTotalCost() {
        return totalCost;
    }

    public void setTotalCost(double totalCost) {
        this.totalCost = totalCost;
    }

    public String getStatus() {
        return status;
    }

    public void setStatus(String status) {
        this.status = status;
    }

    public String getReceiverFullName() {
        return receiverFullName;
    }

    public void setReceiverFullName(String receiverFullName) {
        this.receiverFullName = receiverFullName;
    }

    public String getReceiverEmail() {
        return receiverEmail;
    }

    public void setReceiverEmail(String receiverEmail) {
        this.receiverEmail = receiverEmail;
    }

    public String getReceiverMobile() {
        return receiverMobile;
    }

    public void setReceiverMobile(String receiverMobile) {
        this.receiverMobile = receiverMobile;
    }

    public String getReceiverAddress() {
        return receiverAddress;
    }

    public void setReceiverAddress(String receiverAddress) {
        this.receiverAddress = receiverAddress;
    }

    private List<OrderDetail> orderDetailList;

    public List<OrderDetail> getOrderDetailList() {
        if (orderDetailList == null) {
            orderDetailList = new OrderDetailDAO().getOrderDetailsByOrderID(orderId);
        }
        return orderDetailList;
    }

    public void setOrderDetailList(List<OrderDetail> orderDetailList) {
        this.orderDetailList = orderDetailList;
    }

    public int getReceiverGender() {
        return receiverGender;
    }

    public void setReceiverGender(int receiverGender) {
        this.receiverGender = receiverGender;
    }

    public String getNotes() {
        return notes;
    }

    public void setNotes(String notes) {
        this.notes = notes;
    }

    public int getPaymentMethods() {
        return paymentMethods;
    }

    public void setPaymentMethods(int paymentMethods) {
        this.paymentMethods = paymentMethods;
    }

}
