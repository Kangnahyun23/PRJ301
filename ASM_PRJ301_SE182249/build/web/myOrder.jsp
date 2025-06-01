<%-- 
    Document   : myOrder
    Created on : Mar 7, 2025, 9:34:59 AM
    Author     : PC
--%>

<%@page import="Model.AccountDTO"%>
<%@page import="java.util.List"%>
<%@page import="Model.OrdersDTO"%>
<%@page import="Dao.OrderDAO"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <link rel="stylesheet" href="css/style.css"/>
        <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.2/css/all.min.css" rel="stylesheet">
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css">
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
        <style>
            #order {
                padding: 20px;
                background: #f8f9fa;
                border-radius: 10px;
            }

            .table {
                width: 100%;
                background: white;
                border-radius: 10px;
                overflow: hidden;
                box-shadow: 0 4px 10px rgba(0, 0, 0, 0.1);
            }

            .table thead {
                background: #007bff;
                color: white;
            }

            .table thead th {
                padding: 12px;
                text-align: center;
                font-weight: bold;
            }

            .table tbody tr {
                transition: background 0.3s ease-in-out;
            }

            .table tbody tr:hover {
                background: #f1f1f1;
            }

            .table tbody td {
                padding: 10px;
                text-align: center;
                color: #333;
            }

            .td-hidden {
                font-weight: 500;
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
        <h2 class="text-center p-3">My Order History List</h2>
        <div id="order" class="section active">
            <table class="table table-bordered">
                <thead>
                    <tr>
                        <th>No</th>
                        <th>ID</th>
                        <th>Full Name</th>
                        <th>Order Date</th>
                        <th>Shipped Date</th>
                        <th>Freight</th>
                        <th>Total Price</th>
                    </tr>    
                </thead>
                <%
                    AccountDTO acccount = (AccountDTO) session.getAttribute("LOGIN_USER");
                    OrderDAO dao = new OrderDAO();
                    List<OrdersDTO> listOrders = (List<OrdersDTO>) dao.getListOrdersByAccount(acccount.getAccountId());
                    if (listOrders != null) {
                %> 
                <%
                    int count = 1;
                    for (OrdersDTO order : listOrders) {
                %>
                <form action="MainController" method="GET">
                    <tr>
                        <td class="td-hidden"><%= count++%></td>
                        <td class="td-hidden">
                            <%= order.getOrderId()%>
                            <input type="hidden" name="orderId" value="<%= order.getOrderId()%>" readonly=""/>
                        </td>
                        <td class="td-hidden">
                            <%= order.getFullName()%>
                            <input type="hidden" name="fullName" value="<%= order.getFullName()%>" readonly=""/>
                        </td>
                        <td class="td-hidden">
                            <%= order.getOrderDate()%>
                            <input type="hidden" name="orderDate" value="<%= order.getOrderDate()%>" readonly=""/>
                        </td>
                        <td class="td-hidden">
                            <%= order.getShippedDate()%>
                            <input type="hidden" name="shippedDate" value="<%= order.getShippedDate()%>" readonly=""/>
                        </td>
                        <td class="td-hidden">
                            <%= order.getFreight()%>
                            <input type="hidden" name="freight" value="<%= order.getFreight()%>" readonly=""/>
                        </td>
                        <td class="td-hidden">
                            <%= order.getTotalPrice()%>
                            <input type="hidden" name="totalPrice" value="<%= order.getTotalPrice()%>" readonly=""/>
                        </td>
                    </tr>
                </form>
                <%
                        }
                    }
                %>
            </table>
        </div>

    </body>
</html>
