/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dal;

import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import model.Review;

/**
 *
 * @author HUNG VU
 */
public class ReviewDAO extends DBContext {

   public int countView() {
    String sql = "select count(*) as [c] from Review";
    int numberOfReview = 0;
    try (PreparedStatement st = connection.prepareStatement(sql);
         ResultSet rs = st.executeQuery()) {
        if (rs.next()) {
            numberOfReview = rs.getInt("c");
        }
    } catch (SQLException e) {
        // Xử lý ngoại lệ SQL
        e.printStackTrace();
    }
    return numberOfReview;
}


    public List<Review> getAllReview(String product_id) {
        String sql = "select * from Review where product_id=? ";
        List<Review> list = new ArrayList<>();
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setString(1, product_id);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                Review review;
                review = new Review(rs.getString("review_id"), rs.getInt("product_id"), rs.getInt("customer_id"),
                        rs.getString("comment"), rs.getDate("review_date"));
                list.add(review);
              
            }
        } catch (SQLException e) {
        }
  return list;
    }

    public void addReview(Review review) {
        String sql = "INSERT INTO [Review]\n"
                + "           ([product_id]\n"
                + "           ,[customer_id]\n"
                + "           ,[comment]\n"
                + "           ,[review_date])\n"
                + "     VALUES\n"
                + "           (?\n"
                + "           ,?\n"
                + "           ,?          \n"
                + "           ,?)";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setInt(1, review.getProduct_id());
            st.setInt(2, review.getCustomer_id());
            st.setString(3, review.getComment());
            st.setDate(4, (Date) review.getReviewDate());
            st.executeQuery();

        } catch (SQLException e) {
        }

    }

    public static void main(String[] args) {
        ReviewDAO r = new ReviewDAO();
        System.out.println(r.countView());
    }
}
