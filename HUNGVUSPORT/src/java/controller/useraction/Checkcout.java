/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controller.useraction;

import dal.CartDAO;
import dal.DAO;
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
import model.User;

/**
 *
 * @author HUNG VU
 */
@WebServlet(name = "Checkcout", urlPatterns = {"/checkcout"})
public class Checkcout extends HttpServlet {

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
            out.println("<title>Servlet Checkcout</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet Checkcout at " + request.getContextPath() + "</h1>");
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
        DAO d = new DAO();
        List<Product> list = d.getAllProduct();
        Cookie[] arr = request.getCookies();
        String txt = "";
        if (arr != null) {
            for (Cookie o : arr) {
                if (o.getName().equals("Cart")) {
                    txt += o.getValue();
                    o.setMaxAge(0);
                    response.addCookie(o);
                }
            }
        }
        HttpSession session = request.getSession();
        User u = (User) session.getAttribute("user");
        CartDAO cc = new CartDAO();
        Cart cart = new Cart(txt, list, u.getUsername());
        cc.addOrder(u, cart);
        if (u == null) {
            response.sendRedirect("login");

        } else {
            List<Items> listItems = (List<Items>) session.getAttribute("listItems");
            for (Items listItem : listItems) {
                System.out.println(listItem.getProduct());
            }
            for (Items listItem : listItems) {
                cart.removeItems(listItem.getProduct().getProduct_id());
            }
            String text1 = "";

            String[] TemptItem = txt.split("/");

            PrintWriter out = response.getWriter();

            if (!TemptItem[0].contains(u.getUsername())) {

                text1 += TemptItem[0];

            }

            for (int i = 1; i < TemptItem.length; i++) {

                if (!TemptItem[i].contains(u.getUsername())) {

                    text1 += "/" + TemptItem[i];

                }

            }
            List<Items> items = cart.getItems();
            txt = "";
            if (items.size() > 0) {
                if (text1.isEmpty()) {
                    text1 = u.getUsername() + ":" + items.get(0).getProduct().getProduct_id() + ":" + items.get(0).getQuantity();
                    for (int i = 1; i < items.size(); i++) {
                        text1 += "/" + u.getUsername() + ":" + items.get(i).getProduct().getProduct_id() + ":" + items.get(i).getQuantity();
                    }
                } else {
                    for (int i = 0; i < items.size(); i++) {
                        text1 += "/" + u.getUsername() + ":" + items.get(i).getProduct().getProduct_id() + ":" + items.get(i).getQuantity();
                    }
                }

            }
            Cookie c = new Cookie("Cart", text1);
            c.setMaxAge(2 * 60 * 60 * 24);
            response.addCookie(c);

            List<Items> list1 = cart.getItems();
            int total = 0;

            System.out.println("hello total" + total);

            request.getRequestDispatcher("menu").forward(request, response);
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
