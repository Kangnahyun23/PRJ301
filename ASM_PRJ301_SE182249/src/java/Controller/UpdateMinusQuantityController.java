/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Controller;

import Model.CartDTO;
import Model.ProductsDTO;
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;


/**
 *
 * @author PC
 */
@WebServlet(name = "UpdateMinusQuantityController", urlPatterns = {"/UpdateMinusQuantityController"})
public class UpdateMinusQuantityController extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    private static final String ERROR = "cart.jsp";
    private static final String SUCCESS = "cart.jsp";

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        String url = ERROR;
        try {
            int productId = Integer.parseInt(request.getParameter("productId"));
            
            HttpSession session = request.getSession();
            CartDTO cart = (CartDTO) session.getAttribute("CART");
            if (cart != null) {
                if (cart.getCart().containsKey(productId)) {
                    String productImage = cart.getCart().get(productId).getProductImage();
                    String productName = cart.getCart().get(productId).getProductName();
                    int supplierId = cart.getCart().get(productId).getSupplierId();
                    int categoryId = cart.getCart().get(productId).getCategoryId();
                    int quantity = cart.getCart().get(productId).getQuantity();
                    double unitPrice = cart.getCart().get(productId).getUnitPrice();
                    if (quantity > 1) {
                        quantity--;
                    }

                    ProductsDTO updatedProduct = new ProductsDTO(productId, productName, supplierId, categoryId,  unitPrice, productImage, quantity);
                    boolean check = cart.change(productId, updatedProduct);
                    if (check) {
                        session.setAttribute("CART", cart);
                        url = SUCCESS;
                    }

                }
            }
        } catch (Exception e) {
            log("Error at UpdateQuantityController: " + e.toString());
        } finally {
            request.getRequestDispatcher(url).forward(request, response);
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
