<%@page contentType="text/html" pageEncoding="UTF-8"%>
<style>
    .footer {
        background-color: #333;
        color: #fff;
        padding: 50px 0;
        margin-top: 50px;
    }

    .footer h3 {
        color: #ff4757;
        font-size: 1.5rem;
        margin-bottom: 20px;
        font-weight: 600;
    }

    .footer p, .footer a {
        color: #aaa;
        text-decoration: none;
        transition: all 0.3s ease;
        line-height: 2;
        font-size: 0.95rem;
    }

    .footer a:hover {
        color: #ff4757;
        padding-left: 5px;
    }

    .footer i {
        margin-right: 10px;
        color: #ff4757;
    }

    .footer .social-links {
        margin-top: 20px;
    }

    .footer .social-links a {
        display: inline-block;
        width: 35px;
        height: 35px;
        background-color: #444;
        border-radius: 50%;
        text-align: center;
        line-height: 35px;
        margin-right: 10px;
        transition: all 0.3s ease;
    }

    .footer .social-links a i {
        color: #fff;
        margin: 0;
    }

    .footer .social-links a:hover {
        background-color: #ff4757;
        transform: translateY(-3px);
    }

    .footer .social-links a:hover i {
        color: #fff;
    }

    .footer .delivery-info {
        display: flex;
        align-items: center;
        margin-top: 20px;
        padding: 10px;
        background-color: #444;
        border-radius: 8px;
    }

    .footer .delivery-info i {
        font-size: 1.5rem;
        margin-right: 15px;
    }

    .footer .copyright {
        text-align: center;
        margin-top: 30px;
        padding-top: 20px;
        border-top: 1px solid #444;
        color: #888;
    }

    @media (max-width: 768px) {
        .footer h3 {
            margin-top: 20px;
        }
    }
</style>

<footer class="footer">
    <div class="container">
        <div class="row">
            <div class="col-md-3">
                <h3>Pizza Store</h3>
                <p><i class="fas fa-map-marker-alt"></i>Address: 123 Le Loi Street, District 1, HCMC</p>
                <p><i class="fas fa-phone"></i>Hotline: (028) 1900 1234</p>
                <p><i class="fas fa-envelope"></i>Email: info@pizzastore.com</p>
                <p><i class="fas fa-clock"></i>Opening Hours: 8:00 AM - 10:00 PM</p>
            </div>
            <div class="col-md-3">
                <h3>Menu</h3>
                <p><a href="#">Pizza</a></p>
                <p><a href="#">Pasta</a></p>
                <p><a href="#">Salad</a></p>
                <p><a href="#">Drinks</a></p>
            </div>
            <div class="col-md-3">
                <h3>Support</h3>
                <p><a href="#">About Us</a></p>
                <p><a href="#">Terms & Conditions</a></p>
                <p><a href="#">Delivery Policy</a></p>
                <p><a href="#">Contact</a></p>
            </div>
            <div class="col-md-3">
                <h3>Follow Us</h3>
                <div class="social-links">
                    <a href="#"><i class="fab fa-facebook-f"></i></a>
                    <a href="#"><i class="fab fa-instagram"></i></a>
                    <a href="#"><i class="fab fa-youtube"></i></a>
                    <a href="#"><i class="fab fa-tiktok"></i></a>
                </div>
                <div class="delivery-info">
                    <i class="fas fa-motorcycle"></i>
                    <span>Free delivery within 30 minutes</span>
                </div>
            </div>
        </div>
        <div class="copyright">
            <p>© 2025 Pizza Store. All rights reserved.</p>
        </div>
    </div>
</footer> 