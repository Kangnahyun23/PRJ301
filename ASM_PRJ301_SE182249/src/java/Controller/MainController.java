/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Controller;

import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author Admin
 */
public class MainController extends HttpServlet {

    private static final String HOME_PAGE = "index.jsp";
    private static final String LOGIN_PAGE = "login.jsp";
    private static final String LOGIN = "Login";
    private static final String LOGIN_CONTROLLER = "LoginController";
    private static final String LOGOUT = "Logout";
    private static final String LOGOUT_CONTROLLER = "LogoutController";
    private static final String REGISTER = "Register";
    private static final String REGISTER_CONTROLLER = "RegisterController";
    private static final String CHANGEINFO = "Change";
    private static final String CHANGEINFO_CONTROLLER = "ChangeInformationController";
    private static final String CHANGEPASSWORD = "Change Password";
    private static final String CHANGEPASSWORD_CONTROLLER = "ChangePasswordController";

    private static final String SEARCHPRODUCT = "Search Product";
    private static final String SEARCHPRODUCT_CONTROLLER = "SearchProductController";
    private static final String SHOWLISTPRODUCT = "SearchProduct";
    private static final String SHOWLISTPRODUCT_CONTROLLER = "ShowListProductController";
    private static final String DELETEPRODUCT = "DeleteProduct";
    private static final String DELETEPRODUCT_CONTROLLER = "DeleteProductController";
    private static final String UPDATEPRODUCT = "UpdateProduct";
    private static final String UPDATEPRODUCT_CONTROLLER = "UpdateProductController";
    private static final String ADDPRODUCT = "Add Product";
    private static final String ADDPRODUCT_CONTROLLER = "AddNewProductController";
    private static final String ADDTOCART = "Add To Cart";
    private static final String ADDTOCART_CONTROLLER = "AddToCartController";
    private static final String ORDER = "Order";
    private static final String ORDER_CONTROLLER = "OrderController";
    private static final String REPORTORDER = "Show report";
    private static final String REPORTORDER_CONTROLLER = "ReportOrderController";
    private static final String UPDATEMINUS = "updateminus";
    private static final String UPDATEMINUS_CONTROLLER = "UpdateMinusQuantityController";
    private static final String UPDATEPLUS = "updateplus";
    private static final String UPDATEPLUS_CONTROLLER = "UpdatePlusQuantityController";
    private static final String REMOVE = "Remove";
    private static final String REMOVE_CONTROLLER = "RemoveInCartController";

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        String url = HOME_PAGE;
        try {
            String action = request.getParameter("action");
            if (action == null) {
                url = HOME_PAGE;
            }
//            your code here
            if (LOGIN.equalsIgnoreCase(action)) {
                url = LOGIN_CONTROLLER;
            } else if (LOGOUT.equalsIgnoreCase(action)) {
                url = LOGOUT_CONTROLLER;
            } else if (SHOWLISTPRODUCT.equals(action)) {
                url = SHOWLISTPRODUCT_CONTROLLER;
            } else if (DELETEPRODUCT.equals(action)) {
                url = DELETEPRODUCT_CONTROLLER;
            } else if (UPDATEPRODUCT.equals(action)) {
                url = UPDATEPRODUCT_CONTROLLER;
            } else if (ADDPRODUCT.equals(action)) {
                url = ADDPRODUCT_CONTROLLER;
            } else if (ADDTOCART.equals(action)) {
                url = ADDTOCART_CONTROLLER;
            } else if (REGISTER.equalsIgnoreCase(action)) {
                url = REGISTER_CONTROLLER;
            } else if (ORDER.equalsIgnoreCase(action)) {
                url = ORDER_CONTROLLER;
            } else if (UPDATEMINUS.equalsIgnoreCase(action)) {
                url = UPDATEMINUS_CONTROLLER;
            } else if (UPDATEPLUS.equalsIgnoreCase(action)) {
                url = UPDATEPLUS_CONTROLLER;
            } else if (REMOVE.equalsIgnoreCase(action)) {
                url = REMOVE_CONTROLLER;
            } else if (CHANGEINFO.equals(action)) {
                url = CHANGEINFO_CONTROLLER;
            } else if (CHANGEPASSWORD.equals(action)) {
                url = CHANGEPASSWORD_CONTROLLER;
            } else if (SEARCHPRODUCT.equalsIgnoreCase(action)) {
                url = SEARCHPRODUCT_CONTROLLER;
            } else if (REPORTORDER.equalsIgnoreCase(action)) {
                url = REPORTORDER_CONTROLLER;
            }
            System.out.println(action);
        } catch (Exception e) {
            log("Error at MainController: " + e.toString());
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
