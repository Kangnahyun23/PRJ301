<%-- 
    Document   : register
    Created on : Mar 2, 2025, 4:32:42 PM
    Author     : Admin
--%>

<%@page import="Model.AccountError"%>
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
            .register-container {
                background-color: #f0f8ff;
                padding: 20px;
                border-radius: 5px;
                min-height: 900px;
            }

            .register-form {
                display: grid;
                grid-template-columns: 150px 1fr;
                gap: 10px;
                align-items: center;
                max-width: 500px;
            }

            .register-form input, .register-form select {
                padding: 8px;
                border: 1px solid #ccc;
                border-radius: 4px;
                width: 100%;
            }

            .register-button {
                grid-column: 2;
                background-color: #337ab7;
                color: white;
                border: none;
                padding: 8px 16px;
                border-radius: 4px;
                cursor: pointer;
                width: fit-content;
                margin-top: 10px;
            }

            .error-message {
                color: red;
                grid-column: 2;
                font-size: 14px;
            }

            .noti {
                color: green;
                font-size: 16px;
                margin-top: 20px;
                font-weight: bold;
                text-align: center;
            }

        </style>
    </head>
    <body>
        <%
            AccountError accountError = (AccountError) request.getAttribute("USER_ERROR");
            if (accountError == null) {
                accountError = new AccountError();
            }
        %>
        <jsp:include page="header.jsp" />


        <div class="register-container">
            <h2>Create an account</h2>
            <p>Please fill in the details below to register</p>

            <form action="MainController" method="post" class="register-form">
                <label for="username">Username *</label>
                <input type="text" id="username" name="userName" required>
                <div class="error-message">
                    <%= accountError.getUserName()%>                                
                </div>
                <label for="fullname">Full Name *</label>
                <input type="text" id="fullname" name="fullName" required>
                <div class="error-message">
                    <%= accountError.getFullName()%>                                
                </div>
                <label for="type">Type</label>
                <input type="text" id="type" name="type" value="2" readonly>
                <div class="error-message">
                    <%= accountError.getType()%>                                
                </div>
                <label for="password">Password *</label>
                <input type="password" id="password" name="password" required>

                <label for="confirmPassword">Confirm Password *</label>
                <input type="password" id="confirmPassword" name="confirm" required>
                <div class="error-message">
                    <%= accountError.getConfirm()%>                                
                </div>
                <button type="submit" name="action" class="register-button" value="Register">Register</button>
            </form>

            <div class="noti">
                <%
                    String message = (String) request.getAttribute("MESSAGE");
                    if (message == null) {
                        message = "";
                    }
                %>
                <%= message%>  
            </div>
        </div>
    </body>
</html>
