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
@WebServlet(name = "updateProduct", urlPatterns = {"/updateproduct"})
public class Updateproduct extends HttpServlet {

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
            out.println("<title>Servlet updateProduct</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet updateProduct at " + request.getContextPath() + "</h1>");
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
        String pid = request.getParameter("product_id");
        Product p = d.getProductBypid(pid);
        request.setAttribute("product", p);
        request.setAttribute("ListCate", category);
        request.getRequestDispatcher("Updateproduct.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String pid = request.getParameter("product_id");
        String name_product = request.getParameter("name_product");
        String description = request.getParameter("desciption");
        String category_id = request.getParameter("category_id");
        DAO d = new DAO();
        Category category = d.getCategoryByID(Integer.parseInt(category_id));
        String price_product = request.getParameter("price_product");
        String quantity_product = request.getParameter("quantity_product");
        String img = request.getParameter("img");

        Product product = new Product(img, Integer.parseInt(pid), name_product, description, Double.parseDouble(price_product), Integer.parseInt(quantity_product),
                category);

        AdminDAO ad = new AdminDAO();
        List<Category> listCategory = d.getALL();
        System.out.println(product);
        ad.updateProduct(product);

        request.setAttribute("product", product);
        request.setAttribute("message", "Update successfully");
        request.setAttribute("product", product);
        request.setAttribute("ListCate", listCategory);
        request.getRequestDispatcher("Updateproduct.jsp").forward(request, response);
    }

    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
