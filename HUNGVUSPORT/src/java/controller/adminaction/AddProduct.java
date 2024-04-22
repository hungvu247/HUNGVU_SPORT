/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controller.adminaction;

import dal.AdminDAO;
import dal.DAO;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.util.List;
import model.Category;
import model.Product;

/**
 *
 * @author HUNG VU
 */
@WebServlet(name = "AddProduct", urlPatterns = {"/addProduct"})
public class AddProduct extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet AddProduct</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet AddProduct at " + request.getContextPath() + "</h1>");
            out.println("</body>");
            out.println("</html>");
        }
    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        DAO d = new DAO();
        List<Category> category = d.getALL();
        request.setAttribute("ListCate", category);
        request.getRequestDispatcher("AddProduct.jsp").forward(request, response);
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        /*CREATE TABLE Product (
    product_id INT IDENTITY(1,1) PRIMARY KEY,
    product_name NVARCHAR(255),
    description NVARCHAR(255),
    category_id INT,
    price DECIMAL(10, 2),
    quantity_available INT,
    FOREIGN KEY (category_id) REFERENCES Category(category_id)
);*/
        String name = request.getParameter("name_product");
        String description = request.getParameter("description");
        String category_id = request.getParameter("category_id");
        String price_raw = request.getParameter("price_product");
        String quantity_raw = request.getParameter("quantity_product");
        String img = request.getParameter("img");
        DAO d = new DAO();
        AdminDAO ad = new AdminDAO();
        double price;
        int quantity, category;
        try {
            price = Double.parseDouble(price_raw);
            quantity = Integer.parseInt(quantity_raw);
            category = Integer.parseInt(category_id);
            Category newCate = d.getCategoryByID(category);
            Product product = new Product(img, name, description, price, quantity, newCate);
            ad.addNewProduct(product);
            request.setAttribute("message", "Add product successfully");
            request.getRequestDispatcher("managerproduct").forward(request, response);
        } catch (NumberFormatException e) {
            System.out.println("Price or quantity is not number :" + e);
        }

    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
