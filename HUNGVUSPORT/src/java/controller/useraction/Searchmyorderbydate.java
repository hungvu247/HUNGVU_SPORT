/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controller.useraction;

import dal.AdminDAO;
import dal.CartDAO;
import dal.OrderDAO;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.util.List;
import model.OrderTable;
import model.User;

/**
 *
 * @author HUNG VU
 */
@WebServlet(name = "Searchmyorderbydate", urlPatterns = {"/searchmyorderbydate"})
public class Searchmyorderbydate extends HttpServlet {

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
            out.println("<title>Servlet Searchmyorderbydate</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet Searchmyorderbydate at " + request.getContextPath() + "</h1>");
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
        User u1 = (User) session.getAttribute("user");
        String userid = u1.getId();

        String date = request.getParameter("ngayXuat");
        OrderDAO od = new OrderDAO();
        AdminDAO ad = new AdminDAO();
        List<User> listU = ad.getAllUser();
        PrintWriter out = response.getWriter();
        List<OrderTable> list = od.getOrderByDateAndUserId(date, userid);
        
        int sum=0;
        for (OrderTable orderTable : list) {
            sum+=orderTable.getTotal();
        }
        request.setAttribute("total", sum);
        request.setAttribute("size", list.size());
        for (OrderTable order : list) {

            out.println(" <tr>\n"
                    + "<td>"+order.getOrder_id()+"</td>\n"
                    + " <td>"+order.getOrder_date()+"</td>\n"
                    + "<td>"+order.getStatus()+"</td>\n"
                    + "<td>$"+ order.getTotal()+"</td>\n"
                    + " <td><a href=\"viewOrder.jsp?orderId="+order.getOrder_id()+"\" class=\"view\">View</a></td>\n"
                    + "</tr>"
            );
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
