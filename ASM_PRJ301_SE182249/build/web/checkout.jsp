<%-- 
    Document   : checkout
    Created on : Mar 4, 2025, 6:05:31 PM
    Author     : PC
--%>

<%@page import="Model.AccountDTO"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz" crossorigin="anonymous"></script>
        <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.2/css/all.min.css" rel="stylesheet">
        <style>
            .success-container {
                display: flex;
                justify-content: center;
                align-items: center;
                height: 100vh;
                background: #f8f9fa;
            }

            .success-message {
                text-align: center;
                background: #ffffff;
                padding: 30px 40px;
                border-radius: 10px;
                box-shadow: 0 4px 10px rgba(0, 0, 0, 0.1);
                max-width: 400px;
                width: 100%;
            }

            .success-message i {
                font-size: 20px;
                color: #28a745;
                margin-bottom: 15px;
            }

            .success-message h1 {
                font-size: 24px;
                font-weight: bold;
                color: #333;
                margin-bottom: 10px;
            }

            .success-message p {
                font-size: 16px;
                color: #555;
                margin-bottom: 20px;
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
        <div class="success-container">
            <div class="success-message">
                <i class="fas fa-check-circle"></i>
                <h1>Payment Successfully!</h1>
                <p>Thank you for buying at PizzaStore.</p>
                <a href="index.jsp" class="btn-home"><i class="fa-solid fa-house"></i> Back to Home Page</a>
            </div>
        </div>
    </body>
</html>
