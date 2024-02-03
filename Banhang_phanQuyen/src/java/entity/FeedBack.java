/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package entity;

/**
 *
 * @author Hi
 */
public class FeedBack {
    private int FeedbackID;
    private int UserID;
    private int ProductID;
    private int RatedStar;
    private String Feedback;
    private String Images;

    public FeedBack() {
    }

    public FeedBack(int FeedbackID, int UserID, int ProductID, int RatedStar, String Feedback, String Images) {
        this.FeedbackID = FeedbackID;
        this.UserID = UserID;
        this.ProductID = ProductID;
        this.RatedStar = RatedStar;
        this.Feedback = Feedback;
        this.Images = Images;
    }

    public int getFeedbackID() {
        return FeedbackID;
    }

    public void setFeedbackID(int FeedbackID) {
        this.FeedbackID = FeedbackID;
    }

    public int getUserID() {
        return UserID;
    }

    public void setUserID(int UserID) {
        this.UserID = UserID;
    }

    public int getProductID() {
        return ProductID;
    }

    public void setProductID(int ProductID) {
        this.ProductID = ProductID;
    }

    public int getRatedStar() {
        return RatedStar;
    }

    public void setRatedStar(int RatedStar) {
        this.RatedStar = RatedStar;
    }

    public String getFeedback() {
        return Feedback;
    }

    public void setFeedback(String Feedback) {
        this.Feedback = Feedback;
    }

    public String getImages() {
        return Images;
    }

    public void setImages(String Images) {
        this.Images = Images;
    }

    @Override
    public String toString() {
        return "FeedBack{" + "FeedbackID=" + FeedbackID + ", UserID=" + UserID + ", ProductID=" + ProductID + ", RatedStar=" + RatedStar + ", Feedback=" + Feedback + ", Images=" + Images + '}';
    }
    
    
}
