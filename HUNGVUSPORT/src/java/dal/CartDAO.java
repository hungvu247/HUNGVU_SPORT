/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dal;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.time.LocalDate;
import model.Cart;
import model.Items;

import model.User;

/**
 *
 * @author HUNG VU
 */
public class CartDAO extends DBContext {

    public void addOrder(User user, Cart cart) {
        LocalDate curDate = LocalDate.now();
        String date = curDate.toString();
        try {
            //add vao bang order truoc 

            String sql = """
                         INSERT INTO [OrderTable]
                                    ([customer_id]
                                    ,[order_date]
                                    ,[total_amount]
                                    ,[status])
                              VALUES
                                    (?
                                    ,?
                                    ,?
                                    ,?)""";
            PreparedStatement st = connection.prepareStatement(sql);
            st.setString(1, user.getId());
            st.setString(2, date);
            st.setDouble(3, cart.getTotal() * 1.5);
            st.setString(4, "processing");
            st.executeUpdate();
            //lay ra id cua ordertable vua add  
            String sql1 = """
                          SELECT TOP (1) [order_id]
                            FROM [dbo].[OrderTable] order by order_id desc""";
            PreparedStatement st1 = connection.prepareStatement(sql1);
            ResultSet rs = st1.executeQuery();

            //add vao bang order_items
            if (rs.next()) {
                int oid = rs.getInt("order_id");
                System.out.println("------oid : " + oid);
                for (Items i : cart.getItems()) {
                    String sq2 = """
                                 INSERT INTO [dbo].[Order_Item]
                                            ([order_id]
                                            ,[product_id]
                                            ,[quantity]
                                            ,[price])
                                      VALUES
                                            (?
                                            ,?
                                            ,?
                                            ,?)""";
                    PreparedStatement st2 = connection.prepareStatement(sq2);
                    st2.setInt(1, oid);
                    System.out.println("------oid : " + oid);
                    st2.setInt(2, i.getProduct().getProduct_id());
                    System.out.println("------pid : " + i.getProduct().getProduct_id());
                    st2.setInt(3, i.getQuantity());
                    System.out.println("quantity: " + i.getQuantity());
                    st2.setDouble(4, i.getPrice());
                    st2.executeUpdate();
                }
            }
            //cap nhat lai so luong san pham trong kho 
            String sql3 = """
                          UPDATE [dbo].[Product]
                             SET 
                                [quantity_available] = [quantity_available]-?
                                
                           WHERE product_id=?""";
            PreparedStatement st3 = connection.prepareStatement(sql3);
            for (Items i : cart.getItems()) {
                st3.setInt(1, i.getQuantity());
                st3.setInt(2, i.getProduct().getProduct_id());
                st3.executeUpdate();
            }
        } catch (SQLException e) {
        }
    }

    /*
    private int order_id;
    private int cus_id;
    private Date order_date;
    private String status;
    private double total;
     */
}
