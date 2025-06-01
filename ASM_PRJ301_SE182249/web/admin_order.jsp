<%-- 
    Document   : admin_confirmDate
    Created on : Mar 5, 2025, 11:22:55 PM
    Author     : PC
--%>

<%@page import="java.util.ArrayList"%>
<%@page import="Model.AccountDTO"%>
<%@page import="Dao.OrderDAO"%>
<%@page import="java.util.List"%>
<%@page import="Model.OrdersDTO"%>
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

            form {
                display: flex;
                align-items: center;
                justify-content: center;
                gap: 10px;
                flex-wrap: wrap;
                margin-bottom: 20px;
            }

            form label {
                font-weight: bold;
            }

            form input[type="date"] {
                padding: 5px;
                border-radius: 5px;
                border: 1px solid #ced4da;
            }

            .btn-primary {
                background-color: #007bff;
                border: none;
                transition: 0.3s;
            }

            .btn-primary:hover {
                background-color: #0056b3;
            }

            .table {
                background: white;
                border-radius: 10px;
                overflow: hidden;
            }

            .table thead {
                background-color: #007bff;
                color: white;
            }

            .table th, .table td {
                text-align: center;
                vertical-align: middle;
            }

            .table th {
                padding: 10px;
            }

            .text-center {
                font-weight: bold;
                color: red;
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
        <div class="container">
            <h1 class="p-3 text-center">Report Statistics Sales</h1>
            <form method="GET" action="MainController">
                <label for="dateFrom">DateFrom:</label>
                <input type="date" id="dateFrom" name="dateFrom" required>

                <label for="dateTo">DateTo:</label>
                <input type="date" id="dateTo" name="dateTo" required>

                <button type="submit" name="action" class="btn btn-success" value="Show report">Show report</button>
            </form>
            <%
                String error = (String) request.getAttribute("ERROR_MESSAGE");
                if (error == null) {
                    error = "";
                }
            %>
            <span style="color: red"><%= error%></span>

            <div id="order" class="col-md-12 section active">
                <table class="table table-bordered">
                    <thead>
                        <tr>
                            <th>No</th>
                            <th>ID</th>
                            <th>Full Name</th>
                            <th>Order Date</th>
                            <th>Shipped Date</th>
                            <th>Total Price</th>
                        </tr>    
                    </thead>
                    <tbody>
                        <%
                            OrderDAO dao = new OrderDAO();
                            List<OrdersDTO> listOrders = (List<OrdersDTO>) request.getAttribute("LIST_ORDER");

                            boolean isSearching = (listOrders != null);

                            if (!isSearching) {
                                listOrders = dao.getListOrders();
                            }

                            if (!listOrders.isEmpty()) {
                                int count = 1;
                                for (OrdersDTO order : listOrders) {
                        %>
                        <tr>
                            <td><%= count++%></td>
                            <td><%= order.getOrderId()%></td>
                            <td><%= order.getFullName()%></td>
                            <td><%= order.getOrderDate()%></td>
                            <td><%= order.getShippedDate()%></td>
                            <td><%= order.getTotalPrice()%></td>
                        </tr>
                        <%
                            }
                        } else {
                        %>
                        <tr>
                            <td colspan="7" class="text-center">No orders found</td>
                        </tr>
                        <% } %>
                    </tbody>
                </table>
            </div>
        </div>
      
    </body>
</html>
