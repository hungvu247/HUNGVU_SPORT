/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controller;

import dal.DAO;
import java.io.IOException;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.Cookie;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.util.List;
import model.Cart;
import model.Category;
import model.Items;

import model.Product;
import model.User;

/**
 *
 * @author HUNG VU
 */
@WebServlet(name = "Menu", urlPatterns = {"/menu"})
public class Menu extends HttpServlet {

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
        DAO d = new DAO();
        String indexPage = request.getParameter("index");
        if (indexPage == null) {
            indexPage = "1";
        }

        int index = Integer.parseInt(indexPage);
        List<Category> listCategory = d.getALL();
        int count = d.countProduct();
        int endPage = count / 5;
        if (count % 5 != 0) {//chia ko het thi phai cong
            endPage++;
        }
        List<Product> listProduct = d.pagingProduct(index);
        List<Product> listP = d.getAllProduct();
        Cookie[] arr = request.getCookies();
        String txt = "";
        if (arr != null) {
            for (Cookie o : arr) {
                if (o.getName().equals("Cart")) {
                    txt += o.getValue();
                }
            }
        }

        HttpSession session = request.getSession();

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

        request.setAttribute("endP", endPage);
        request.setAttribute("tag", index);
        request.setAttribute("listCate", listCategory);
        request.setAttribute("listP", listProduct);
        request.getRequestDispatcher("Menu.jsp").forward(request, response);
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
        // Lấy danh sách category từ database
        processRequest(request, response);

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
     * @retu rn a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
