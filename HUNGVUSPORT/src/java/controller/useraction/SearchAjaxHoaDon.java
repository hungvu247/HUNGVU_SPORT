/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controller.useraction;

import dal.AdminDAO;
import dal.OrderDAO;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.util.List;
import model.OrderTable;
import model.User;

/**
 *
 * @author HUNG VU
 */
@WebServlet(name = "SearchAjaxHoaDon", urlPatterns = {"/searchAjaxHoaDon"})
public class SearchAjaxHoaDon extends HttpServlet {

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
            out.println("<title>Servlet SearchAjaxHoaDon</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet SearchAjaxHoaDon at " + request.getContextPath() + "</h1>");
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
        String date = request.getParameter("ngayXuat");
        OrderDAO od = new OrderDAO();
        AdminDAO ad = new AdminDAO();
        List<User> listU = ad.getAllUser();
        List<OrderTable> list = od.getOrderByDate(date);
        PrintWriter out = response.getWriter();
        /*  for (Invoice o : listInvoiceByDate) {
        	for (Account a : listAllAccount) {
        		if(o.getAccountID() == a.getId()) {	
        			tongGia=Math.round((o.getTongGia()) * 100.0) / 100.0;
        	out.println("<tr>\r\n"
        			+ "                  <th scope=\"row\"></th>\r\n"
        			+ "                  <td>"+o.getMaHD()+"</td>\r\n"
        			+ "                  <td>"+a.getUser()+"</td>\r\n"
        			+ "                  <td>"+tongGia+"</td>\r\n"
        			+ "                  <td>"+o.getNgayXuat()+"</td> \r\n"
        			+ "                </tr>");
        		}
        		}
        }
         */
        for (OrderTable orderTable : list) {
            for (User u : listU) {
                if (Integer.parseInt(u.getId()) == orderTable.getCus_id()) {
                    out.println("<tr>\r\n"
                            + "                  <th scope=\"row\"></th>\r\n"
                            + "                  <td>" + orderTable.getOrder_id() + "</td>\r\n"
                            + "                  <td>" + u.getUsername()+ "</td>\r\n"
                            + "                  <td>" + orderTable.getTotal() + "</td>\r\n"
                            + "                  <td>" + orderTable.getOrder_date() + "</td> \r\n"
                            + "                </tr>");
                }
            }
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
