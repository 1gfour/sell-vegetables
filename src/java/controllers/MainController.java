/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controllers;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author PhatPH
 */
@WebServlet(name = "MainController", urlPatterns = {"/MainController"})
public class MainController extends HttpServlet {

    private static final String ERROR = "error.jsp";
    private static final String LOGIN = "Login";
    private static final String LOGIN_CONTROLLER = "LoginController";
    private static final String ADDTOCART = "Add";
    private static final String ADDTOCART_CONTROLLER = "AddToCartController";
    private static final String PRODUCT = "Product";
    private static final String PRODUCT_PAGE = "ProductDisplayController";
    private static final String PRODUCTS = "Products";
    private static final String PRODUCT_MANAGEMENT = "ProductManagement";
    private static final String CREATE = "Create";
    private static final String CREATE_PAGE = "CreateController";
    private static final String LOGOUT = "Logout";
    private static final String LOGOUT_CONTROLLER = "LogoutController";
    private static final String UPDATE_PRODUCT = "Update Product";
    private static final String UPDATE_PRODUCT_CONTROLLER = "UpdateProductController";
    private static final String ADD_PRODUCT = "Add Product";
    private static final String ADD_PRODUCT_CONTROLLER = "AddProductController";
    private static final String REMOVE_PRODUCT = "Remove Product";
    private static final String REMOVE_PRODUCT_CONTROLLER = "RemoveProductController";

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        String url = ERROR;
        try {
            String action = request.getParameter("action");
            if (action == null || action.equalsIgnoreCase("")) {
                url = PRODUCT_PAGE;
            } else if (LOGIN.equals(action)) {
                url = LOGIN_CONTROLLER;
            } else if (ADDTOCART.equals(action)) {
                url = ADDTOCART_CONTROLLER;
            } else if (CREATE.equals(action)) {
                url = CREATE_PAGE;
            } else if (PRODUCT.equals(action)) {
                url = PRODUCT_PAGE;
            } else if (LOGOUT.equals(action)) {
                url = LOGOUT_CONTROLLER;
            } else if (PRODUCTS.equals(action)) {
                url = PRODUCT_MANAGEMENT;
            } else if (UPDATE_PRODUCT.equals(action)) {
                url = UPDATE_PRODUCT_CONTROLLER;
            } else if (ADD_PRODUCT.equals(action)) {
                url = ADD_PRODUCT_CONTROLLER;
            } else if (REMOVE_PRODUCT.equals(action)) {
                url = REMOVE_PRODUCT_CONTROLLER;
            }
        } catch (Exception e) {
            log("Error at MainController" + e.toString());
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
