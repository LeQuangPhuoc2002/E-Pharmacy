/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Interface.java to edit this template
 */
package hpqdung.data.dao;

import hpqdung.data.model.Comment;
import java.util.List;

/**
 *
 * @author admin
 */
public interface CommentDao {

    public void addComment(int userID, int productID, String commentText);

    public List<Comment> getAllCommentsByProduct(int productID);
}
