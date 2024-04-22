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

import model.Category;
import model.Product;

/**
 *
 * @author HUNG VU
 */
public class DAO extends DBContext {
//lay ra các sản phẩm có trong DB

    public List<Category> getALL() {
        List<Category> list = new ArrayList<>();
        String sql = "Select *from Category";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                Category c = new Category();
                c.setId(rs.getInt("category_id"));
                c.setName(rs.getString("category_name"));
                c.setDescribe(rs.getString("description"));
                list.add(c);
            }
        } catch (SQLException e) {
            System.out.println("SQL getALL: " + e);
        } catch (Exception e) {
            System.out.println("getAll: " + e);
        }
        return list;
    }

    public Category getCategoryByID(int id) {
        String sql = "Select *from Category where category_id=?";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setInt(1, id);
            ResultSet rs = st.executeQuery();
            if (rs.next()) {
                Category c = new Category(rs.getInt("category_id"), rs.getString("category_name"), rs.getString("description"));
                return c;
            }
        } catch (SQLException e) {
            System.out.println("SQL getCategoryId: " + e);
        }
        return null;
    }

    public List<Product> getAllProduct() {
        List<Product> list = new ArrayList<>();
        String sql = "select *from Product";//in tất cả category ra màn hình khi ấn ALL
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                Product p = new Product();
                p.setProduct_id(rs.getInt("product_id"));
                p.setProduct_name(rs.getString("product_name"));
                p.setDescription(rs.getString("description"));
                p.setPrice(rs.getDouble("price"));
                p.setQuantity(rs.getInt("quantity_available"));
                p.setImg(rs.getString("Img"));
                Category c = getCategoryByID(rs.getInt("category_id"));
                p.setCategory(c);
                list.add(p);
            }

        } catch (SQLException e) {
            System.out.println("SQL getALl: " + e);
        }
        return list;
    }

    public List<Product> getAllProductByCid(String cid) {
        List<Product> list = new ArrayList<>();
        String sql = "SELECT * FROM Product WHERE category_id= ?";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setString(1, cid);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                Product p = new Product();
                p.setProduct_id(rs.getInt("product_id"));
                p.setProduct_name(rs.getString("product_name"));
                p.setDescription(rs.getString("description"));
                p.setPrice(rs.getDouble("price"));
                p.setQuantity(rs.getInt("quantity_available"));
                p.setImg(rs.getString("Img"));
                Category c = getCategoryByID(rs.getInt("category_id"));
                p.setCategory(c);
                list.add(p);
            }

        } catch (SQLException e) {
            System.out.println("SQL getproduct: " + e);
        }
        return list;
    }

    public List<Product> getAllProductCate(String cid1, String cid2) {
        List<Product> list = new ArrayList<>();
        String sql = "SELECT * FROM Product WHERE category_id= ? or category_id= ? ";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setString(1, cid1);
            st.setString(2, cid2);

            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                Product p = new Product();
                p.setProduct_id(rs.getInt("product_id"));
                p.setProduct_name(rs.getString("product_name"));
                p.setDescription(rs.getString("description"));
                p.setPrice(rs.getDouble("price"));
                p.setQuantity(rs.getInt("quantity_available"));
                p.setImg(rs.getString("Img"));
                Category c = getCategoryByID(rs.getInt("category_id"));
                p.setCategory(c);
                list.add(p);
            }

        } catch (SQLException e) {
            System.out.println("SQL getproduct: " + e);
        }
        return list;
    }

    public Product getProductBypid(String pid) {
        String sql = "SELECT * FROM Product WHERE product_id= ?";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setString(1, pid);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                Product p = new Product();
                p.setProduct_id(rs.getInt("product_id"));
                p.setProduct_name(rs.getString("product_name"));
                p.setDescription(rs.getString("description"));
                p.setPrice(rs.getDouble("price"));
                p.setQuantity(rs.getInt("quantity_available"));
                p.setImg(rs.getString("Img"));
                Category c = getCategoryByID(rs.getInt("category_id"));
                p.setCategory(c);
                return p;
            }

        } catch (SQLException e) {
            System.out.println("SQL getproduct: " + e);
        }
        return null;
    }

    public List<Product> getProduct(String pname) {
        List<Product> list = new ArrayList<>();
        String sql = "SELECT * FROM Product WHERE product_name LIKE ?";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setString(1, "%" + pname + "%");
            ResultSet rs = st.executeQuery();

            while (rs.next()) {
                Product p = new Product();
                p.setProduct_id(rs.getInt("product_id"));
                p.setProduct_name(rs.getString("product_name"));
                p.setDescription(rs.getString("description"));
                p.setPrice(rs.getDouble("price"));
                p.setQuantity(rs.getInt("quantity_available"));
                p.setImg(rs.getString("Img"));
                Category c = getCategoryByID(rs.getInt("category_id"));
                p.setCategory(c);
                list.add(p);
            }

        } catch (SQLException e) {
            System.out.println("SQL getproduct: " + e);
        }
        return list;
    }

    public int countProduct() {
        try {
            String sql = "select count(*)from Product ";

            PreparedStatement st = connection.prepareStatement(sql);
            ResultSet rs = st.executeQuery();

            // Process the result
            while (rs.next()) {
                return rs.getInt(1);
                //vi banng result chi co mot cot 
            }
        } catch (SQLException e) {
            System.out.println("SQL countProduct: " + e);
        } catch (Exception e) {
            System.out.println("countProduct: " + e);

        }
        return 0;
    }
