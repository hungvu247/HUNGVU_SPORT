/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */

package controller.useraction;

import dal.DAO;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.util.List;
import model.Product;

/**
 *
 * @author HUNG VU
 */
@WebServlet(name="SearchAjaxPriceMinToMax", urlPatterns={"/searchAjaxPriceMinToMax"})
public class SearchAjaxPriceMinToMax extends HttpServlet {
   
    /** 
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code> methods.
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
            out.println("<title>Servlet SearchAjaxPriceMinToMax</title>");  
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet SearchAjaxPriceMinToMax at " + request.getContextPath () + "</h1>");
            out.println("</body>");
            out.println("</html>");
        }
    } 

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /** 
     * Handles the HTTP <code>GET</code> method.
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
    throws ServletException, IOException {
       DAO d = new DAO();
             String priceMin = request.getParameter("priceMin");
        String priceMax = request.getParameter("priceMax");
        List<Product> list = d.searchAjaxPriceMinToMax(Double.parseDouble(priceMin), Double.parseDouble(priceMax));
        PrintWriter out = response.getWriter();
        for (Product product : list) {
            out.println("""
                    <div class="col-lg-3 col-md-4 col-sm-6">
                        <div  class="single_product" style="width: 100%;">
                          <div class="product_thumb">
                         <a style="width: 200px" href="singleproduct?productId=""" + product.getProduct_id() + "\"><img style=\"width:280px;height: 250px;\" src=\"" + product.getImg() + "\" alt=\"\"></a>\n"
                    + "                    <div class=\"img_icone\">\n"
                    + "                    <img src=\"assets/img/cart/span-new.png\" alt=\"\">\n"
                    + "                      </div>\n"
                    + "                      <div class=\"product_action\">\n"
                    + "                       <a href=\"#\"> <i class=\"fa fa-shopping-cart\"></i> Add to cart</a>\n"
                    + "                        </div>\n"
                    + "                         </div>\n"
                    + "                    <div class=\"product_content\">\n"
                    + "                      <span class=\"product_price\">" + product.getPrice() + "$</span>\n"
                    + "                      <h3 class=\"product_title\"><a href=\"singleproduct?productId=" + product.getProduct_id() + "\">" + product.getProduct_name() + "</a></h3>\n"
                    + "                      </div>\n"
                    + "                  <div class=\"product_info\">\n"
                    + "              <ul>\n"
                    + "\n"
                    + "              <li><a href=\"#\" title=\"Add to Wishlist\">Add to Wishlist</a></li>\n"
                    + "               <li><a href=\"singleproduct?productId=" + product.getProduct_id() + "\">View Detail</a></li>\n"
                    + "                 </ul>\n"
                    + "              </div>\n"
                    + "          </div>\n"
                    + "\n"
                    + "                                                                    </div>");
        }
    } 

    /** 
     * Handles the HTTP <code>POST</code> method.
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
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
