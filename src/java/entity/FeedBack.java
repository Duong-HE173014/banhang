/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package entity;

import java.util.Date;

/**
 *
 * @author Hi
 */
public class FeedBack {
    private int fFeedbackID;
    private int fUserID;
    private int fProductID;
    private int fRatedStar;
    private String fFeedback;
    private String fImages;
    private Date fUpdatedDate;
    private String fTitle;

    public FeedBack() {
    }

    public FeedBack(int fFeedbackID, int fUserID, int fProductID, int fRatedStar, String fFeedback, String fImages, Date fUpdatedDate, String fTitle) {
        this.fFeedbackID = fFeedbackID;
        this.fUserID = fUserID;
        this.fProductID = fProductID;
        this.fRatedStar = fRatedStar;
        this.fFeedback = fFeedback;
        this.fImages = fImages;
        this.fUpdatedDate = fUpdatedDate;
        this.fTitle = fTitle;
    }

    public int getfFeedbackID() {
        return fFeedbackID;
    }

    public void setfFeedbackID(int fFeedbackID) {
        this.fFeedbackID = fFeedbackID;
    }

    public int getfUserID() {
        return fUserID;
    }

    public void setfUserID(int fUserID) {
        this.fUserID = fUserID;
    }

    public int getfProductID() {
        return fProductID;
    }

    public void setfProductID(int fProductID) {
        this.fProductID = fProductID;
    }

    public int getfRatedStar() {
        return fRatedStar;
    }

    public void setfRatedStar(int fRatedStar) {
        this.fRatedStar = fRatedStar;
    }

    public String getfFeedback() {
        return fFeedback;
    }

    public void setfFeedback(String fFeedback) {
        this.fFeedback = fFeedback;
    }

    public String getfImages() {
        return fImages;
    }

    public void setfImages(String fImages) {
        this.fImages = fImages;
    }

    public Date getfUpdatedDate() {
        return fUpdatedDate;
    }

    public void setfUpdatedDate(Date fUpdatedDate) {
        this.fUpdatedDate = fUpdatedDate;
    }

    public String getfTitle() {
        return fTitle;
    }

    public void setfTitle(String fTitle) {
        this.fTitle = fTitle;
    }

    @Override
    public String toString() {
        return "FeedBack{" + "fFeedbackID=" + fFeedbackID + ", fUserID=" + fUserID + ", fProductID=" + fProductID + ", fRatedStar=" + fRatedStar + ", fFeedback=" + fFeedback + ", fImages=" + fImages + ", fUpdatedDate=" + fUpdatedDate + ", fTitle=" + fTitle + '}';
    }

    
}
