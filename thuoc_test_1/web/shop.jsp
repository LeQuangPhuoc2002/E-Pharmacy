<%-- 
    Document   : shopp
    Created on : 15 Dec 2023, 1:04:17 pm
    Author     : admin
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="en">

    <head>
        <meta charset="utf-8">
        <title>shop</title>
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
                                <a href="shopServlet" class="nav-item nav-link active">Shop</a>
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
                </div>
            </div>
        </div>
        <!-- Navbar End -->


        <!-- Page Header Start -->
        <div class="container-fluid bg-secondary mb-5">
            <div class="d-flex flex-column align-items-center justify-content-center" style="min-height: 300px">
                <h1 class="font-weight-semi-bold text-uppercase mb-3">Our Shop</h1>
                <div class="d-inline-flex">

                    <p class="m-0"><a href="indexServlet">Home</a></p>
                    <p class="m-0 px-2">-</p>
                    <c:choose>
                        <c:when test="${not empty sortBy}">
                            <p class="m-0">${sortBy}</p>
                        </c:when>
                        <c:when test="${not empty search_query}">
                            <p class="m-0">${search_query}</p>
                        </c:when>
                        <c:when test="${empty categoryId}">
                            <p class="m-0">Shop</p>
                        </c:when>

                        <c:otherwise>
                            <c:set var="foundCategory" value="false" />
                            <c:forEach items="${listCategory}" var="category">
                                <c:if test="${category.category_id eq categoryId and not foundCategory}">
                                    <p class="m-0">${category.category_name}</p>
                                    <c:set var="foundCategory" value="true" />
                                </c:if>
                            </c:forEach>
                        </c:otherwise>
                    </c:choose>





                </div>
            </div>
        </div>
        <!-- Page Header End -->


        <!-- Shop Start -->
        <div class="container-fluid pt-5">
            <div class="row px-xl-5">
                <!-- Shop Sidebar Start -->
                <div class="col-lg-3 col-md-12">
                    <!-- Price Start -->
                    <div class="border-bottom mb-4 pb-4">
                        <h5 class="font-weight-semi-bold mb-4">Filter by price</h5>
                        <form>
                            <div class="custom-control custom-checkbox d-flex align-items-center justify-content-between mb-3">
                                <input type="checkbox" class="custom-control-input" checked id="price-all">
                                <label class="custom-control-label" for="price-all">All Price</label>
                                <span class="badge border font-weight-normal">60</span>
                            </div>
                            <div class="custom-control custom-checkbox d-flex align-items-center justify-content-between mb-3">
                                <input type="checkbox" class="custom-control-input" id="price-1">
                                <label class="custom-control-label" for="price-1">$0 - $100</label>
                                <span class="badge border font-weight-normal">60</span>
                            </div>
                            <div class="custom-control custom-checkbox d-flex align-items-center justify-content-between mb-3">
                                <input type="checkbox" class="custom-control-input" id="price-2">
                                <label class="custom-control-label" for="price-2">$100 - $200</label>
                                <span class="badge border font-weight-normal">0</span>
                            </div>
                            <div class="custom-control custom-checkbox d-flex align-items-center justify-content-between mb-3">
                                <input type="checkbox" class="custom-control-input" id="price-3">
                                <label class="custom-control-label" for="price-3">$200 - $300</label>
                                <span class="badge border font-weight-normal">0</span>
                            </div>
                            <div class="custom-control custom-checkbox d-flex align-items-center justify-content-between mb-3">
                                <input type="checkbox" class="custom-control-input" id="price-4">
                                <label class="custom-control-label" for="price-4">$300 - $400</label>
                                <span class="badge border font-weight-normal">0</span>
                            </div>
                            <div class="custom-control custom-checkbox d-flex align-items-center justify-content-between">
                                <input type="checkbox" class="custom-control-input" id="price-5">
                                <label class="custom-control-label" for="price-5">$400 - $500</label>
                                <span class="badge border font-weight-normal">0</span>
                            </div>
                        </form>
                    </div>
                    <!-- Price End -->

                </div>
                <!-- Shop Sidebar End -->


                <!-- Shop Product Start -->
                <div class="col-lg-9 col-md-12">
                    <div class="row pb-3">
                        <div class="col-12 pb-1">
                            <div class="d-flex align-items-center justify-content-between mb-4">
                                <form action="shopServlet" method="GET">
                                    <div class="input-group">
                                        <input type="text" class="form-control" placeholder="Search by name" name="search_query">
                                        <div class="input-group-append">
                                            <button class="btn btn-outline-primary" type="submit">
                                                <i class="fa fa-search"></i>
                                            </button>
                                        </div>
                                    </div>
                                </form>

                                <div class="dropdown ml-4">
                                    <button class="btn border dropdown-toggle" type="button" id="triggerId" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                                        Sort by
                                    </button>
                                    <div class="dropdown-menu dropdown-menu-right" aria-labelledby="sortDropdown">
                                        <a class="dropdown-item" href="?sortBy=priceLowToHigh">Price: Low to High</a>
                                        <a class="dropdown-item" href="?sortBy=priceHighToLow">Price: High to Low</a>
                                    </div>
                                </div>

                            </div>
                        </div>   

                        <c:forEach items="${listProduct}" var="product">
                            <c:if test="${not empty categoryId and product.category_id eq categoryId}">

                                <div class="col-lg-4 col-md-6 col-sm-12 pb-1">
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
                            <c:if test="${empty categoryId}">
                                <div class="col-lg-4 col-md-6 col-sm-12 pb-1">
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
                        </c:forEach>
                        <div class="col-12 pb-1">
                            <nav aria-label="Page navigation">
                                <ul class="pagination justify-content-center mb-3">
                                    <li class="page-item disabled">
                                        <a class="page-link" href="#" aria-label="Previous">
                                            <span aria-hidden="true">&laquo;</span>
                                            <span class="sr-only">Previous</span>
                                        </a>
                                    </li>
                                    <li class="page-item active"><a class="page-link" href="#">1</a></li>
                                    <li class="page-item"><a class="page-link" href="#">2</a></li>
                                    <li class="page-item"><a class="page-link" href="#">3</a></li>
                                    <li class="page-item">
                                        <a class="page-link" href="#" aria-label="Next">
                                            <span aria-hidden="true">&raquo;</span>
                                            <span class="sr-only">Next</span>
                                        </a>
                                    </li>
                                </ul>
                            </nav>
                        </div>
                    </div>
                </div>
                <!-- Shop Product End -->
            </div>
        </div>
        <!-- Shop End -->


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