<%-- 
    Document   : cart
    Created on : Mar 3, 2025, 10:20:13 PM
    Author     : PC
--%>

<%@page import="Model.AccountDTO"%>
<%@page import="Model.ProductsDTO"%>
<%@page import="Model.CartDTO"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz" crossorigin="anonymous"></script>
        <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.2/css/all.min.css" rel="stylesheet">
    </head>
    <body>
        <%
            AccountDTO loginUser = (AccountDTO) session.getAttribute("LOGIN_USER");
            if (loginUser == null) {
                response.sendRedirect("login.jsp");
                return;
            }
        %>
        <jsp:include page="header.jsp" />
        <%
            CartDTO cart = (CartDTO) session.getAttribute("CART");
            if (cart == null || cart.getCart().isEmpty()) {
        %>
        <div class="container">
            <div class="alert alert-warning text-center">
                <h3>Cart Empty!</h3>
                <a class="btn btn-primary mt-3" href="index.jsp">Back to Shopping</a>
            </div>
            <%
            } else {
            %>
            <h2 class="text-center text-primary p-3">My Cart</h2>
            <table class="table table-bordered mt-3">
                <thead class="table-dark">
                    <tr>
                        <th>Image</th>
                        <th>Product Name</th>
                        <th>Price</th>
                        <th>Quantity</th>
                        <th>Total Price</th>
                        <th>Delete</th>
                    </tr>
                </thead>
                <tbody>
                    <%
                        double total = 0;
                        for (ProductsDTO product : cart.getCart().values()) {
                            total += product.getQuantity() * product.getUnitPrice();

                    %>
                <form action="MainController" method="POST">

                    <tr>

                        <td class="text-center">
                            <img src="<%= product.getProductImage()%>" width="80" height="80" class="img-thumbnail">
                        </td>
                        <td><%= product.getProductName()%></td>
                        <td><%= String.format("%,.0f", product.getUnitPrice())%> $</td>

                        <td>
                            <button name="action" value="updateminus" class="btn btn-primary">
                                -
                            </button>
                            <%= product.getQuantity()%>
                            <button name="action" value="updateplus" class="btn btn-primary">
                                +
                            </button>
                        </td>
                        <td><%= String.format("%,.0f", product.getQuantity() * product.getUnitPrice())%>$</td>
                        <td>
                            <input type="hidden" name="productId" value="<%= product.getProductId()%>">
                            <input type="hidden" name="quantity" value="<%= product.getQuantity()%>">
                            <button name="action" value="Remove" class="btn btn-primary">
                                Delete
                            </button>
                        </td>
                    </tr>
                </form>

                <% }%>


                </tbody>
            </table>
            <div class="me-2">
                <h5 class="text-end">Total Price: <%= String.format("%,.0f", total).replace(",", ".")%>$</h5>
            </div>
            <% }%>
            <div class="text-end">
                <% if (cart != null) { %>
                <a class="btn btn-success" href="order.jsp">Payment</a>
                <% }%>
                <a class="btn btn-secondary" href="index.jsp">Back to Shopping</a>
            </div>
        </div>
    </body>
</html>
