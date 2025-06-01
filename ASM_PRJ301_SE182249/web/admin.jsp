<%-- 
    Document   : admin
    Created on : Mar 7, 2025, 9:33:52 AM
    Author     : PC
--%>

<%@page import="Dao.ProductDAO"%>
<%@page import="Model.CategoriesDTO"%>
<%@page import="java.util.ArrayList"%>
<%@page import="Model.ProductsDTO"%>
<%@page import="java.util.List"%>
<%@page import="Dao.AccountDAO"%>
<%@page import="Model.AccountDTO"%>
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
            .table {
                background: white;
                border-radius: 8px;
                overflow: hidden;
                box-shadow: 0px 3px 6px rgba(0, 0, 0, 0.1);
            }

            .table th {
                background: #007bff;
                color: white;
                text-align: center;
                font-weight: bold;
                padding: 12px;
            }

            .table td {
                padding: 10px;
                text-align: center;
                vertical-align: middle;
            }

            .table tr:hover {
                background: #f1f1f1;
                transition: 0.3s;
            }

            .td-hidden {
                font-size: 16px;
                font-weight: 500;
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
        <div id="admin" class="col-md-12 container section active">
            <h2 class="text-center text-primary p-4">User List</h2>
            <table class="table table-bordered">
                <thead>
                    <tr>
                        <th>No</th>
                        <th>UserName</th>
                        <th>Full Name</th>
                    </tr>    
                </thead>
                <%
                    AccountDAO dao = new AccountDAO();
                    List<AccountDTO> listAccounts = (List<AccountDTO>) dao.getListAccounts();
                    if (listAccounts != null) {
                %> 
                <%
                    int count = 1;
                    for (AccountDTO acc : listAccounts) {
                %>
                <form action="MainController" method="GET">
                    <tr>
                        <td class="td-hidden"><%= count++%></td>
                        <td class="td-hidden">
                            <%= acc.getUserName()%>
                            <input type="hidden" name="userName" value="<%= acc.getUserName()%>" readonly=""/>
                        </td>
                        <td class="td-hidden">
                            <%= acc.getFullName()%>
                            <input type="hidden" name="fullName" value="<%= acc.getFullName()%>" readonly=""/>
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
