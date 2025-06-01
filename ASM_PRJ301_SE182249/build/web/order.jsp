<%-- 
    Document   : order
    Created on : Mar 4, 2025, 6:04:36 PM
    Author     : PC
--%>

<%@page import="java.util.Date"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="Model.AccountDTO"%>
<%@page import="Model.ProductsDTO"%>
<%@page import="Model.CartDTO"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css">
        <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.2/css/all.min.css" rel="stylesheet">
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
        <style>
            .order-container {
                display: flex;
                flex-wrap: wrap;
                justify-content: space-around;
                gap: 20px;
                padding: 20px;
            }

            .cart-container {
                flex: 1;
                min-width: 300px;
                max-width: 500px;
                background: #f8f9fa;
                padding: 20px;
                border-radius: 8px;
                box-shadow: 0 2px 5px rgba(0, 0, 0, 0.1);
            }

            .cart-container h4 {
                font-size: 22px;
                font-weight: bold;
                color: #007bff;
            }

            .list-group {
                padding: 0;
            }

            .list-group-item {
                background: white;
                border: none;
                border-bottom: 1px solid #ddd;
                padding: 10px 15px;
            }

            .list-group-item:last-child {
                border-bottom: none;
                font-weight: bold;
            }

            .text-body-secondary {
                font-size: 16px;
                font-weight: bold;
                color: #333;
            }
            .checkout-form {
                flex: 1;
                min-width: 400px;
                max-width: 600px;
            }

            .card {
                background: #ffffff;
                border-radius: 8px;
                box-shadow: 0 2px 5px rgba(0, 0, 0, 0.1);
            }

            h3.text-center {
                font-size: 22px;
                font-weight: bold;
                color: #333;
            }

            .form-label {
                font-weight: bold;
            }

            .form-control {
                border: 1px solid #ccc;
                border-radius: 5px;
                padding: 8px;
                font-size: 14px;
            }

            .form-control:focus {
                border-color: #007bff;
                outline: none;
                box-shadow: 0 0 5px rgba(0, 123, 255, 0.5);
            }

            .text-center {
                display: flex;
                justify-content: center;
                gap: 10px;
            }

            .btn {
                padding: 10px 15px;
                font-size: 16px;
                border-radius: 5px;
                transition: all 0.3s ease-in-out;
            }

            .btn-primary {
                background: #007bff;
                border: none;
            }

            .btn-primary:hover {
                background: #0056b3;
            }

            .btn-secondary {
                background: #6c757d;
                border: none;
            }

            .btn-secondary:hover {
                background: #5a6268;
            }

        </style>

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
        <div class="order-container mt-5">
            <div class="cart-container"> 
                <%
                    CartDTO cart = (CartDTO) session.getAttribute("CART");
                    double total = 0;
                    if (cart != null) {
                %>
                <div>
                    <h4 class="d-flex justify-content-between align-items-center mb-3">
                        <span class="text-primary">Your cart</span>
                    </h4>
                    <%
                        int count = 1;
                        for (ProductsDTO product : cart.getCart().values()) {
                            total += product.getQuantity() * product.getUnitPrice();
                    %>
                    <form action="MainController" >
                        <ul class="list-group mb-3">
                            <li class="list-group-item d-flex justify-content-between lh-sm">
                                <div >
                                    <h6 class="my-0"><%=  product.getProductName()%> x <%=  product.getQuantity()%></h6>
                                    <input type="hidden" name="name" value="<%=  product.getProductName()%>" readonly=""/>
                                </div>
                                <span class="text-body-secondary"><%=  String.format("%,.0f", product.getQuantity() * product.getUnitPrice()).replace(",", ".")%>$</span>
                            </li>
                        </ul>
                        <%
                            }
                        %>
                        <li class="list-group-item d-flex justify-content-between">
                            <span>Total</span>
                            <strong><%= String.format("%,.0f", total).replace(",", ".")%>$</strong>
                        </li>
                    </form> 


                </div>
                <%
                    }
                %>
            </div>
            <div class="checkout-form">
                <div class="card p-3 mb-4">
                    <h3 class="text-center">Enter your information</h3>
                    <form action="MainController" method="POST" class="p-4 border rounded">
                        <%
                            String orderId = "OD" + System.currentTimeMillis();
                            SimpleDateFormat formatter = new SimpleDateFormat("yyyy-MM-dd");
                            String date = formatter.format(new Date());
                        %>
                        <input type="hidden" name="orderDate" value="<%= date%>">
                        <div class="mb-3">
                            <label class="form-label">Order ID:</label>
                            <input type="text" name="orderId" class="form-control" value="<%= orderId%>" readonly="">
                        </div>
                        <div class="mb-3">
                            <label class="form-label">Full Name:</label>
                            <input type="text" name="fullName" class="form-control" required>
                        </div>
                        <div class="mb-3">
                            <label class="form-label">Phone Number:</label>
                            <input type="text" name="phone" class="form-control" required>
                        </div>
                        <div class="mb-3">
                            <label class="form-label">Your Address:</label>
                            <input type="text" name="shipAddress" class="form-control" >
                        </div>
                        <div class="text-center">
                            <input type="hidden" name="totalPrice" value="<%= total%>" required=""/>
                            <button class="btn btn-primary" name="action" value="Order">
                                Payment
                            </button>
                            <a class="btn btn-secondary" href="cart.jsp">Back to Cart</a>
                        </div>
                    </form>
                </div>
            </div>
        </div>
    </body>
</html>
