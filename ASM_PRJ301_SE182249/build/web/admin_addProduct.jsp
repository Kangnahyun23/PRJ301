<%-- 
    Document   : admin_addProduct
    Created on : Mar 3, 2025, 9:30:30 AM
    Author     : PC
--%>

<%@page import="Model.AccountDTO"%>
<%@page import="Model.CategoriesDTO"%>
<%@page import="Dao.CategoriesDAO"%>
<%@page import="java.util.List"%>
<%@page import="Model.SuppliersDTO"%>
<%@page import="Dao.SuppliersDAO"%>
<%@page import="Model.ProductError"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <link rel="stylesheet" href="css/style.css"/>
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css">
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
        <style>
            .container {
                max-width: 800px;
                margin: auto;
            }

            h2 {
                font-weight: bold;
                margin-bottom: 20px;
            }

            h5 {
                color: #d9534f;
                text-align: center;
                font-weight: bold;
            }

            .form-label {
                font-weight: bold;
            }

        </style>
    </head>
    <body>
        <%
            AccountDTO loginUser = (AccountDTO) session.getAttribute("LOGIN_USER");
            if (loginUser.getType() == 2) {
                response.sendRedirect("index.jsp");
                return;
            }
        %>
        <jsp:include page="header.jsp" />

        <%
            ProductError productError = (ProductError) request.getAttribute("PRODUCT_ERROR");
            if (productError == null) {
                productError = new ProductError();
            }
        %>
        <div class="container mt-4">
            <h2 class="text-center text-primary">Add new product</h2>
            <div>
                <%
                    String message = (String) request.getAttribute("MESSAGE");
                    if (message == null) {
                        message = "";
                    }
                %>
                <h5><%= message%></h5>
            </div>
            <form action="MainController" method="POST">
                <div class="row g-3">
                    <div class="col-md-12">
                        <label class="form-label">Product Name: </label>
                        <input type="text" class="form-control" name="productName" required>
                        <span class="text-danger"><%= productError.getProductName()%></span>
                    </div>

                    <div class="col-md-12">
                        <label class="form-label">Quantity: </label>
                        <input type="text" class="form-control" name="quantity" required>
                        <span class="text-danger"><%= productError.getQuantity()%></span>
                    </div>

                    <div class="col-md-12">
                        <label class="form-label">Unit Price</label>
                        <input type="text" class="form-control" name="unitPrice" required>
                        <span class="text-danger"><%= productError.getUnitPrice()%></span>
                    </div>

                    <div class="col-md-12">
                        <label class="form-label">Product Image: </label>
                        <input type="text" class="form-control" name="productImage" required>
                        <span class="text-danger"><%= productError.getProductImage()%></span>
                    </div>
                    <div class="col-md-12">
                        <label class="form-label">Supplier: </label>
                        <select name="supplierId" required>
                            <%
                                SuppliersDAO supplierDAO = new SuppliersDAO();
                                List<SuppliersDTO> suppliers = supplierDAO.getListSuppliers();
                                if (suppliers != null) {
                                    for (SuppliersDTO supplier : suppliers) {
                            %>
                            <option value="<%= supplier.getSupplierId()%>"><%= supplier.getCompanyName()%></option>
                            <%
                                    }
                                }
                            %>
                        </select>
                        <span class="text-danger"><%= productError.getSupplierId()%></span>
                    </div>

                    <div class="col-md-12">
                        <label class="form-label">Category: </label>
                        <select name="categoryId" required>
                            <%
                                CategoriesDAO categoryDAO = new CategoriesDAO();
                                List<CategoriesDTO> categories = categoryDAO.getListCategories();
                                if (categories != null) {
                                    for (CategoriesDTO category : categories) {
                            %>
                            <option value="<%= category.getCategoryId()%>"><%= category.getCategoryName()%></option>
                            <%
                                    }
                                }
                            %>
                        </select>
                        <span class="text-danger"><%= productError.getCategoryId()%></span>
                    </div>
                </div>
                <hr>
                <div class="text-center mt-4">
                    <button type="submit" class="btn btn-primary px-4" name="action" value="Add Product">Add Product</button>
                </div>
            </form>
        </div>
    </body>
</html>
