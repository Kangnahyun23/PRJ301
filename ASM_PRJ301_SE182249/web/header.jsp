<%-- 
    Document   : header
    Created on : May 26, 2024, 2:55:57 PM
    Author     : PC
--%>

<%@page import="Model.AccountDTO"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Pizza Store</title>
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz" crossorigin="anonymous"></script>
        <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.2/css/all.min.css" rel="stylesheet">
        <style>
            .navbar {
                background: linear-gradient(135deg, #ff4757 0%, #ff6b81 100%) !important;
                padding: 0.8rem 1rem;
                box-shadow: 0 2px 10px rgba(0,0,0,0.1);
            }

            .navbar-brand {
                color: white !important;
                font-size: 1.5rem;
                font-weight: bold;
                padding: 0.5rem 1rem;
                border-radius: 8px;
                transition: all 0.3s ease;
            }

            .navbar-brand:hover {
                background: rgba(255,255,255,0.1);
                transform: translateY(-2px);
            }

            .nav-link {
                color: white !important;
                font-weight: 500;
                padding: 0.5rem 1rem;
                transition: all 0.3s ease;
                border-radius: 6px;
            }

            .nav-link:hover {
                background: rgba(255,255,255,0.1);
            }

            .myNavBar__left {
                display: flex;
                align-items: center;
            }

            .myNavBar__right {
                display: flex;
                justify-content: flex-end;
                align-items: center;
            }

            .button--red {
                background-color: white;
                color: #ff4757;
                border: none;
                padding: 0.5rem 1.5rem;
                border-radius: 25px;
                font-weight: 600;
                transition: all 0.3s ease;
                text-transform: uppercase;
                letter-spacing: 0.5px;
            }

            .button--red:hover {
                background-color: #f8f9fa;
                color: #ff4757;
                transform: translateY(-2px);
                box-shadow: 0 4px 8px rgba(0,0,0,0.1);
            }

            .button--white {
                background-color: transparent;
                color: white;
                border: 2px solid white;
                padding: 0.5rem 1.5rem;
                border-radius: 25px;
                font-weight: 600;
                transition: all 0.3s ease;
                text-transform: uppercase;
                letter-spacing: 0.5px;
            }

            .button--white:hover {
                background-color: white;
                color: #ff4757;
                transform: translateY(-2px);
                box-shadow: 0 4px 8px rgba(0,0,0,0.1);
            }

            .myNavBar__cart {
                margin: 0 1rem;
            }

            .myNavBar__cart i {
                font-size: 1.3rem;
                color: white;
                transition: all 0.3s ease;
            }

            .myNavBar__cart:hover i {
                transform: scale(1.1);
            }

            .myNavBar_user {
                display: flex;
                align-items: center;
            }

            .myNavBar_user img {
                width: 40px !important;
                height: 40px !important;
                border-radius: 50%;
                border: 2px solid white;
                margin-right: 10px;
                object-fit: cover;
                transition: all 0.3s ease;
            }

            .myNavBar_user img:hover {
                transform: scale(1.1);
                border-color: #f8f9fa;
            }

            .dropdown-menu {
                min-width: 200px;
                border: none;
                border-radius: 12px;
                box-shadow: 0 4px 12px rgba(0,0,0,0.1);
                padding: 0.5rem;
                margin-top: 0.5rem;
            }

            .dropdown-item {
                padding: 0.7rem 1.2rem;
                border-radius: 6px;
                transition: all 0.3s ease;
                color: #2d3436;
                font-weight: 500;
            }

            .dropdown-item:hover {
                background-color: #f8f9fa;
                color: #ff4757;
                transform: translateX(5px);
            }

            .dropdown-item i {
                margin-right: 8px;
                color: #ff4757;
            }

            .dropdown-divider {
                margin: 0.5rem 0;
                border-color: #f1f2f6;
            }

            @media (max-width: 991.98px) {
                .navbar-collapse {
                    background: linear-gradient(135deg, #ff4757 0%, #ff6b81 100%);
                    padding: 1rem;
                    border-radius: 12px;
                    margin-top: 1rem;
                }

                .button--red, .button--white {
                    width: 100%;
                    margin: 0.5rem 0;
                    text-align: center;
                }

                .myNavBar_user {
                    margin-top: 1rem;
                }
            }
        </style>
    </head>
    <body>
        <%
            Object obj = session.getAttribute("LOGIN_USER");
            AccountDTO loginUser = null;
            if (obj != null) {
                loginUser = (AccountDTO) obj;
            }
        %>
        <div class="header">
            <nav class="navbar navbar-expand-lg sticky-top">
                <div class="container-fluid row">
                    <button class="navbar-toggler border-white" type="button"
                            data-bs-toggle="collapse" data-bs-target="#navbarSupportedContent"
                            aria-controls="navbarSupportedContent" aria-expanded="false"
                            aria-label="Toggle navigation">
                        <span class="navbar-toggler-icon"></span>
                    </button>
                    <div class="col-md-4">
                        <div class="myNavBar__left">
                            <a class="navbar-brand me-0" href="index.jsp">
                                <i class="fas fa-pizza-slice me-2"></i>Pizza Store                           
                            </a>
                            <div class="collapse navbar-collapse" id="navbarNavDropdown">
                                <ul class="navbar-nav">
                                    <% if (loginUser == null || loginUser.getType() != 1) { %>
                                    <li class="nav-item">
                                        <a class="nav-link active" aria-current="page" href="index.jsp">
                                            <i class="fas fa-home me-1"></i>HOME
                                        </a>
                                    </li>
                                    <% } %>
                                </ul>
                            </div>
                        </div>
                    </div>
                    <%
                        if (loginUser == null) {
                    %>
                    <div class="col-md-8 row collapse navbar-collapse" id="navbarSupportedContent">
                        <form class="myNavBar__right">
                            <ul class="navbar-nav mb-2 mb-lg-0">
                                <li class="nav-item myNavBar__button">
                                    <a class="btn button--red me-2" href="login.jsp">
                                        <i class="fas fa-sign-in-alt me-1"></i>LOG IN
                                    </a>
                                    <a class="btn button--white" href="register.jsp">
                                        <i class="fas fa-user-plus me-1"></i>REGISTER
                                    </a>
                                </li>
                            </ul>
                        </form>
                    </div>
                    <%} else {%>
                    <div class="col-md-8 row collapse navbar-collapse" id="navbarSupportedContent">
                        <form class="myNavBar__right">
                            <%
                                if (loginUser.getType() == 2) {
                            %>
                            <ul class="navbar-nav mb-2 mb-lg-0 align-items-center">
                                <li class="nav-item myNavBar__cart">
                                    <a class="nav-link" href="cart.jsp">
                                        <i class="fa fa-shopping-cart"></i>
                                    </a>
                                </li>
                                <li class="nav-item dropdown myNavBar_user">
                                    <a class="nav-link dropdown-toggle d-flex align-items-center" href="#" role="button"
                                        data-bs-toggle="dropdown" aria-expanded="false"> 
                                        <img src="img/avatar.jpg" alt="User Avatar">
                                        <span class="text-white"><%= loginUser.getFullName()%></span>
                                    </a>
                                    <ul class="dropdown-menu dropdown-menu-end">
                                        <li><a class="dropdown-item" href="myOrder.jsp"><i class="fas fa-shopping-bag"></i>My Order</a></li>
                                        <li><a class="dropdown-item" href="changeInformation.jsp"><i class="fas fa-user-edit"></i>Change Info</a></li>
                                        <li><a class="dropdown-item" href="changePassword.jsp"><i class="fas fa-key"></i>Change Password</a></li>
                                        <li><hr class="dropdown-divider"></li>
                                        <li><a class="dropdown-item text-danger" href="LogoutController"><i class="fas fa-sign-out-alt"></i>Logout</a></li>
                                    </ul>
                                </li>
                            </ul>
                            <% } else if ((loginUser.getType() == 1)) {%>
                            <ul class="navbar-nav mb-2 mb-lg-0">
                                <div class="collapse navbar-collapse" id="navbarNavDropdown">
                                    <ul class="navbar-nav">
                                        <li class="nav-item">
                                            <a class="nav-link" href="admin.jsp">
                                                <i class="fas fa-users-cog me-1"></i>USER MANAGEMENT
                                            </a>                                  
                                        </li>
                                        <li class="nav-item">
                                            <a class="nav-link" href="admin_product.jsp">
                                                <i class="fas fa-pizza-slice me-1"></i>PRODUCT MANAGEMENT
                                            </a>                                   
                                        </li>
                                        <li class="nav-item">
                                            <a class="nav-link" href="admin_addProduct.jsp">
                                                <i class="fas fa-plus-circle me-1"></i>ADD PRODUCT
                                            </a>                                  
                                        </li>
                                        <li class="nav-item">
                                            <a class="nav-link" href="admin_order.jsp">
                                                <i class="fas fa-clipboard-list me-1"></i>ORDER MANAGEMENT
                                            </a>                                   
                                        </li>
                                    </ul>
                                </div>
                                <ul class="myNavBar_user navbar-nav me-auto mb-2 mb-lg-0">
                                    <li class="nav-item dropdown dropstart">
                                        <a class="nav-link dropdown-toggle" href="#" role="button"
                                            data-bs-toggle="dropdown" aria-expanded="false"> 
                                            <img src="img/avatar.jpg" alt="Admin Avatar">
                                            <span class="text-white"><%= loginUser.getFullName()%></span>
                                        </a>
                                        <ul class="dropdown-menu">
                                            <li><a class="dropdown-item" href="changeInformation.jsp"><i class="fas fa-user-edit"></i>Change Info</a></li>
                                            <li><a class="dropdown-item" href="changePassword.jsp"><i class="fas fa-key"></i>Change Password</a></li>
                                            <li><hr class="dropdown-divider"></li>
                                            <li><a class="dropdown-item text-danger" href="LogoutController"><i class="fas fa-sign-out-alt"></i>Logout</a></li>
                                        </ul>
                                    </li>
                                </ul>
                            </ul>
                            <% }%>
                        </form>
                    </div>
                    <% }%>
                </div>
            </nav>
        </div>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
        <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.11.8/dist/umd/popper.min.js" integrity="sha384-I7E8VVD/ismYTF4hNIPjVp/Zjvgyol6VFvRkX/vR+Vc4jQkC+hVqc2pM8ODewa9r" crossorigin="anonymous"></script>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.min.js" integrity="sha384-0pUGZvbkm6XF6gxjEnlmuGrJXVbNuzT9qBBavbLwCsOGabYfZo0T0to5eqruptLy" crossorigin="anonymous"></script>
    </body>
</html>

