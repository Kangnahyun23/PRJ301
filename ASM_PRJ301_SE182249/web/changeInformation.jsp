<%-- 
    Document   : changeInfoUser
    Created on : Jun 14, 2024, 4:15:04 PM
    Author     : PC
--%>

<%@page import="Model.AccountDTO"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css">
        <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.2/css/all.min.css" rel="stylesheet">
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
    </head>
    <body>
        <jsp:include page="header.jsp" />
        <%
            AccountDTO loginUser = (AccountDTO) session.getAttribute("LOGIN_USER");
            if (loginUser == null) {
                response.sendRedirect("login.jsp");
                return;
            }
            if (loginUser != null) {
        %>
        <form action="MainController">
            <div class="container">
                <div class="">

                    <h1 class="text-center p-4">User Info</h1>
                    <div class="mb-3">
                        <label for="AccountID" class="form-label">UserId</label> <input
                            type="text" class="form-control" id="AccountID" name="AccountID" value="<%=loginUser.getAccountId()%>" readonly="">
                    </div>
                    <div class="mb-3">
                        <label for="username" class="form-label">User Name:</label> <input
                            type="text" class="form-control" id="username" name="userName" value="<%=loginUser.getUserName()%>"  readonly="">
                    </div>
                    <div class="mb-3">
                        <label for="name" class="form-label">Full Name:</label> <input
                            type="text" class="form-control" id="name" name="fullName" value="<%=loginUser.getFullName()%>">
                    </div>
                    <input type="hidden" name="type" value="<%=loginUser.getType()%>">
                    <input type="hidden" name="password" value="<%=loginUser.getPassword()%>">
                    <hr />					
                    <input class="btn btn-primary form-control" type="submit"
                           value="Change Info" name="action" id="submit" />
                </div>
            </div>
        </form>
        <%}%>
        <%
            String mess = (String) request.getAttribute("SUCCESS");
            if (mess == null) {
                mess = "";
            }
        %>
        <h1 style="color: #218838; margin-left: 650px; margin-top: 50px; font-size: 50px"><%= mess%></h1>
    </body>
</html>
