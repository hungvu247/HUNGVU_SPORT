/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dal;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import model.Orderdetail;
import model.Product;
import model.User;

/**
 *
 * @author HUNG VU
 */
public class AdminDAO extends DBContext {

    public List<User> getAllUser() {
        String sql = "SELECT [user_id]\n"
                + "      ,[username]\n"
                + "      ,[password]\n"
                + "      ,[Role]\n"
                + "      ,[FirstName]\n"
                + "      ,[LastName]\n"
                + "      ,[Address]\n"
                + "      ,[Phone]\n"
                + "      ,[img]\n"
                + "  FROM [dbo].[Users]";
        List<User> listU = new ArrayList<>();
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            ResultSet rs = st.executeQuery();

            while (rs.next()) {
                User u = new User(rs.getString("user_id"), rs.getString("username"), rs.getString("password"),
                        rs.getString("role"), rs.getString("FirstName"), rs.getString("LastName"),
                        rs.getString("Address"), rs.getString("Phone"), rs.getString("img"));
                listU.add(u);
            }

        } catch (SQLException e) {
        }
        return listU;
    }

    public void addNewProduct(Product product) {
        String sql = """
                     INSERT INTO [dbo].[Product]
                                ([product_name]
                                ,[description]
                                ,[category_id]
                                ,[price]
                                ,[quantity_available]
                                ,[Img])
                          VALUES
                                (?           ,?           ,?           ,?           ,?           ,?)""";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setString(1, product.getProduct_name());
            st.setString(2, product.getDescription());
            st.setInt(3, product.getCategory().getId());
            st.setDouble(4, product.getPrice());
            st.setInt(5, product.getQuantity());
            st.setString(6, product.getImg());
            st.execute();
        } catch (SQLException e) {
            System.out.println("AddNewProduct " + e);
        }
    }

    public void setRoleForUser(User user, String role) {
        String sql = """
                     UPDATE [dbo].[Users]
                        SET       [Role] =? WHERE user_id=?""";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setString(1, role);
            st.setString(2, user.getId());

            int rowsUpdated = st.executeUpdate();

            if (rowsUpdated > 0) {
                System.out.println("User updated successfully");
            } else {
                System.out.println("User update failed");
            }
        } catch (SQLException e) {
        }
    }

    public List<User> searchUserByUserName(String name) {
        List<User> listUser = new ArrayList<>();
        String sql = """
                     SELECT [user_id]
                           ,[username]
                           ,[password]
                           ,[Role]
                           ,[FirstName]
                           ,[LastName]
                           ,[Address]
                           ,[Phone]
                           ,[img]
                       FROM [dbo].[Users] where username like ?""";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setString(1, "%" + name + "%");
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                User u = new User(rs.getString("user_id"), rs.getString("username"), rs.getString("password"),
                        rs.getString("role"), rs.getString("FirstName"), rs.getString("LastName"),
                        rs.getString("Address"), rs.getString("Phone"), rs.getString("img"));
                listUser.add(u);

            }
        } catch (SQLException e) {
        }
        return listUser;
    }

    public List<User> searchUserByInfo(String info) {
        List<User> listUser = new ArrayList<>();
        String sql = "SELECT [user_id]\n"
                + "      ,[username]\n"
                + "      ,[password]\n"
                + "      ,[Role]\n"
                + "      ,[FirstName]\n"
                + "      ,[LastName]\n"
                + "      ,[Address]\n"
                + "      ,[Phone]\n"
                + "      ,[img]\n"
                + "  FROM [dbo].[Users] where FirstName like ? or username like ? or LastName like ? or Phone like ? ";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setString(1, "%" + info + "%");
            st.setString(2, "%" + info + "%");
            st.setString(3, "%" + info + "%");
            st.setString(4, "%" + info + "%");
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                User u = new User(rs.getString("user_id"), rs.getString("username"), rs.getString("password"),
                        rs.getString("role"), rs.getString("FirstName"), rs.getString("LastName"),
                        rs.getString("Address"), rs.getString("Phone"), rs.getString("img"));
                listUser.add(u);
            }
            rs.close();
            st.close();
        } catch (SQLException e) {
            // Log or handle the exception properly

        }
        return listUser;
    }

    public void updateProduct(Product product) {
        String sql = """
                     UPDATE [dbo].[Product]
                        SET [product_name] =?
                           ,[description] = ?
                           ,[category_id] = ?
                           ,[price] = ?    
                     \t  ,[quantity_available] =?
                     \t  ,[Img] =?
                     \t  WHERE product_id=?""";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setString(1, product.getProduct_name());
            st.setString(2, product.getDescription());
            st.setInt(3, product.getCategory().getId());
            st.setDouble(4, product.getPrice());
            st.setInt(5, product.getQuantity());
            st.setString(6, product.getImg());
            st.setInt(7, product.getProduct_id());
            st.executeUpdate();
        } catch (SQLException e) {
        }
    }

    public void addNewCategory(String category, String description) {
        String sql = """
                     INSERT INTO [dbo].[Category]
                                ([category_name]
                                ,[description])
                          VALUES
                                (?
                                ,?)""";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setString(1, category);
            st.setString(2, description);
            st.executeUpdate();
        } catch (SQLException e) {
        }

    }

    public void deleteOrderItems(String orderItem_id) {
        String sql = """
                     DELETE FROM [dbo].[Order_Item]
                           WHERE order_id=?""";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setString(1, orderItem_id);
            st.executeUpdate();
        } catch (SQLException e) {
        }

    }

    public void deteteOrderTable(String user_id) {
        String sql = """
                     DELETE FROM [dbo].[OrderTable]
                           WHERE customer_id=?""";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setString(1, user_id);
            st.executeUpdate();
        } catch (SQLException e) {
        }
    }

    public int countTotalReivew() {
        String sql = """
                     SELECT count(*) as [NumberOfReview]
                       FROM [SPORT].[dbo].[Review]""";
        int num = 0;
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            ResultSet rs = st.executeQuery();
            if (rs.next()) {
                num = rs.getInt("NumberOfReview");

            }

        } catch (SQLException e) {
        }
        return num;
    }

    public List<Orderdetail> getOrderByEachId() {
        String sql = """
                     \tSELECT product_id, SUM(quantity) AS total_quantity
                     FROM Order_Item
                     GROUP BY product_id;""";
        List<Orderdetail> list = new ArrayList<>();
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                Orderdetail d = new Orderdetail(rs.getString("product_id"), rs.getInt("total_quantity"));
                list.add(d);
            }
        } catch (SQLException e) {
        }
        return list;
    }

    public void delete(int id) {
         String sql = """
                    DELETE FROM [dbo].[Review]
                           WHERE product_id =?""";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setInt(1, id);
            st.executeUpdate();
        } catch (SQLException e) {
        }
        
        String sql1 = """
                     DELETE FROM [dbo].[Order_Item]
                           WHERE product_id=?""";
        try {
            PreparedStatement st1 = connection.prepareStatement(sql1);
            st1.setInt(1, id);
            st1.executeUpdate();
        } catch (SQLException e) {
        }
        String sql2 = """
                     DELETE FROM [Product]
                           WHERE product_id=?""";
        try {
            PreparedStatement st2 = connection.prepareStatement(sql2);
            st2.setInt(1, id);
            st2.executeUpdate();
        } catch (SQLException e) {

        }

    }

    public static void main(String[] args) {
        AdminDAO d = new AdminDAO();
        List<Orderdetail> list = d.getOrderByEachId();
        for (Orderdetail orderdetail : list) {
            System.out.println(orderdetail);
        }
    }

}
