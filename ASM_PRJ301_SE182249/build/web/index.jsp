<%-- 
    Document   : pizzas.jsp
    Created on : Mar 7, 2025, 9:43:48 PM
    Author     : Admin
--%>

<%@page import="Model.AccountDTO"%>
<%@page import="java.util.List"%>
<%@page import="Model.ProductsDTO"%>
<%@page import="Dao.ProductDAO"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Pizza Store - Menu</title>
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet">
        <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.2/css/all.min.css" rel="stylesheet">
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"></script>
        <style>
            body {
                min-height: 100vh;
                display: flex;
                flex-direction: column;
            }
            
            .content {
                flex: 1;
            }
            
            .menu-title {
                text-align: center;
                font-size: 32px;
                font-weight: bold;
                margin-top: 20px;
            }

            .search-box {
                display: flex;
                justify-content: center;
                margin: 20px 0;
            }

            .pizza-card {
                border-radius: 10px;
                box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
                transition: transform 0.3s ease-in-out;
            }

            .pizza-card:hover {
                transform: translateY(-5px);
                box-shadow: 0 6px 12px rgba(0, 0, 0, 0.2);
            }

            .btn-cart {
                background-color: #ff4757;
                color: white;
                border: none;
                font-weight: bold;
                padding: 8px 16px;
                border-radius: 5px;
                transition: all 0.3s ease;
            }

            .btn-cart:hover {
                background-color: #ff6b81;
                transform: translateY(-2px);
            }
        </style>
    </head>
    <body>
        <%
            String search = request.getParameter("search");
            if (search == null) {
                search = "";
            }
            ProductDAO dao = new ProductDAO();
            List<ProductsDTO> listAllProducts = dao.getListProduct();

            List<ProductsDTO> listProduct = (List) request.getAttribute("LIST_PRODUCT");
        %>
        <jsp:include page="header.jsp" />
        
        <div class="content">
            <div class="container p-4">
                <h2 class="menu-title">Pizzas Menu</h2>
                <form action="MainController" method="post">
                    <div class="search-box">
                        <input type="text" class="form-control w-25" name="search" value="<%=search%>" placeholder="Search">
                        <button class="btn btn-secondary ms-2" name="action" value="Search Product">Search</button>
                    </div>
                </form>
                <div class="row">
                    <%
                        List<ProductsDTO> productsToShow;
                        boolean isSearching = (request.getParameter("search") != null && !request.getParameter("search").trim().isEmpty());

                        if (isSearching && (listProduct == null || listProduct.isEmpty())) {
                            productsToShow = null;
                        } else {
                            productsToShow = (listProduct != null) ? listProduct : listAllProducts;
                        }
                        if (productsToShow != null && !productsToShow.isEmpty()) {
                            for (ProductsDTO product : productsToShow) {
                    %>
                    <div class="col-md-3 g-3">
                        <div class="card pizza-card" style="height: 380px">
                            <img src="<%= product.getProductImage()%>" class="card-img-top" style="height: 200px">
                            <div class="card-body">
                                <h5 class="card-title text-primary" style="height: 50px"><%= product.getProductName()%></h5>
                                <p class="text-muted" style="height: 30px; font-size: 14px"><%= product.getCategory().getCategoryName()%> - <%= product.getCategory().getDescription()%></p>
                                <div class="d-flex align-items-center justify-content-between">
                                    <h5 class="text-end"><%= product.getUnitPrice()%>$</h5>
                                    <form action="MainController" method="POST">
                                        <input type="hidden" name="productId" value="<%= product.getProductId()%>">
                                        <input type="hidden" name="productImage" value="<%= product.getProductImage()%>">
                                        <input type="hidden" name="productName" value="<%= product.getProductName()%>">
                                        <input type="hidden" name="unitPrice" value="<%= product.getUnitPrice()%>">
                                        <input type="hidden" name="quantity" value="<%= product.getQuantity()%>">
                                        <input type="hidden" name="supplierId" value="<%= product.getSupplierId()%>">
                                        <input type="hidden" name="categoryId" value="<%= product.getCategoryId()%>">
                                        <button class="btn btn-cart" name="action" value="Add To Cart">
                                            <strong>Add To Cart</strong>
                                        </button>
                                    </form>
                                </div>
                            </div>
                        </div>
                    </div>
                    <%
                        }
                    } else {
                    %>
                    <p class="text-center text-danger">No result found!</p>
                    <%
                        }
                    %>
                </div>
                <%
                    String mess = (String) request.getAttribute("MESSAGE");
                    if (mess != null && !mess.trim().isEmpty()) {
                %>
                <script>
                    window.onload = function () {
                        alert("<%= mess%>");
                    };
                </script>
                <%
                    }
                %>
                <%
                    String error = (String) request.getAttribute("ERROR");
                    if (error != null && !error.trim().isEmpty()) {
                %>
                <script>
                    window.onload = function () {
                        alert("<%= error%>");
                    };
                </script>
                <%
                    }
                %>
            </div>
        </div>
        
        <jsp:include page="footer.jsp" />
    </body>
</html>
