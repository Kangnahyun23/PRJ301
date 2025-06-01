/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Controller;

import Dao.AccountDAO;
import Model.AccountDTO;
import Model.AccountError;
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
 * @author Admin
 */
@WebServlet(name = "RegisterController", urlPatterns = {"/RegisterController"})
public class RegisterController extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    private static final String ERROR = "register.jsp";
    private static final String SUCCESS = "register.jsp";

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        String url = ERROR;
        AccountDAO dao = new AccountDAO();
        AccountError accountError = new AccountError();
        try {
            String userName = request.getParameter("userName");
            String fullName = request.getParameter("fullName");
            int type = Integer.parseInt(request.getParameter("type"));
            String password = request.getParameter("password");
            String confirm = request.getParameter("confirm");

            HttpSession session = request.getSession();
            boolean checkValidation = true;
            if (userName.length() > 50 || userName.length() < 2) {
                accountError.setUserName("User name must [2,50]");
                checkValidation = false;
            }
            if (fullName.length() > 50 || fullName.length() < 5) {
                accountError.setFullName("fullName  must [5,50]");
                checkValidation = false;
            }
            if (!password.equals(confirm)) {
                accountError.setConfirm("Password is not duplicate");
                checkValidation = false;
            }
            if (checkValidation) {
                AccountDTO account = new AccountDTO(0, userName, password, fullName, type);
                boolean checkInsert = dao.insertAccount(account);
                if (checkInsert) {
                    url = SUCCESS;
                    request.setAttribute("MESSAGE", "You register successfully " + fullName);
                } else {
                    request.setAttribute("ERROR", "Register fail!");
                }
            } else {
                request.setAttribute("USER_ERROR", accountError);
            }
        } catch (Exception e) {
            log("Error at RegisterController: " + e.toString());

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
