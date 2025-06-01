<%-- 
    Document   : login
    Created on : Mar 2, 2025, 3:46:53 PM
    Author     : Admin
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <link rel="stylesheet" href="css/style.css"/>
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz" crossorigin="anonymous"></script>

        <style>
            .login-container {
                background-color: #f0f8ff;
                padding: 20px;
                border-radius: 5px;
                min-height: 900px;
            }

            .login-container h2{                
                margin-top: -15px;
                margin-left: -10px;
                font-size: 35px;
                font-weight: 400;
            }
            .login-container p{ 
                margin-top: 0px;
                margin-left: -10px;
            }
            .login-form {
                display: grid;
                grid-template-columns: 100px 1fr;
                gap: 10px;
                align-items: center;
                max-width: 400px;
                margin-left: 50px;
                margin-top: 50px;
            }

            .login-form input {
                padding: 8px;
                border: 1px solid #ccc;
                border-radius: 4px;
            }

            .login-button {
                grid-column: 2;
                background-color: #337ab7;
                color: white;
                border: none;
                padding: 8px 16px;
                border-radius: 4px;
                cursor: pointer;
                width: fit-content;
            }
        </style>
    </head>
    <body>
        <jsp:include page="header.jsp" />


        <div class="login-container">
            <div class="top0Left0">
                <h2>Please log in here.</h2>
                <p>Enter your details below</p>
            </div>
            <form action="MainController" method="post" class="login-form">
                <label for="username">User Name</label>
                <input type="text" id="username" name="username" required>

                <label for="password">Password</label>
                <input type="password" id="password" name="password" required>

                <button type="submit" name="action" value="Login" class="login-button">Log in</button>
            </form>
            <%
                String mess = (String) request.getAttribute("MESSAGE");
                if (mess == null) {
                    mess = "";
                }
            %>
            <h1 style="color: red"><%= mess%></h1>
        </div>


    </body>
</html>
