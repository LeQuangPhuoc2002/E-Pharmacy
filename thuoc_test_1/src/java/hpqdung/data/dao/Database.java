
package hpqdung.data.dao;

import hpqdung.data.impl.AdminImpl;
import hpqdung.data.impl.CartImpl;
import hpqdung.data.impl.CategoryImpl;
import hpqdung.data.impl.CommentImpl;
import hpqdung.data.impl.ProductImpl;
import hpqdung.data.impl.UserImpl;



public class Database {
    public static CategoryDao getCategoryDao() {
        return new CategoryImpl();
    }
    
    public static ProductDao getProductDao() {
        return new ProductImpl();
    }
    
    public static UserDao getUserDao() {
        return new UserImpl();
    }
    
    public static CartDao getCartDao() {
        return new CartImpl();
    }
    
    public static AdminDao getAdminDao() {
        return new AdminImpl();
    }
    
    public static CommentDao getCommentDao() {
        return new CommentImpl();
    }
}
