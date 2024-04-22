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
import model.OrderTable;
import model.User;

/**
 *
 * @author HUNG VU
 */
public class UserDAO extends DBContext {

    PreparedStatement pstm;

    public void connect() {
    }

    public User getUser(String user, String pass) {
        String sql = "SELECT * FROM Users WHERE username = ? AND password = ?";
        try {
            pstm = connection.prepareStatement(sql);
            pstm.setString(1, user); // Thiết lập giá trị cho tham số thứ nhất
            pstm.setString(2, pass); // Thiết lập giá trị cho tham số thứ hai
            ResultSet rs = pstm.executeQuery();
            while (rs.next()) {
                User u = new User(rs.getString("user_id"), rs.getString("username"), rs.getString("password"),
                        rs.getString("role"), rs.getString("FirstName"), rs.getString("LastName"),
                        rs.getString("Address"), rs.getString("Phone"), rs.getString("phone"));
                return u;
            }

        } catch (SQLException e) {
            System.out.println("SQL getUserByEmailAndPassword: " + e.getMessage());
            return null;
        } catch (Exception e) {
            System.out.println("getUserByEmailAndPassword: " + e.getMessage());
            return null;
        }
        return null;
    }

    public User getUserById(String id) {
        String sql = " select  * FROM [dbo].[Users]\n"
                + "      where user_id=?";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setString(1, id);
            ResultSet rs = st.executeQuery();
            if (rs.next()) {
                User u = new User(rs.getString("user_id"), rs.getString("username"), rs.getString("password"),
                        rs.getString("role"), rs.getString("FirstName"), rs.getString("LastName"),
                        rs.getString("Address"), rs.getString("Phone"), rs.getString("img"));
                return u;
            }
        } catch (SQLException e) {
        }
        return null;
    }

    public void addNewUser(User user) {
        try {
            String sql;
            sql = """
                 INSERT INTO [dbo].[Users]
                             ([username]
                             ,[password]
                             ,[Role]
                             ,[FirstName]
                             ,[LastName]
                             ,[Address]
                             ,[Phone]
                             ,[img])
                       VALUES
                             (?
                             ,?
                             ,?
                             ,?
                             ,?
                             ,?
                             ,?
                             ,?)""";

            pstm = connection.prepareStatement(sql);
            pstm.setString(1, user.getUsername());
            pstm.setString(2, user.getPassword());
            pstm.setString(3, "customer");
            pstm.setString(4, user.getFirstName());
            pstm.setString(5, user.getLastName());
            pstm.setString(6, user.getAddress());
            pstm.setString(7, user.getPhone());
            pstm.setString(8, "img\\defaultImg.jpg");

            pstm.execute();

        } catch (SQLException e) {
            System.out.println("SQL addNewUser: " + e.getMessage());
        } catch (Exception e) {
            System.out.println("addNewUser: " + e.getMessage());
        }
    }

    public User checkUserExit(String username) {

        String sql = "SELECT [user_id]\n"
                + "      ,[username]\n"
                + "      ,[password]\n"
                + "      ,[Role]\n"
                + "      ,[FirstName]\n"
                + "      ,[LastName]\n"
                + "      ,[Address]\n"
                + "      ,[Phone]\n"
                + "      ,[img]\n"
                + "  FROM [dbo].[Users] where [username]=?";
        try {
            pstm = connection.prepareStatement(sql);
            pstm.setString(1, username); // Thiết lập giá trị cho tham số thứ nhất
            ResultSet rs = pstm.executeQuery();
            User u = new User();
            while (rs.next()) {
                u.setUsername(rs.getString("user_id"));
                u.setPassword(rs.getString("username"));
                u.setRole(rs.getString("Role"));
                u.setFirstName(rs.getString("FirstName"));
                u.setLastName(rs.getString("LastName"));
                u.setAddress(rs.getString("Address"));
                u.setPhone(rs.getString("Phone"));
                u.setImg(rs.getString("img"));

            }
            System.out.println("user: " + u);
            return u;
        } catch (SQLException e) {
            System.out.println("SQL checkUserExit: " + e.getMessage());
            return null;
        } catch (Exception e) {
            System.out.println("checkUserExit:" + e.getMessage());
            return null;
        }

    }

    public void updateUser(User user) {
        String sql = "UPDATE [dbo].[Users]\n"
                + "SET [username] = ?,\n"
                + "    [password] = ?,\n"
                + "    [Role] = ?,\n"
                + "    [FirstName] = ?,\n"
                + "    [LastName] = ?,\n"
                + "    [Address] = ?,\n"
                + "    [Phone] = ?,\n"
                + "    [img] = ?\n"
                + "WHERE user_id=?";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setString(1, user.getUsername());
            st.setString(2, user.getPassword());
            st.setString(3, user.getRole());
            st.setString(4, user.getFirstName());
            st.setString(5, user.getLastName());
            st.setString(6, user.getAddress());
            st.setString(7, user.getPhone());
            st.setString(8, user.getImg());
            st.setString(9, user.getId());

            int rowsUpdated = st.executeUpdate();

            if (rowsUpdated > 0) {
                System.out.println("User updated successfully");
            } else {
                System.out.println("User update failed");
            }

        } catch (SQLException e) {
            e.printStackTrace(); // Handle the exception appropriately
        }
    }

    public void changePassWord(String newpass, User user) {
        String sql = "UPDATE [dbo].[Users]\n"
                + "   SET\n"
                + "      [password] = ?\n"
                + "    \n"
                + " WHERE user_id=?";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setString(1, newpass);
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

    public List<OrderTable> listByUserId(String id) {
        String sql = "select * from OrderTable where customer_id=?";
        List<OrderTable> list = new ArrayList<>();

        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setString(1, id);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                OrderTable ordertable = new OrderTable(
                        rs.getInt("order_id"),
                        rs.getInt("customer_id"),
                        rs.getDate("order_date"),
                        rs.getString("status"),
                        rs.getDouble("total_amount"));
                list.add(ordertable);
            }

            return list;
        } catch (SQLException e) {
        }
        return null;

    }

    public static void main(String[] args) {
        UserDAO d = new UserDAO();
        System.out.println(d.checkUserExit("admin1"));
    }
}
