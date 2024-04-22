/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controller.adminaction;

import dal.AdminDAO;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.util.List;
import model.User;

/**
 *
 * @author HUNG VU
 */
@WebServlet(name = "searchUser", urlPatterns = {"/searchuser"})
public class Searchuser extends HttpServlet {

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
            out.println("<title>Servlet searchUser</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet searchUser at " + request.getContextPath() + "</h1>");
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
        HttpSession session = request.getSession();
        User uS = (User) session.getAttribute("user");
        String info = request.getParameter("info");
        PrintWriter out = response.getWriter();
        AdminDAO admin = new AdminDAO();
        System.out.println(info);
        List<User> listUser = admin.searchUserByInfo(info);
        for (User user : listUser) {
            if (user.getId().equals(uS.getId())) {
                listUser.remove(user);
                break;
            }
        }
        for (User u : listUser) {
            out.println("  <tr>\n"
                    + "    <td>" + u.getId() + "</td>\n"
                    + "    <td>" + u.getUsername() + "</td>\n"
                    + "    <td>" + u.getFirstName() + "</td>\n"
                    + "    <td>" + u.getLastName() + "</td>\n"
                    + "    <td>" + u.getAddress() + "</td>\n"
                    + "    <td>" + u.getPhone() + "</td>\n"
                    + "    <td>" + u.getRole() + "</td>\n"
                    + "    <td class=\"IMG\"><img class=\"img_user\" src=\"" + u.getImg() + "\" alt=\"alt\"/></td>\n"
                    + "    <td style=\"text-align: center\">\n"
                    + "           <select id=\"roleSelect\" style=\"margin: 0px;padding: 0\" onchange=\"redirectToServlet('"+u.getId()+"')\">\n"
                    + "                                                    <option value =\"Customer\">Customer</option>\n"
                    + "                                                    <option value =\"Admin\">Admin</option>\n"
                    + "                                                </select>"
                    + "    </td>\n"
                    + "</tr>");
        }

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

    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
