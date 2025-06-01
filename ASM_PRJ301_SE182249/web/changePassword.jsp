<%-- 
    Document   : changePassword
    Created on : Jun 14, 2024, 5:12:54 PM
    Author     : PC
--%>

<%@page import="Model.AccountDTO"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <link
            href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.1/dist/css/bootstrap.min.css"
            rel="stylesheet"
            integrity="sha384-iYQeCzEYFbKjA/T2uDLTpkwGzCiq6soy8tYaI1GyVh/UjpbCx/TYkiZhlZB6+fzT"
            crossorigin="anonymous">
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

        <div class="container">
            <h1 class="text-center p-4">Change Password</h1>
            <form action="MainController" method="post">
                <div class="mb-3">
                    <label for="password" class="form-label">Current Password: </label>
                    <input type="password" class="form-control" id="password" name="password">
                </div>
                <div class="mb-3">
                    <label for="newpassword" class="form-label">New Password: </label>
                    <input type="password" class="form-control" id="newpassword" name="newpassword">
                </div>
                <div class="mb-3">
                    <label for="renewpassword" class="form-label">Confirm New Password: </label>
                    <input type="password" class="form-control" id="renewpassword" name="renewpassword">
                </div>
                <input class="btn btn-primary" type="submit" name="action" value="Change Password"> 
            </form>
            <%
                String mess = (String) request.getAttribute("SUCCESS");
                if (mess == null) {
                    mess = "";
                }
            %>
        </div>
         <h1 style="color: #218838; margin-left: 650px; margin-top: 50px; font-size: 50px"><%= mess%></h1>
        <script
            src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.11.6/dist/umd/popper.min.js"
            integrity="sha384-oBqDVmMz9ATKxIep9tiCxS/Z9fNfEXiDAYTujMAeBAsjFuCZSmKbSSUnQlmh/jp3"
        crossorigin="anonymous"></script>
        <script
            src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.1/dist/js/bootstrap.min.js"
            integrity="sha384-7VPbUDkoPSGFnVtYi0QogXtr74QeVeeIs99Qfg5YCF+TidwNdjvaKZX19NZ/e6oz"
        crossorigin="anonymous"></script>
    </body>
</html>
