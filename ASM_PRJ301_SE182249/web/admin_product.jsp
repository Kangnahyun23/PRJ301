<%-- 
    Document   : admin_product
    Created on : Mar 3, 2025, 9:18:39 AM
    Author     : PC
--%>

<%@page import="Dao.ProductDAO"%>
<%@page import="Model.AccountDTO"%>
<%@page import="java.util.List"%>
<%@page import="Model.ProductsDTO"%>
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
            h1 {
                text-align: center;
                color: #007bff;
                margin-bottom: 20px;
            }
            .form-container {
                display: flex;
                justify-content: flex-end;
                align-items: center;
            }

            form {
                display: flex;
                gap: 10px;
            }

            .search {
                width: 250px;
                padding: 8px;
                border: 1px solid #ccc;
                border-radius: 5px;
                font-size: 14px;
                transition: all 0.3s ease-in-out;
            }

            .search:focus {
                border-color: #007bff;
                outline: none;
            }
            .table {
                background-color: #fff;
                box-shadow: 0px 4px 8px rgba(0, 0, 0, 0.1);
                border-radius: 5px;
            }

            .table thead {
                background-color: #007bff;
                color: white;
                text-align: center;
            }

            .td-hidden {
                text-align: center;
                vertical-align: middle;
            }

            .td-hidden img {
                border-radius: 5px;
            }

            .td-button {
                text-align: center;
            }

            .btn-primary {
                border-radius: 5px;
                padding: 5px 10px;
                font-size: 14px;
            }

            .modal-content {
                border-radius: 10px;
            }

            .modal-header {
                background-color: #007bff;
                color: white;
                border-top-left-radius: 10px;
                border-top-right-radius: 10px;
            }

            .modal-footer {
                display: flex;
                justify-content: space-between;
            }

            .button {
                background-color: #28a745;
                color: white;
                border: none;
                padding: 8px 15px;
                border-radius: 5px;
                cursor: pointer;
            }

            .button:hover {
                background-color: #218838;
            }

            .text-danger {
                font-size: 14px;
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
        <%
            ProductDAO dao = new ProductDAO();
            List<ProductsDTO> listAllProducts = dao.getListProduct();

            List<ProductsDTO> listProduct = (List) request.getAttribute("LIST_PRODUCT");

        %>
        <jsp:include page="header.jsp" />

        <%            String search = request.getParameter("search");
            if (search == null) {
                search = "";
            }
        %>

        <div class="container-fluid">
            <div id="product">
                <div class="row">
                    <div class="col-md-6">
                        <h1 class="pt-3">Product Management</h1>
                    </div>
                    <div class=" pt-4 col-md-6 form-container">
                        <form action="MainController">
                            <input class="search" type="text" name="search" placeholder="Search for Id or Name" value="<%= search%>"/>
                            <input class="btn btn-primary" type="submit" name="action" value="SearchProduct"/>
                        </form>
                    </div>
                </div>

                <table class="table table-bordered">
                    <thead>
                        <tr>
                            <th>ID</th>
                            <th>Image</th>
                            <th>Product Name</th>
                            <th>Supplier</th>
                            <th>Category</th>
                            <th>Quantity</th>
                            <th>Price</th>
                            <th>Delete</th>
                            <th>Update</th>

                        </tr>    
                    </thead>
                    <%
                        List<ProductsDTO> productsToShow;
                        boolean isSearching = (request.getParameter("search") != null && !request.getParameter("search").trim().isEmpty());

                        if (isSearching && (listProduct == null || listProduct.isEmpty())) {
                            productsToShow = null;
                        } else {
                            productsToShow = (listProduct != null) ? listProduct : listAllProducts;
                        }
                        int count = 1;
                        if (productsToShow != null && !productsToShow.isEmpty()) {
                            for (ProductsDTO product : productsToShow) {
                    %>
                    <form action="MainController" method="GET">
                        <tr>
                            <td class="td-hidden">
                                <%= product.getProductId()%>
                                <input type="hidden" name="productId" value="<%= product.getProductId()%>" readonly=""/>
                            </td>
                            <td class="td-hidden">
                                <img src="<%= product.getProductImage()%>" width="50">
                                <input type="hidden" name="productImage" value="<%= product.getProductImage()%>" readonly=""/>
                            </td>
                            <td class="td-hidden">
                                <%=  product.getProductName()%>
                                <input type="hidden" name="productName" value="<%=  product.getProductName()%>" readonly=""/>
                            </td>
                            <td class="td-hidden">
                                <%= product.getSupplier().getCompanyName()%>
                                <input type="hidden" name="supplierId" value="<%= product.getSupplierId()%>" required=""/>
                            </td>
                            <td class="td-hidden">
                                <%=  product.getCategory().getCategoryName()%>
                                <input type="hidden" name="categoryId" value="<%=  product.getCategoryId()%>" required=""/>
                            </td>

                            <td class="td-hidden">
                                <%= product.getQuantity()%>
                                <input type="hidden" name="quantityPerUnit" value="<%= product.getQuantity()%>" readonly=""/>
                            </td>
                            <td class="td-hidden">
                                <%= product.getUnitPrice()%>
                                <input type="hidden" name="unitPrice" value="<%= product.getUnitPrice()%>" required=""/>
                            </td>
                            <td class="td-button">
                                <button class="btn btn-primary" name="action" value="DeleteProduct">
                                    Delete
                                </button>
                            </td>
                            <td class="td-button">
                                <button type="button" class="btn btn-primary" data-bs-toggle="modal" data-bs-target="#modal_<%= product.getProductId()%>">
                                    Update
                                </button>
                            </td>
                        </tr>
                    </form>
                    <%

                        }
                    %>
                </table>
            </div>
        </div>
        <%
            for (ProductsDTO product : productsToShow) {
        %>
        <form action="MainController" method="GET">
            <div class="modal_update modal fade" id="modal_<%= product.getProductId()%>" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
                <div class="modal-dialog">
                    <div class="modal-content">
                        <div class="modal-header">
                            <h1 class="modal-title fs-5" id="exampleModalLabel">Update <%=  product.getProductName()%></h1>
                            <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                        </div>
                        <div class="modal-body">
                            <div class="mb-3 row">
                                <label for="ID" class="col-sm-3 col-form-label">ID: </label>
                                <div class="col-sm-9">
                                    <input type="text" name="productId" value="<%= product.getProductId()%>" readonly=""/>
                                </div>
                            </div>
                            <div class="mb-3 row">
                                <label for="name" class="col-sm-3 col-form-label">Name: </label>
                                <div class="col-sm-9">
                                    <input type="text" name="productName" value="<%=  product.getProductName()%>" readonly=""/>
                                </div>
                            </div>
                            <div class="mb-3 row">
                                <label for="price" class="col-sm-3 col-form-label">Price: </label>
                                <div class="col-sm-9">
                                    <input type="text" name="unitPrice" value="<%=  product.getUnitPrice()%>" required=""/>
                                </div>
                            </div>
                            <div class="mb-3 row">
                                <label for="quantity" class="col-sm-3 col-form-label">Quantity: </label>
                                <div class="col-sm-9">
                                    <input type="text" name="quantity" value="<%=product.getQuantity()%>" required=""/>

                                </div>
                            </div>
                        </div>
                        <div class="modal-footer">
                            <input type="hidden" name="productImage" value="<%= product.getProductImage()%>" readonly=""/>
                            <input type="hidden" name="supplierId" value="<%= product.getSupplierId()%>" required=""/>
                            <input type="hidden" name="categoryId" value="<%=  product.getCategoryId()%>" required=""/>
                            <input class="button" type="submit" name="action" value="UpdateProduct" />
                        </div>
                    </div>
                </div>
            </div>
        </form>
        <%
            }
        } else {
        %>
        <h5 class="text-center text-danger">No result found!</h5>
        
        <%
            }
        %>

    </body>
</html>
