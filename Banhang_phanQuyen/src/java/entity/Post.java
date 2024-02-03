/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package entity;

/**
 *
 * @author Admin
 */
public class Post {

    private int postID;
    private String pTitle;
    private String postAuthor;
    private String postUpdatedDate;
    private int categoryID;
    private String postThumbnail;
    private String postBriefInfo;
    private String Details;

    public Post() {
    }

    public Post(int postID, String pTitle, String postAuthor, String postUpdatedDate, int categoryID, String postThumbnail, String postBriefInfo, String Details) {
        this.postID = postID;
        this.pTitle = pTitle;
        this.postAuthor = postAuthor;
        this.postUpdatedDate = postUpdatedDate;
        this.categoryID = categoryID;
        this.postThumbnail = postThumbnail;
        this.postBriefInfo = postBriefInfo;
        this.Details = Details;
    }

    public Post(int postID, String pTitle, String postAuthor, String postThumbnail, String postBriefInfo) {
        this.postID = postID;
        this.pTitle = pTitle;
        this.postAuthor = postAuthor;
        this.postThumbnail = postThumbnail;
        this.postBriefInfo = postBriefInfo;
    }

    public int getPostID() {
        return postID;
    }

    public void setPostID(int postID) {
        this.postID = postID;
    }

    public String getpTitle() {
        return pTitle;
    }

    public void setpTitle(String pTitle) {
        this.pTitle = pTitle;
    }

    public String getPostAuthor() {
        return postAuthor;
    }

    public void setPostAuthor(String postAuthor) {
        this.postAuthor = postAuthor;
    }

    public String getPostUpdatedDate() {
        return postUpdatedDate;
    }

    public void setPostUpdatedDate(String postUpdatedDate) {
        this.postUpdatedDate = postUpdatedDate;
    }

    public int getCategoryID() {
        return categoryID;
    }

    public void setCategoryID(int categoryID) {
        this.categoryID = categoryID;
    }

    public String getPostThumbnail() {
        return postThumbnail;
    }

    public void setPostThumbnail(String postThumbnail) {
        this.postThumbnail = postThumbnail;
    }

    public String getPostBriefInfo() {
        return postBriefInfo;
    }

    public void setPostBriefInfo(String postBriefInfo) {
        this.postBriefInfo = postBriefInfo;
    }

    public String getDetails() {
        return Details;
    }

    public void setDetails(String Details) {
        this.Details = Details;
    }

    @Override
    public String toString() {
        return "Post{" + "postID=" + postID + ", pTitle=" + pTitle + ", postAuthor=" + postAuthor + ", postUpdatedDate=" + postUpdatedDate + ", categoryID=" + categoryID + ", postThumbnail=" + postThumbnail + ", postBriefInfo=" + postBriefInfo + ", Details=" + Details + '}';
    }
          
}