//đếm sô sản phẩm có bao nhiêu kết quả  của pname sau đó chia 3 để tính số trang

    public int countProductByName(String pname) {
        try {
            String sql = "SELECT COUNT(*) FROM Product WHERE product_name LIKE ?";
            PreparedStatement st = connection.prepareStatement(sql);

            // Set the parameter before executing the query
            st.setString(1, "%" + pname + "%");

            ResultSet rs = st.executeQuery();

            // Process the result
            while (rs.next()) {
                return rs.getInt(1);
            }
        } catch (SQLException e) {
            System.out.println("SQL countProduct: " + e);
        } catch (Exception e) {
            System.out.println("countProduct: " + e);

        }
        return 0;
    }

    public List<Product> getAllOfProduct(int index, int size) {
        List<Product> list = new ArrayList<>();
        String sql = "with x as(select ROW_NUMBER()over (order  by product_id asc) as r ,*  \n"
                + "from Product )\n"
                + "select * from x where  r between ?*8-7 and ? * 8 ";//in tất cả category ra màn hình khi ấn ALL
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                Product p = new Product();
                p.setProduct_id(rs.getInt("product_id"));
                p.setProduct_name(rs.getString("product_name"));
                p.setDescription(rs.getString("description"));
                p.setPrice(rs.getDouble("price"));
                p.setQuantity(rs.getInt("quantity_available"));
                p.setImg(rs.getString("Img"));
                Category c = getCategoryByID(rs.getInt("category_id"));
                p.setCategory(c);
                list.add(p);
            }

        } catch (SQLException e) {
            System.out.println("SQL getALl: " + e);
        }
        return list;
    }

    public List<Product> search(String txtSearch, int index, int size) {
        try {
            String sql = "with x as(select ROW_NUMBER()over (order  by product_id asc) as r ,*  \n"
                    + "from Product where  product_name like ?)\n"
                    + "select * from x where  r between ?*4-3 and ? * 4 ";
            PreparedStatement st = connection.prepareStatement(sql);
            st.setString(1, "%" + txtSearch + "%");
            st.setInt(2, index);
            st.setInt(3, index);
            ResultSet rs = st.executeQuery();
            List<Product> list = new ArrayList<>();
            while (rs.next()) {
                Product p = new Product();
                p.setProduct_id(rs.getInt("product_id"));
                p.setProduct_name(rs.getString("product_name"));
                p.setDescription(rs.getString("description"));
                p.setPrice(rs.getDouble("price"));
                p.setQuantity(rs.getInt("quantity_available"));
                p.setImg(rs.getString("Img"));
                Category c = getCategoryByID(rs.getInt("category_id"));
                p.setCategory(c);
                list.add(p);
            }
            return list;
        } catch (SQLException e) {
        }
        return null;
    }

    public List<Product> getListProductAscByPrice() {
        List<Product> list = new ArrayList<>();
        String sql = " SELECT * FROM Product order by price asc";//in tất cả category ra màn hình khi ấn ALL
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                Product p = new Product();
                p.setProduct_id(rs.getInt("product_id"));
                p.setProduct_name(rs.getString("product_name"));
                p.setDescription(rs.getString("description"));
                p.setPrice(rs.getDouble("price"));
                p.setQuantity(rs.getInt("quantity_available"));
                p.setImg(rs.getString("Img"));
                Category c = getCategoryByID(rs.getInt("category_id"));
                p.setCategory(c);
                list.add(p);
            }

        } catch (SQLException e) {
            System.out.println(e);
        } catch (Exception e) {
            System.out.println("getListProductAscByPrice(): " + e);
        }
        return list;
    }

    public List<Product> getListProductDescByPrice() {
        List<Product> list = new ArrayList<>();
        String sql = " SELECT * FROM Product order by price desc";//in tất cả category ra màn hình khi ấn ALL
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                Product p = new Product();
                p.setProduct_id(rs.getInt("product_id"));
                p.setProduct_name(rs.getString("product_name"));
                p.setDescription(rs.getString("description"));
                p.setPrice(rs.getDouble("price"));
                p.setQuantity(rs.getInt("quantity_available"));
                p.setImg(rs.getString("img"));
                Category c = getCategoryByID(rs.getInt("category_id"));
                p.setCategory(c);
                list.add(p);
            }

        } catch (SQLException e) {
            System.out.println(e);
        } catch (Exception e) {
            System.out.println("getListProductDescByPrice(): " + e);
        }
        return list;
    }

    public List<Product> getListProductByFisrtChacracterDesc() {
        List<Product> list = new ArrayList<>();
        String sql = " SELECT * FROM Product\n"
                + "ORDER BY product_name desc;";//in tất cả category ra màn hình khi ấn ALL
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                Product p = new Product();
                p.setProduct_id(rs.getInt("product_id"));
                p.setProduct_name(rs.getString("product_name"));
                p.setDescription(rs.getString("description"));
                p.setPrice(rs.getDouble("price"));
                p.setQuantity(rs.getInt("quantity_available"));
                p.setImg(rs.getString("img"));
                Category c = getCategoryByID(rs.getInt("category_id"));
                p.setCategory(c);
                list.add(p);
            }

        } catch (SQLException e) {
            System.out.println(e);
        } catch (Exception e) {
            System.out.println("getListProductDescByPrice(): " + e);
        }
        return list;
    }

    public List<Product> getListProductByFisrtChacracterAsc() {
        List<Product> list = new ArrayList<>();
        String sql = " SELECT * FROM Product\n"
                + "ORDER BY product_name asc;";//in tất cả category ra màn hình khi ấn ALL
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                Product p = new Product();
                p.setProduct_id(rs.getInt("product_id"));
                p.setProduct_name(rs.getString("product_name"));
                p.setDescription(rs.getString("description"));
                p.setPrice(rs.getDouble("price"));
                p.setQuantity(rs.getInt("quantity_available"));
                p.setImg(rs.getString("img"));
                Category c = getCategoryByID(rs.getInt("category_id"));
                p.setCategory(c);
                list.add(p);
            }

        } catch (SQLException e) {
            System.out.println(e);
        } catch (Exception e) {
            System.out.println("getListProductDescByPrice(): " + e);
        }
        return list;
    }

    public List<Product> pagingProduct(int index) {
        List<Product> list = new ArrayList<>();
        String sql = "select * from Product \n"
                + "order by product_id \n"
                + "offset ? rows fetch next 5 rows only";
        try (PreparedStatement st = connection.prepareStatement(sql)) {
            st.setInt(1, (index - 1) * 5);
            ResultSet rs = st.executeQuery();

            while (rs.next()) {
                Product p = new Product();
                p.setProduct_id(rs.getInt("product_id"));
                p.setProduct_name(rs.getString("product_name"));
                p.setDescription(rs.getString("description"));
                p.setPrice(rs.getDouble("price"));
                p.setQuantity(rs.getInt("quantity_available"));
                p.setImg(rs.getString("Img"));
                Category c = getCategoryByID(rs.getInt("category_id"));
                p.setCategory(c);
                list.add(p);
            }

        } catch (SQLException e) {
            System.out.println("SQL getAll: " + e);
        }

        return list;
    }

    public List<Product> getProductInforSingleProduct(int numberOfProducts) {
        List<Product> list = new ArrayList<>();

        String sql = "SELECT TOP (?) * FROM Product ORDER BY NEWID()";

        try (PreparedStatement st = connection.prepareStatement(sql)) {
            st.setInt(1, numberOfProducts);

            try (ResultSet rs = st.executeQuery()) {
                while (rs.next()) {
                    Product p = new Product();
                    p.setProduct_id(rs.getInt("product_id"));
                    p.setProduct_name(rs.getString("product_name"));
                    p.setDescription(rs.getString("description"));
                    p.setPrice(rs.getDouble("price"));
                    p.setQuantity(rs.getInt("quantity_available"));
                    p.setImg(rs.getString("Img"));
                    Category c = getCategoryByID(rs.getInt("category_id"));
                    p.setCategory(c);
                    list.add(p);
                }
            }
        } catch (SQLException e) {
            System.out.println("SQL getAll: " + e);
        }

        return list;
    }


    public List<Product> searchProduct(String txtSearch, int index, int size) {
        List<Product> list = new ArrayList<>();
        String sql = "with x as (select ROW_NUMBER()over(order by product_id asc) as r,"
                + "* from Product \n"
                + "where product_name like ?)"
                + "select * from x where r between ? and ? ";
        try (PreparedStatement st = connection.prepareStatement(sql)) {
            st.setString(1, "%" + txtSearch + "%");
            st.setInt(2, (index - 1) * size + 1);
            st.setInt(3, index * size);
            ResultSet rs = st.executeQuery();

            while (rs.next()) {
                Product p = new Product();
                p.setProduct_id(rs.getInt("product_id"));
                p.setProduct_name(rs.getString("product_name"));
                p.setDescription(rs.getString("description"));
                p.setPrice(rs.getDouble("price"));
                p.setQuantity(rs.getInt("quantity_available"));
                p.setImg(rs.getString("Img"));
                Category c = getCategoryByID(rs.getInt("category_id"));
                p.setCategory(c);
                list.add(p);
            }

        } catch (SQLException e) {
            System.out.println("SQL getAll: " + e);
        }

        return list;
    }

    public List<Product> searchAjaxPriceUnder200Shop(int price) {
        List<Product> list = new ArrayList<>();
        String sql = "SELECT [product_id]\n"
                + "      ,[product_name]\n"
                + "      ,[description]\n"
                + "      ,[category_id]\n"
                + "      ,[price]\n"
                + "      ,[quantity_available]\n"
                + "      ,[Img]\n"
                + "  FROM [dbo].[Product] where price < ?";
        try (PreparedStatement st = connection.prepareStatement(sql)) {
            st.setInt(1, price);
            ResultSet rs = st.executeQuery();

            while (rs.next()) {
                Product p = new Product();
                p.setProduct_id(rs.getInt("product_id"));
                p.setProduct_name(rs.getString("product_name"));
                p.setDescription(rs.getString("description"));
                p.setPrice(rs.getDouble("price"));
                p.setQuantity(rs.getInt("quantity_available"));
                p.setImg(rs.getString("Img"));
                Category c = getCategoryByID(rs.getInt("category_id"));
                p.setCategory(c);
                list.add(p);
            }

        } catch (SQLException e) {
            System.out.println("SQL getAll: " + e);
        }

        return list;
    }

    public List<Product> searchAjaxPriceAbove500Shop(int price) {
        List<Product> list = new ArrayList<>();
        String sql = "SELECT [product_id]\n"
                + "      ,[product_name]\n"
                + "      ,[description]\n"
                + "      ,[category_id]\n"
                + "      ,[price]\n"
                + "      ,[quantity_available]\n"
                + "      ,[Img]\n"
                + "  FROM [dbo].[Product] where price > ?";
        try (PreparedStatement st = connection.prepareStatement(sql)) {
            st.setInt(1, price);
            ResultSet rs = st.executeQuery();

            while (rs.next()) {
                Product p = new Product();
                p.setProduct_id(rs.getInt("product_id"));
                p.setProduct_name(rs.getString("product_name"));
                p.setDescription(rs.getString("description"));
                p.setPrice(rs.getDouble("price"));
                p.setQuantity(rs.getInt("quantity_available"));
                p.setImg(rs.getString("Img"));
                Category c = getCategoryByID(rs.getInt("category_id"));
                p.setCategory(c);
                list.add(p);
            }

        } catch (SQLException e) {
            System.out.println("SQL getAll: " + e);
        }

        return list;
    }

    public List<Product> searchAjaxPriceMinToMax(double minPrice, double maxPrice) {
        List<Product> list = new ArrayList<>();
        String sql = "SELECT [product_id]\n"
                + "      ,[product_name]\n"
                + "      ,[description]\n"
                + "      ,[category_id]\n"
                + "      ,[price]\n"
                + "      ,[quantity_available]\n"
                + "      ,[Img]\n"
                + "  FROM [dbo].[Product] where price between ? and ?";
        try (PreparedStatement st = connection.prepareStatement(sql)) {
            st.setDouble(1, minPrice);
            st.setDouble(2, maxPrice);

            ResultSet rs = st.executeQuery();

            while (rs.next()) {
                Product p = new Product();
                p.setProduct_id(rs.getInt("product_id"));
                p.setProduct_name(rs.getString("product_name"));
                p.setDescription(rs.getString("description"));
                p.setPrice(rs.getDouble("price"));
                p.setQuantity(rs.getInt("quantity_available"));
                p.setImg(rs.getString("Img"));
                Category c = getCategoryByID(rs.getInt("category_id"));
                p.setCategory(c);
                list.add(p);
            }

        } catch (SQLException e) {
            System.out.println("SQL getAll: " + e);
        }

        return list;
    }

}
