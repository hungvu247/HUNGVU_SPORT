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

/**
 *
 * @author HUNG VU
 */
public class OrderDAO extends DBContext {

    public double totalMoneyMonth(int month) {
        String sql = "select sum(total_amount) from OrderTable "
                + "where MONTH(order_date)=? group by MONTH(order_date) ";
        try {
            PreparedStatement st = connection.prepareStatement(sql);

            st.setInt(1, month);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                return rs.getDouble(1);
            }
        } catch (SQLException e) {
        }
        return 0;
    }

    public int countOrder() {
        String sql = "select count(*) as [Number of order]from OrderTable";
        int numberOfOrder = 0;
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                return rs.getInt(1);
            }

            return numberOfOrder;
        } catch (SQLException e) {
        }
        return 0;
    }

    public int countTotalProduct() {
        String sql = "select quantity from Order_Item";
        int numberOfProduct = 0;
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                numberOfProduct += rs.getInt(1);
            }

            return numberOfProduct;
        } catch (SQLException e) {
        }
        return 0;
    }

    /**
     *
     * @return
     */
    public List<OrderTable> getAllOrder() {
        String sql = "select  * from OrderTable";
        List<OrderTable> list = new ArrayList<>();

        try {
            PreparedStatement st = connection.prepareStatement(sql);
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

    public List<OrderTable> getOrderByDate(String date) {
        String sql = "SELECT [order_id]\n"
                + "      ,[customer_id]\n"
                + "      ,[order_date]\n"
                + "      ,[total_amount]\n"
                + "      ,[status]\n"
                + "  FROM [dbo].[OrderTable] where order_date=?";
        List<OrderTable> list = new ArrayList<>();
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setString(1, date);
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
 public List<OrderTable> getAllOrderByUserId(String id) {
        List<OrderTable> list = new ArrayList<>();
        String sql = "select *from OrderTable where customer_id=?";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setString(1, id);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                OrderTable or = new OrderTable(rs.getInt("order_id"),
                        rs.getInt("customer_id"), rs.getDate("order_date"), rs.getString("status"),
                        rs.getDouble("total_amount"));
                list.add(or);
            }
        } catch (SQLException e) {
        }
        return list;
    }
 public List<OrderTable> getOrderByDateAndUserId(String date,String userID) {
        String sql = "SELECT [order_id]\n"
                + "      ,[customer_id]\n"
                + "      ,[order_date]\n"
                + "      ,[total_amount]\n"
                + "      ,[status]\n"
                + "  FROM [dbo].[OrderTable] where order_date=? and customer_id=?";
        List<OrderTable> list = new ArrayList<>();
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setString(1, date);
            st.setString(2, userID);
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
        OrderDAO order = new OrderDAO();
        List<OrderTable> list =order.getOrderByDateAndUserId("2024-05-02","10");
        for (OrderTable orderTable : list) {
            System.out.println(orderTable);
        }
    }
}
