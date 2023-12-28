<%-- 
    Document   : indexx
    Created on : 15 Dec 2023, 12:29:42 pm
    Author     : admin
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="en">

    <head>
        <meta charset="utf-8">
        <title>Shopbanthuoc</title>
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
        <div class="container-fluid mb-5">
            <div class="row border-top px-xl-5">
                <div class="col-lg-3 d-none d-lg-block">
                    <a class="btn shadow-none d-flex align-items-center justify-content-between bg-primary text-white w-100" data-toggle="collapse" href="#navbar-vertical" style="height: 65px; margin-top: -1px; padding: 0 30px;">
                        <h6 class="m-0">Categories</h6>
                        <i class="fa fa-angle-down text-dark"></i>
                    </a>
                    <nav class="collapse show navbar navbar-vertical navbar-light align-items-start p-0 border border-top-0 border-bottom-0" id="navbar-vertical">
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
                                <a href="indexServlet" class="nav-item nav-link active">Home</a>
                                <a href="shopServlet" class="nav-item nav-link">Shop</a>
                                <a href="detailServlet" class="nav-item nav-link">Shop Detail</a>
                                <div class="nav-item dropdown">
                                    <a href="#" class="nav-link dropdown-toggle" data-toggle="dropdown">Pages</a>
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
                    <div id="header-carousel" class="carousel slide" data-ride="carousel">
                        <div class="carousel-inner">
                            <div class="carousel-item active" style="height: 410px;">
                                <img class="img-fluid" style="object-fit: cover; width: 100%; height: 100%;" src="assets/icon/banerthuoc1.jpg" alt="Image">
                            </div>
                            <div class="carousel-item" style="height: 410px;">
                                <img class="img-fluid" style="object-fit: cover; width: 100%; height: 100%;" src="assets/icon/bannerbanthuoc2.jpg" alt="Image">
                            </div>
                            <div class="carousel-item" style="height: 410px;">
                                <img class="img-fluid" style="object-fit: cover; width: 100%; height: 100%;" src="assets/icon/bannerbanthuoc3.jpg" alt="Image">
                            </div>
                        </div>

                        <a class="carousel-control-prev" href="#header-carousel" data-slide="prev">
                            <div class="btn btn-dark" style="width: 45px; height: 45px;">
                                <span class="carousel-control-prev-icon mb-n2"></span>
                            </div>
                        </a>
                        <a class="carousel-control-next" href="#header-carousel" data-slide="next">
                            <div class="btn btn-dark" style="width: 45px; height: 45px;">
                                <span class="carousel-control-next-icon mb-n2"></span>
                            </div>
                        </a>
                    </div>
                </div>
            </div>
        </div>
        <!-- Navbar End -->


        <!-- Featured Start -->
        <div class="container-fluid pt-5">
            <div class="row px-xl-5 pb-3">
                <div class="col-lg-3 col-md-6 col-sm-12 pb-1">
                    <div class="d-flex align-items-center border mb-4" style="padding: 30px;">
                        <h1 class="fa fa-check text-primary m-0 mr-3"></h1>
                        <h5 class="font-weight-semi-bold m-0">Quality Product</h5>
                    </div>
                </div>
                <div class="col-lg-3 col-md-6 col-sm-12 pb-1">
                    <div class="d-flex align-items-center border mb-4" style="padding: 30px;">
                        <h1 class="fa fa-shipping-fast text-primary m-0 mr-2"></h1>
                        <h5 class="font-weight-semi-bold m-0">Free Shipping</h5>
                    </div>
                </div>
                <div class="col-lg-3 col-md-6 col-sm-12 pb-1">
                    <div class="d-flex align-items-center border mb-4" style="padding: 30px;">
                        <h1 class="fas fa-exchange-alt text-primary m-0 mr-3"></h1>
                        <h5 class="font-weight-semi-bold m-0">14-Day Return</h5>
                    </div>
                </div>
                <div class="col-lg-3 col-md-6 col-sm-12 pb-1">
                    <div class="d-flex align-items-center border mb-4" style="padding: 30px;">
                        <h1 class="fa fa-phone-volume text-primary m-0 mr-3"></h1>
                        <h5 class="font-weight-semi-bold m-0">24/7 Support</h5>
                    </div>
                </div>
            </div>
        </div>
        <!-- Featured End -->


        <!-- Categories Start -->
        <div class="container-fluid pt-5">
            <div class="row px-xl-5 pb-3">
                <c:forEach items="${listCategory}" var="category">
                    <c:set var="productCount" value="0" />
                    <c:forEach items="${listProduct}" var="product">
                        <c:if test="${product.category_id eq category.category_id}">
                            <c:set var="productCount" value="${productCount + 1}" />
                        </c:if>
                    </c:forEach>

                    <div class="col-lg-4 col-md-6 pb-1">
                        <div class="cat-item d-flex flex-column border mb-4" style="padding: 30px;">
                            <p class="text-right">${productCount} Products</p>
                            <a href="shopServlet?categoryId=${category.category_id}" class="cat-img position-relative overflow-hidden mb-3">
                                <img class="img-fluid" src="./assets/image_category/${category.category_image}" alt="">
                            </a>
                            <h5 class="font-weight-semi-bold m-0">${category.category_name}</h5>
                        </div>
                    </div>
                </c:forEach>
            </div>
        </div>
        <!-- Categories End -->




        <!-- Products Start -->
        <c:forEach items="${listCategory}" var="category">
            <div class="container-fluid pt-5">
                <div class="text-center mb-4">
                    <h2 class="section-title px-5"><span class="px-2">Các sản phẩm ${category.category_name}</span></h2>
                </div>
                <div class="row px-xl-5 pb-3">
                    <c:set var="productCount" value="0" />
                    <c:forEach items="${listProduct}" var="product">
                        <c:if test="${product.category_id eq category.category_id}">
                            <c:set var="productCount" value="${productCount + 1}" />
                            <c:if test="${productCount le 8}">
                                <div class="col-lg-3 col-md-6 col-sm-12 pb-1">
                                    <div class="card product-item border-0 mb-4">
                                        <div class="card-header product-img position-relative overflow-hidden bg-transparent border p-0">
                                            <img class="img-fluid w-100" src="assets/Image/${product.image}" alt="">
                                        </div>
                                        <div class="card-body border-left border-right text-center p-0 pt-4 pb-3">
                                            <h6 class="text-truncate mb-3">${product.product_name}</h6>
                                            <div class="d-flex justify-content-center">
                                                <h6>$${product.price}</h6><h6 class="text-muted ml-2"><del>$${product.price}</del></h6>
                                            </div>
                                        </div>
                                        <div class="card-footer d-flex justify-content-between bg-light border">
                                            <a href="detailServlet?product_id=${product.product_id}" class="btn btn-sm text-dark p-0"><i class="fas fa-eye text-primary mr-1"></i>View Detail</a>
                                            <a href="addtocartServlet?product_id=${product.product_id}&quantity=1" class="btn btn-sm text-dark p-0">
                                                <i class="fas fa-shopping-cart text-primary mr-1"></i>Add To Cart
                                            </a>
                                        </div>
                                    </div>
                                </div>
                            </c:if>
                        </c:if>                 
                    </c:forEach>
                </div>
            </div>
        </c:forEach>
        <!-- Products End -->

        <!-- Vendor Start -->
        <div class="container-fluid py-5">
            <div class="row px-xl-5">
                <div class="col">
                    <div class="owl-carousel vendor-carousel">
                        <div class="vendor-item border p-4">
                            <img src="img/vendor-1.jpg" alt="">
                        </div>
                        <div class="vendor-item border p-4">
                            <img src="img/vendor-2.jpg" alt="">
                        </div>
                        <div class="vendor-item border p-4">
                            <img src="img/vendor-3.jpg" alt="">
                        </div>
                        <div class="vendor-item border p-4">
                            <img src="img/vendor-4.jpg" alt="">
                        </div>
                        <div class="vendor-item border p-4">
                            <img src="img/vendor-5.jpg" alt="">
                        </div>
                        <div class="vendor-item border p-4">
                            <img src="img/vendor-6.jpg" alt="">
                        </div>
                        <div class="vendor-item border p-4">
                            <img src="img/vendor-7.jpg" alt="">
                        </div>
                        <div class="vendor-item border p-4">
                            <img src="img/vendor-8.jpg" alt="">
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <!-- Vendor End -->
        <section style="color: #000; background-color: #f3f2f2;">
            <div class="container py-5">
                <div class="row d-flex justify-content-center">
                    <div class="col-md-10 col-xl-8 text-center">
                        <h3 class="fw-bold mb-4">Testimonials</h3>
                        <p class="mb-4 pb-2 mb-md-5 pb-md-0">
                            Lorem ipsum dolor sit amet, consectetur adipisicing elit. Fugit, error amet
                            numquam iure provident voluptate esse quasi, veritatis totam voluptas nostrum
                            quisquam eum porro a pariatur veniam.
                        </p>
                    </div>
                </div>

                <div class="row text-center">
                    <div class="col-md-4 mb-4 mb-md-0">
                        <div class="card">
                            <div class="card-body py-4 mt-2">
                                <div class="d-flex justify-content-center mb-4">
                                    <img src="https://mdbcdn.b-cdn.net/img/Photos/Avatars/img%20(10).webp"
                                         class="rounded-circle shadow-1-strong" width="100" height="100" />
                                </div>
                                <h5 class="font-weight-bold">Teresa May</h5>
                                <h6 class="font-weight-bold my-3">Founder at ET Company</h6>
                                <ul class="list-unstyled d-flex justify-content-center">
                                    <li>
                                        <i class="fas fa-star fa-sm text-info"></i>
                                    </li>
                                    <li>
                                        <i class="fas fa-star fa-sm text-info"></i>
                                    </li>
                                    <li>
                                        <i class="fas fa-star fa-sm text-info"></i>
                                    </li>
                                    <li>
                                        <i class="fas fa-star fa-sm text-info"></i>
                                    </li>
                                    <li>
                                        <i class="fas fa-star-half-alt fa-sm text-info"></i>
                                    </li>
                                </ul>
                                <p class="mb-2">
                                    <i class="fas fa-quote-left pe-2"></i>Lorem ipsum dolor sit amet,
                                    consectetur adipisicing elit. Quod eos id officiis hic tenetur quae quaerat
                                    ad velit ab hic tenetur.
                                </p>
                            </div>
                        </div>
                    </div>
                    <div class="col-md-4 mb-4 mb-md-0">
                        <div class="card">
                            <div class="card-body py-4 mt-2">
                                <div class="d-flex justify-content-center mb-4">
                                    <img src="https://mdbcdn.b-cdn.net/img/Photos/Avatars/img%20(15).webp"
                                         class="rounded-circle shadow-1-strong" width="100" height="100" />
                                </div>
                                <h5 class="font-weight-bold">Maggie McLoan</h5>
                                <h6 class="font-weight-bold my-3">Photographer at Studio LA</h6>
                                <ul class="list-unstyled d-flex justify-content-center">
                                    <li>
                                        <i class="fas fa-star fa-sm text-info"></i>
                                    </li>
                                    <li>
                                        <i class="fas fa-star fa-sm text-info"></i>
                                    </li>
                                    <li>
                                        <i class="fas fa-star fa-sm text-info"></i>
                                    </li>
                                    <li>
                                        <i class="fas fa-star fa-sm text-info"></i>
                                    </li>
                                    <li>
                                        <i class="fas fa-star fa-sm text-info"></i>
                                    </li>
                                </ul>
                                <p class="mb-2">
                                    <i class="fas fa-quote-left pe-2"></i>Autem, totam debitis suscipit saepe
                                    sapiente magnam officiis quaerat necessitatibus odio assumenda perferendis
                                    labore laboriosam.
                                </p>
                            </div>
                        </div>
                    </div>
                    <div class="col-md-4 mb-0">
                        <div class="card">
                            <div class="card-body py-4 mt-2">
                                <div class="d-flex justify-content-center mb-4">
                                    <img src="https://mdbcdn.b-cdn.net/img/Photos/Avatars/img%20(17).webp"
                                         class="rounded-circle shadow-1-strong" width="100" height="100" />
                                </div>
                                <h5 class="font-weight-bold">Alexa Horwitz</h5>
                                <h6 class="font-weight-bold my-3">Front-end Developer in NY</h6>
                                <ul class="list-unstyled d-flex justify-content-center">
                                    <li>
                                        <i class="fas fa-star fa-sm text-info"></i>
                                    </li>
                                    <li>
                                        <i class="fas fa-star fa-sm text-info"></i>
                                    </li>
                                    <li>
                                        <i class="fas fa-star fa-sm text-info"></i>
                                    </li>
                                    <li>
                                        <i class="fas fa-star fa-sm text-info"></i>
                                    </li>
                                    <li>
                                        <i class="far fa-star fa-sm text-info"></i>
                                    </li>
                                </ul>
                                <p class="mb-2">
                                    <i class="fas fa-quote-left pe-2"></i>Cras sit amet nibh libero, in gravida
                                    nulla metus scelerisque ante sollicitudin commodo cras purus odio,
                                    vestibulum in tempus viverra turpis.
                                </p>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </section>
        <!-- Vendor End -->
        <div>
            <iframe style="border:0; width: 100%; height: 350px;" src="https://www.google.com/maps/embed?pb=!1m14!1m8!1m3!1d15235.914620704008!2d107.5949883!3d16.4637131!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x3142abdbb6af62c5%3A0xc2c4318f0ac7ef8a!2zVMO8IFRo4bqjbyBIdeG7s25nIMSQ4buTbmcgVGjhuqFvIFRo4bqhbyBMw6J5!5e0!3m2!1sen!2s!4v1647409785248!5m2!1sen!2s" frameborder="0" allowfullscreen></iframe>
        </div>

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