/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controller.category;

import dal.AdminDAO;
import dal.DAO;
import dal.ReviewDAO;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.Cookie;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import java.util.List;
import model.Cart;
import model.Items;
import model.Product;
import model.Review;
import model.User;

/**
 *
 * @author HUNG VU
 */
@WebServlet(name = "SingleProduct", urlPatterns = {"/singleproduct"})
public class SingleProduct extends HttpServlet {

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
   
     Cookie[] arr = request.getCookies();
            String txt = "";
            if (arr != null) {
                for (Cookie o : arr) {
                    if (o.getName().equals("Cart")) {
                        txt += o.getValue();
                    }
                }
            }
            DAO d = new DAO();
             HttpSession session = request.getSession();

             List<Product> listP = d.getAllProduct();
              User u = (User) session.getAttribute("user");
            if (u != null) {
                Cart cart = new Cart(txt, listP, u.getUsername());
                int n;//so luong items
                List<Items> listItems = cart.getItems();
                if (listItems != null) {
                    n = listItems.size();
                } else {
                    n = 0;
                }
                request.setAttribute("size", n);
                request.setAttribute("listCart", listItems);
            }

            String id = (String)session.getAttribute("productId");
           
            List<Product> list11random = d.getProductInforSingleProduct(4);
            List<Product> list11random2 = d.getProductInforSingleProduct(4);
            Product p = d.getProductBypid(id);
            ReviewDAO review = new ReviewDAO();
            String pid = "" + p.getProduct_id();
            List<Review> list = review.getAllReview(pid);
            AdminDAO ad = new AdminDAO();
            List<User> listU = ad.getAllUser();
            request.setAttribute("listAllUser", listU);
            request.setAttribute("listReview", list);
            request.setAttribute("product", p);
            request.setAttribute("list11random", list11random);
            request.setAttribute("list11random2", list11random2);
            request.getRequestDispatcher("single-product.jsp").forward(request, response);
        
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
        Cookie[] arr = request.getCookies();
            String txt = "";
            if (arr != null) {
                for (Cookie o : arr) {
                    if (o.getName().equals("Cart")) {
                        txt += o.getValue();
                    }
                }
            }
            DAO d = new DAO();
             HttpSession session = request.getSession();

             List<Product> listP = d.getAllProduct();
              User u = (User) session.getAttribute("user");
            if (u != null) {
                Cart cart = new Cart(txt, listP, u.getUsername());
                int n;//so luong items
                List<Items> listItems = cart.getItems();
                if (listItems != null) {
                    n = listItems.size();
                } else {
                    n = 0;
                }
                request.setAttribute("size", n);
                request.setAttribute("listCart", listItems);
            }

            String id = request.getParameter("productId");
           
            List<Product> list11random = d.getProductInforSingleProduct(4);
            List<Product> list11random2 = d.getProductInforSingleProduct(4);
            Product p = d.getProductBypid(id);
            ReviewDAO review = new ReviewDAO();
            String pid = "" + p.getProduct_id();
            List<Review> list = review.getAllReview(pid);
            AdminDAO ad = new AdminDAO();
            List<User> listU = ad.getAllUser();
            request.setAttribute("listAllUser", listU);
            request.setAttribute("listReview", list);
            request.setAttribute("product", p);
            request.setAttribute("list11random", list11random);
            request.setAttribute("list11random2", list11random2);
            request.getRequestDispatcher("single-product.jsp").forward(request, response);
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
        processRequest(request, response);
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
