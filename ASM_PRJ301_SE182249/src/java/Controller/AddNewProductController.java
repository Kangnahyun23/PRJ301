/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Controller;

import Dao.ProductDAO;
import Model.ProductError;
import Model.ProductsDTO;
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author PC
 */
@WebServlet(name = "AddNewProductController", urlPatterns = {"/AddNewProductController"})
public class AddNewProductController extends HttpServlet {

    private static final String ERROR = "admin_addProduct.jsp";
    private static final String SUCCESS = "admin_addProduct.jsp";

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
        String url = ERROR;
        ProductDAO dao = new ProductDAO();
        ProductError productError = new ProductError();
        try {
            boolean checkValidation = true;
            boolean check2 = true;
            String productName = request.getParameter("productName");
            int supplierId = Integer.parseInt(request.getParameter("supplierId"));
            int categoryId = Integer.parseInt(request.getParameter("categoryId"));
            String quantityStr = request.getParameter("quantity");
            String priceStr = request.getParameter("unitPrice");
            String productImage = request.getParameter("productImage");
            double unitPrice = 0;
            int quantity = 0;
            if (!quantityStr.matches("\\d+")) {
                productError.setQuantity("Quantity must be a valid positive number");
                checkValidation = false;
            }
            if (!priceStr.matches("\\d+")) {
                productError.setUnitPrice("Price must be a valid positive number");
                checkValidation = false;
            }
            if (checkValidation) {
                unitPrice = Double.parseDouble(priceStr);
                quantity = Integer.parseInt(quantityStr);

                if (unitPrice <= 0) {
                    check2 = false;
                    productError.setUnitPrice("Price must be greater than 0");
                }
                if (quantity <= 0) {
                    check2 = false;
                    productError.setQuantity("Quantity must be greater than 0");
                }
            }
            if (checkValidation && check2) {
                ProductsDTO product = new ProductsDTO(productName, supplierId, categoryId, unitPrice, productImage, quantity);

                boolean check = dao.insert(product);

                if (check) {
                    request.setAttribute("MESSAGE", "Add successfully");
                    url = SUCCESS;
                }
            } else {
                request.setAttribute("PRODUCT_ERROR", productError);
            }

        } catch (Exception e) {
            log("Error at AddNewProductController: " + e.toString());

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
