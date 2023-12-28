/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package hpqdung.data.model;

import java.util.Date;

/**
 *
 * @author admin
 */
public class Comment {

    private int commentID;
    private int user_id;
    private int product_id;
    private String commentText;
   
    private String name;
    // Constructors

    public Comment() {
    }

    public Comment(int commentID, int user_id, int product_id, String commentText, String name) {
        this.commentID = commentID;
        this.user_id = user_id;
        this.product_id = product_id;
        this.commentText = commentText;
        this.name = name;
    }

    public int getCommentID() {
        return commentID;
    }

    public void setCommentID(int commentID) {
        this.commentID = commentID;
    }

    public int getUser_id() {
        return user_id;
    }

    public void setUser_id(int user_id) {
        this.user_id = user_id;
    }

    public int getProduct_id() {
        return product_id;
    }

    public void setProduct_id(int product_id) {
        this.product_id = product_id;
    }

    public String getCommentText() {
        return commentText;
    }

    public void setCommentText(String commentText) {
        this.commentText = commentText;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

   
  

}
