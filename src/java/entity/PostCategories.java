/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package entity;

/**
 *
 * @author Hi
 */
public class PostCategories {
    private int postCategoryID;
    private String postCategoryname;

    public PostCategories() {
    }

    public PostCategories(int postCategoryID, String postCategoryname) {
        this.postCategoryID = postCategoryID;
        this.postCategoryname = postCategoryname;
    }

    public int getPostCategoryID() {
        return postCategoryID;
    }

    public void setPostCategoryID(int postCategoryID) {
        this.postCategoryID = postCategoryID;
    }

    public String getPostCategoryname() {
        return postCategoryname;
    }

    public void setPostCategoryname(String postCategoryname) {
        this.postCategoryname = postCategoryname;
    }

    @Override
    public String toString() {
        return "PostCategories{" + "postCategoryID=" + postCategoryID + ", postCategoryname=" + postCategoryname + '}';
    }
    
    
}
