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
@WebServlet(name = "SignUp", urlPatterns = {"/register"})
public class SignUp extends HttpServlet {

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
            out.println("<title>Servlet SignUp</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet SignUp at " + request.getContextPath() + "</h1>");
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
        request.getRequestDispatcher("NewAcount.jsp").forward(request, response);
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
        String username = request.getParameter("user");
        System.out.println(username);
        String pass_raw = request.getParameter("pass");
        String pass_repeat = request.getParameter("passConfirm");
        String f_name = request.getParameter("firstname");
        String l_name = request.getParameter("lastname");
        String address = request.getParameter("address");
        String phone = request.getParameter("phone");
        UserDAO dao = new UserDAO();
        User a = dao.checkUserExit(username);
        boolean valid = true;
        System.out.println("user from controller:" + a);
        if (a.getUsername() != null) {
            valid = false;
            request.setAttribute("erorr", "Found the username in the database");
            request.getRequestDispatcher("NewAcount.jsp").forward(request, response);
        }
        //Use a regular expression to see if the user has set a password with the correct system format
        if (!pass_raw.matches(".*[0-9].*") || !pass_raw.matches(".*[A-Z].*")) {
            valid = false;
            String mess = "Password must contain at least one digit and one uppercase letter!";
            request.setAttribute("erorr", mess);
            request.getRequestDispatcher("NewAcount.jsp").forward(request, response);
        }
        //Check password length
        if (pass_raw.length() < 8) {
            valid = false;
            String mess = "Password must be at least 8 characters!";
            request.setAttribute("erorr", mess);
            request.getRequestDispatcher("NewAcount.jsp").forward(request, response);
        }
        //Check the repassword
        if (!pass_raw.equals(pass_repeat)) {
            valid = false;
            String mess = "Password is not equal to confirm password";
            request.setAttribute("erorr", mess);
            request.getRequestDispatcher("NewAcount.jsp").forward(request, response);
        }
        
        User newUser = new User(username, pass_raw, phone, f_name, l_name, address, phone,"img\\defaultImg.jpg");
        if (valid == true) {
            dao.addNewUser(newUser);
            request.getRequestDispatcher("login.jsp").forward(request, response);
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
