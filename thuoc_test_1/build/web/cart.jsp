<%-- 
    Document   : cartt
    Created on : 15 Dec 2023, 3:58:56 pm
    Author     : admin
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="en">

    <head>
        <meta charset="utf-8">
        <title>EShopper - Bootstrap Shop Template</title>
        <meta content="width=device-width, initial-scale=1.0" name="viewport">
        <meta content="Free HTML Templates" name="keywords">
        <meta content="Free HTML Templates" name="description">

        <!-- Favicon -->
        <link href="img/favicon.ico" rel="icon">

        <!-- Google Web Fonts -->
        <link rel="preconnect" href="https://fonts.gstatic.com">
        <link href="https://fonts.googleapis.com/css2?family=Poppins:wght@100;200;300;400;500;600;700;800;900&display=swap" rel="stylesheet"> 

        <!-- Font Awesome -->
        <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.10.0/css/all.min.css" rel="stylesheet">

        <!-- Libraries Stylesheet -->
        <link href="lib/owlcarousel/assets/owl.carousel.min.css" rel="stylesheet">

        <!-- Customized Bootstrap Stylesheet -->
        <link href="css/style.css" rel="stylesheet">
    </head>

    <body>
        <!-- Topbar Start -->
        <div class="container-fluid">
            <div class="row bg-secondary py-2 px-xl-5">
                <div class="col-lg-6 d-none d-lg-block">
                    <div class="d-inline-flex align-items-center">
                        <a class="text-dark" href="">FAQs</a>
                        <span class="text-muted px-2">|</span>
                        <a class="text-dark" href="">Help</a>
                        <span class="text-muted px-2">|</span>
                        <a class="text-dark" href="">Support</a>
                    </div>
                </div>
                <div class="col-lg-6 text-center text-lg-right">
                    <div class="d-inline-flex align-items-center">
                        <a class="text-dark px-2" href="">
                            <i class="fab fa-facebook-f"></i>
                        </a>
                        <a class="text-dark px-2" href="">
                            <i class="fab fa-twitter"></i>
                        </a>
                        <a class="text-dark px-2" href="">
                            <i class="fab fa-linkedin-in"></i>
                        </a>
                        <a class="text-dark px-2" href="">
                            <i class="fab fa-instagram"></i>
                        </a>
                        <a class="text-dark pl-2" href="">
                            <i class="fab fa-youtube"></i>
                        </a>
                    </div>
                </div>
            </div>
            <div class="row align-items-center py-3 px-xl-5">
                <div class="col-lg-3 d-none d-lg-block">
                    <a href="indexServlet" class="text-decoration-none">
                        <h1 class="m-0 display-5 font-weight-semi-bold"><span class="text-primary font-weight-bold border px-3 mr-1">P</span>Medicine</h1>
                    </a>
                </div>
                <div class="col-lg-6 col-6 text-left">
                    <form action="">
                        <div class="input-group">
                            <input type="text" class="form-control" placeholder="Search for products">
                            <div class="input-group-append">
                                <span class="input-group-text bg-transparent text-primary">
                                    <i class="fa fa-search"></i>
                                </span>
                            </div>
                        </div>
                    </form>
                </div>
                <div class="col-lg-3 col-6 text-right">
                    <c:if test="${user == null}">
                        <a href="cartServlet" class="btn border">
                            <i class="fas fa-heart text-primary"></i>
                            <span class="badge">0</span>
                        </a>
                        <a href="cartServlet" class="btn border">
                            <i class="fas fa-shopping-cart text-primary"></i>
                            <span class="badge">0</span>
                        </a>
                    </c:if>
                    <c:if test = "${user != null}">
                        <a href="cartServlet" class="btn border">
                            <i class="fas fa-heart text-primary"></i>
                            <span class="badge">0</span>
                        </a>

                        <a href="cartServlet" class="btn border">
                            <i class="fas fa-shopping-cart text-primary"></i>
                            <span class="badge">${listCart.size()}</span>
                        </a>
                    </c:if>   
                </div>
            </div>
        </div>
        <!-- Topbar End -->


        <!-- Navbar Start -->
        <div class="container-fluid">
            <div class="row border-top px-xl-5">
                <div class="col-lg-3 d-none d-lg-block">
                    <a class="btn shadow-none d-flex align-items-center justify-content-between bg-primary text-white w-100" data-toggle="collapse" href="#navbar-vertical" style="height: 65px; margin-top: -1px; padding: 0 30px;">
                        <h6 class="m-0">Categories</h6>
                        <i class="fa fa-angle-down text-dark"></i>
                    </a>
                    <nav class="collapse position-absolute navbar navbar-vertical navbar-light align-items-start p-0 border border-top-0 border-bottom-0 bg-light" id="navbar-vertical" style="width: calc(100% - 30px); z-index: 1;">
                        <div class="navbar-nav w-100 overflow-hidden" style="height: 210px">

                            <c:forEach items="${listCategory}" var="category">
                                <a href="shopServlet?categoryId=${category.category_id}" class="nav-item nav-link">${category.category_name}</a>
                            </c:forEach>

                        </div>
                    </nav>
                </div>
                <div class="col-lg-9">
                    <nav class="navbar navbar-expand-lg bg-light navbar-light py-3 py-lg-0 px-0">
                        <a href="" class="text-decoration-none d-block d-lg-none">
                            <h1 class="m-0 display-5 font-weight-semi-bold"><span class="text-primary font-weight-bold border px-3 mr-1">E</span>Shopper</h1>
                        </a>
                        <button type="button" class="navbar-toggler" data-toggle="collapse" data-target="#navbarCollapse">
                            <span class="navbar-toggler-icon"></span>
                        </button>
                        <div class="collapse navbar-collapse justify-content-between" id="navbarCollapse">
                            <div class="navbar-nav mr-auto py-0">
                                <a href="indexServlet" class="nav-item nav-link">Home</a>
                                <a href="shopServlet" class="nav-item nav-link">Shop</a>
                                <a href="detailServlet" class="nav-item nav-link">Shop Detail</a>
                                <div class="nav-item dropdown">
                                    <a href="#" class="nav-link dropdown-toggle active" data-toggle="dropdown">Pages</a>
                                    <div class="dropdown-menu rounded-0 m-0">
                                        <a href="cartServlet" class="dropdown-item">Shopping Cart</a>
                                        <a href="checkoutServlet" class="dropdown-item">Checkout</a>
                                    </div>
                                </div>
                                <a href="contactServlet" class="nav-item nav-link">Contact</a>
                            </div>
                            <div class="navbar-nav ml-auto py-0">

                                <c:if test="${user == null}">
                                    <a href="loginServlet" class="nav-item nav-link">Login</a>
                                    <a href="registerServlet" class="nav-item nav-link">Register</a>
                                </c:if>
                                <c:if test = "${user != null}">                                    
                                    <a href="" class="nav-item nav-link">Xin chào ${user.getName()}!</a>
                                    <a href="logout.jsp" class="nav-item nav-link">Đăng xuất</a>
                                </c:if>
                            </div>
                        </div>
                    </nav>
                </div>
            </div>
        </div>
        <!-- Navbar End -->


        <!-- Page Header Start -->
        <div class="container-fluid bg-secondary mb-5">
            <div class="d-flex flex-column align-items-center justify-content-center" style="min-height: 300px">
                <h1 class="font-weight-semi-bold text-uppercase mb-3">Shopping Cart</h1>
                <div class="d-inline-flex">
                    <p class="m-0"><a href="indexServlet">Home</a></p>
                    <p class="m-0 px-2">-</p>
                    <p class="m-0">Shopping Cart</p>
                </div>
            </div>
        </div>
        <!-- Page Header End -->


        <!-- Cart Start -->
        <c:if test="${user == null}">
            <p style="font-size: 18px; font-weight: bold; margin-left: 80px">
                Hãy đăng nhập để tận hưởng đầy đủ tính năng của giỏ hàng!
            </p>
        </c:if>
        <c:if test="${user != null}">

            <c:if test="${empty listCart}">
                <p style="font-size: 18px; font-weight: bold; margin-left: 80px">
                    Giỏ hàng của bạn đang trống. Hãy thêm sản phẩm để tiếp tục mua sắm.
                </p>
            </c:if>
            <c:if test="${not empty listCart}">
                <c:set var="totalPrice" value="0" />

                <!-- Hiển thị giỏ hàng nếu có sản phẩm -->
                <div class="container-fluid pt-5">
                    <div class="row px-xl-5">
                        <!-- Bảng hiển thị thông tin sản phẩm trong giỏ hàng -->
                        <div class="col-lg-8 table-responsive mb-5">
                            <table class="table table-bordered text-center mb-0">
                                <thead class="bg-secondary text-dark">
                                    <tr>
                                        <th>#</th>
                                        <th>Image</th>
                                        <th>Products</th>
                                        <th>Price</th>
                                        <th>Quantity</th>
                                        <th>Total</th>
                                        <th>Remove</th>

                                    </tr>
                                </thead>
                                <tbody class="align-middle">

                                    <c:forEach items="${listCart}" var="cart">
                                        <!-- Tính tổng giá của từng sản phẩm -->
                                        <c:set var="productTotal" value="${cart.price * cart.quantity}" />
                                        <!-- Cộng tổng giá vào biến totalPrice -->
                                        <c:set var="totalPrice" value="${totalPrice + productTotal}" />

                                        <tr>
                                            <td class="align-middle">
                                                ${count + 1}

                                            </td>
                                            <td class="align-middle">
                                                <img src="assets/Image/${cart.image}" alt="${cart.product_name}" style="width: 100px;">

                                            </td>
                                            <td class="align-middle">

                                                ${cart.product_name}
                                            </td>

                                            <td class="align-middle">$${cart.price}</td>
                                            <td class="align-middle">
                                                <form action="updatecartServlet" method="get">

                                                    <div class="input-group quantity mx-auto" style="width: 100px;">
                                                        <div class="input-group-btn">
                                                            <button class="btn btn-sm btn-primary btn-minus">
                                                                <i class="fa fa-minus"></i>
                                                            </button>
                                                        </div>
                                                        <input type="text" class="form-control form-control-sm bg-secondary text-center"  name="quantity" value="${cart.getQuantity()}">


                                                        <div class="input-group-btn">
                                                            <button class="btn btn-sm btn-primary btn-plus">
                                                                <i class="fa fa-plus"></i>
                                                            </button>
                                                        </div>
                                                    </div>
                                                    <input type="hidden" name="productID" value="${cart.getId_product()}">
                                                </form>
                                            </td>


                                            <td class="align-middle">$${cart.price}</td>

                                            <td class="align-middle">
                                                <form action="deletecartServlet" method="get">
                                                    <input type="hidden" name="productID" value="${cart.id_product}">
                                                    <button class="btn btn-sm btn-primary">
                                                        <i class="fa fa-times">

                                                        </i>
                                                    </button>
                                                </form>
                                            </td>
                                        </tr>
                                        <c:set var="count" value="${count + 1}" />
                                    </c:forEach>

                                </tbody>
                            </table>
                        </div>

                        <!-- Phần hiển thị thông tin đơn hàng và tổng giá -->
                        <div class="col-lg-4">
                            <form class="mb-5" action="">
                                <div class="input-group">
                                    <input type="text" class="form-control p-4" placeholder="Coupon Code">
                                    <div class="input-group-append">
                                        <button class="btn btn-primary">Apply Coupon</button>
                                    </div>
                                </div>
                            </form>

                            <!-- Thông tin đơn hàng và tổng giá -->
                            <div class="card border-secondary mb-5">
                                <div class="card-header bg-secondary border-0">
                                    <h4 class="font-weight-semi-bold m-0">Cart Summary</h4>
                                </div>
                                <div class="card-body">
                                    <div class="d-flex justify-content-between mb-3 pt-1">
                                        <h6 class="font-weight-medium">Subtotal</h6>
                                        <h6 class="font-weight-medium">$${totalPrice}</h6>
                                    </div>
                                    <div class="d-flex justify-content-between">
                                        <h6 class="font-weight-medium">Shipping</h6>
                                        <h6 class="font-weight-medium">$10</h6>
                                    </div>

                                </div>
                                <div class="card-footer border-secondary bg-transparent">
                                    <div class="d-flex justify-content-between mt-2">
                                        <h5 class="font-weight-bold">Total</h5>
                                        <h5 class="font-weight-bold">$${totalPrice + 10}</h5>
                                    </div>
                                    <form action="checkoutServlet" method="get">
                                        <input type="hidden" name="productID" value="${cart.id_product}">
                                        <button class="btn btn-block btn-primary my-3 py-3">Proceed To Checkout</button>
                                    </form>

                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </c:if>
        </c:if>

        <!-- Cart End -->


        <!-- Footer Start -->
        <div class="container-fluid bg-secondary text-dark mt-5 pt-5">
            <div class="row px-xl-5 pt-5">
                <div class="col-lg-4 col-md-12 mb-5 pr-3 pr-xl-5">
                    <a href="indexServlet" class="text-decoration-none">
                        <h1 class="mb-4 display-5 font-weight-semi-bold"><span class="text-primary font-weight-bold border border-white px-3 mr-1">P</span>Medicine</h1>
                    </a>
                    <p>Dolore erat dolor sit lorem vero amet. Sed sit lorem magna, ipsum no sit erat lorem et magna ipsum dolore amet erat.</p>
                    <p class="mb-2"><i class="fa fa-map-marker-alt text-primary mr-3"></i>123 Street, New York, USA</p>
                    <p class="mb-2"><i class="fa fa-envelope text-primary mr-3"></i>info@example.com</p>
                    <p class="mb-0"><i class="fa fa-phone-alt text-primary mr-3"></i>+012 345 67890</p>
                </div>
                <div class="col-lg-8 col-md-12">
                    <div class="row">
                        <div class="col-md-4 mb-5">
                            <h5 class="font-weight-bold text-dark mb-4">Quick Links</h5>
                            <div class="d-flex flex-column justify-content-start">
                                <a class="text-dark mb-2" href="indexServlet"><i class="fa fa-angle-right mr-2"></i>Home</a>
                                <a class="text-dark mb-2" href="shopServlet"><i class="fa fa-angle-right mr-2"></i>Our Shop</a>
                                <a class="text-dark mb-2" href="detailServlet"><i class="fa fa-angle-right mr-2"></i>Shop Detail</a>
                                <a class="text-dark mb-2" href="cartServlet"><i class="fa fa-angle-right mr-2"></i>Shopping Cart</a>
                                <a class="text-dark mb-2" href="checkoutServlet"><i class="fa fa-angle-right mr-2"></i>Checkout</a>
                                <a class="text-dark" href="contactServlet"><i class="fa fa-angle-right mr-2"></i>Contact Us</a>
                            </div>
                        </div>
                        <div class="col-md-4 mb-5">
                            <h5 class="font-weight-bold text-dark mb-4">Quick Links</h5>
                            <div class="d-flex flex-column justify-content-start">
                                <a class="text-dark mb-2" href="indexServlet"><i class="fa fa-angle-right mr-2"></i>Home</a>
                                <a class="text-dark mb-2" href="shopServlet"><i class="fa fa-angle-right mr-2"></i>Our Shop</a>
                                <a class="text-dark mb-2" href="detailServlet"><i class="fa fa-angle-right mr-2"></i>Shop Detail</a>
                                <a class="text-dark mb-2" href="cartServlet"><i class="fa fa-angle-right mr-2"></i>Shopping Cart</a>
                                <a class="text-dark mb-2" href="checkoutServlet"><i class="fa fa-angle-right mr-2"></i>Checkout</a>
                                <a class="text-dark" href="contactServlet"><i class="fa fa-angle-right mr-2"></i>Contact Us</a>
                            </div>
                        </div>
                        <div class="col-md-4 mb-5">
                            <h5 class="font-weight-bold text-dark mb-4">Newsletter</h5>
                            <form action="">
                                <div class="form-group">
                                    <input type="text" class="form-control border-0 py-4" placeholder="Your Name" required="required" />
                                </div>
                                <div class="form-group">
                                    <input type="email" class="form-control border-0 py-4" placeholder="Your Email"
                                           required="required" />
                                </div>
                                <div>
                                    <button class="btn btn-primary btn-block border-0 py-3" type="submit">Subscribe Now</button>
                                </div>
                            </form>
                        </div>
                    </div>
                </div>
            </div>

        </div>
        <!-- Footer End -->


        <!-- Back to Top -->
        <a href="#" class="btn btn-primary back-to-top"><i class="fa fa-angle-double-up"></i></a>


        <!-- JavaScript Libraries -->
        <script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
        <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.bundle.min.js"></script>
        <script src="lib/easing/easing.min.js"></script>
        <script src="lib/owlcarousel/owl.carousel.min.js"></script>

        <!-- Contact Javascript File -->
        <script src="mail/jqBootstrapValidation.min.js"></script>
        <script src="mail/contact.js"></script>

        <!-- Template Javascript -->
        <script src="js/main.js"></script>
    </body>

</html>