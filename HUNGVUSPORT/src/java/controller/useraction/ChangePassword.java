/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controller.useraction;

import dal.UserDAO;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import model.User;

/**
 *
 * @author HUNG VU
 */
@WebServlet(name = "ChangePassword", urlPatterns = {"/changepassword"})
public class ChangePassword extends HttpServlet {

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
            out.println("<title>Servlet ChangePassword</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet ChangePassword at " + request.getContextPath() + "</h1>");
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
        request.getRequestDispatcher("Changepass.jsp").forward(request, response);
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String oldpassword = request.getParameter("oldpass");
        String pass_raw = request.getParameter("newpass");
        String pass_repeat = request.getParameter("passConfirm");
        String id = request.getParameter("user_id");
        UserDAO ud = new UserDAO();
        User u = ud.getUserById(id);
        if (u == null || !oldpassword.equals(u.getPassword())) {
            request.setAttribute("msg", "old pass wrong");
            request.getRequestDispatcher("Changepass.jsp").forward(request, response);
            return; // Added to stop further execution
        }

        boolean valid = true;
        if (!pass_raw.matches(".*[0-9].*") || !pass_raw.matches(".*[A-Z].*")) {
            valid = false;
            String mess = "Password must contain at least one digit and one uppercase letter!";
            request.setAttribute("msg", mess);
            request.getRequestDispatcher("Changepass.jsp").forward(request, response);
            return; // Added to stop further execution
        }
        //Check password length
        if (pass_raw.length() < 8) {
            valid = false;
            String mess = "Password must be at least 8 characters!";
            request.setAttribute("msg", mess);
            request.getRequestDispatcher("Changepass.jsp").forward(request, response);
            return; // Added to stop further execution
        }
        //Check the repassword
        if (!pass_raw.equals(pass_repeat)) {
            valid = false;
            String mess = "Password is not equal to confirm password";
            request.setAttribute("msg", mess);
            request.getRequestDispatcher("Changepass.jsp").forward(request, response);
            return; // Added to stop further execution
        }
        ud.changePassWord(pass_raw, u);
        request.setAttribute("success", "Change password successfully");
        request.getRequestDispatcher("Changepass.jsp").forward(request, response);
    }

    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
