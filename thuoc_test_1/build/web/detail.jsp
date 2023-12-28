<%-- 
    Document   : detail
    Created on : 15 Dec 2023, 1:24:41 pm
    Author     : admin
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="en">

    <head>
        <meta charset="utf-8">
        <title>Chitiet</title>
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
                                <a href="detailServlet" class="nav-item nav-link active">Shop Detail</a>
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
                <h1 class="font-weight-semi-bold text-uppercase mb-3">Shop Detail</h1>
                <div class="d-inline-flex">
                    <p class="m-0"><a href="indexServlet">Home</a></p>
                    <p class="m-0 px-2">-</p>
                    <p class="m-0">Shop Detail</p>
                </div>
            </div>
        </div>


        <c:if test="${product eq null}">
            <!-- Hiển thị thông báo khi không có sản phẩm -->
            <p style="font-size: 18px;  font-weight: bold; margin-left: 80px">
                Hãy chọn một sản phẩm để khám phá đầy đủ chi tiết và trải nghiệm tất cả những điều tuyệt vời mà nó mang đến.
            </p>
        </c:if>

        <c:if test="${product != null}">
            <div class="container-fluid py-5">
                <div class="row px-xl-5">
                    <div class="col-lg-5 pb-5">
                        <div id="product-carousel" class="carousel slide" data-ride="carousel">
                            <div class="carousel-inner border">
                                <div class="carousel-item active">
                                    <img class="w-100 h-100" src="assets/Image/${product.image}" alt="Image">
                                </div>

                            </div>

                        </div>
                    </div>
                    <div class="col-lg-7 pb-5">
                        <h3 class="font-weight-semi-bold">${product.product_name}</h3>
                        <div class="d-flex mb-3">
                            <div class="text-primary mr-2">
                                <small class="fas fa-star"></small>
                                <small class="fas fa-star"></small>
                                <small class="fas fa-star"></small>
                                <small class="fas fa-star-half-alt"></small>
                                <small class="far fa-star"></small>
                            </div>
                            <small class="pt-1">(50 Reviews)</small>
                        </div>
                        <h3 class="font-weight-semi-bold mb-4">$${product.price}</h3>
                        <p class="mb-4">${product.description}.</p>
                        <div class="d-flex align-items-center mb-4 pt-2">
                            <form id="addToCartForm" action="addtocartServlet" method="get">
                                <div class="input-group quantity mr-3" style="width: 130px;">
                                    <div class="input-group-btn">
                                        <button class="btn btn-primary btn-minus" type="button" onclick="decrementQuantity()">
                                            <i class="fa fa-minus"></i>
                                        </button>
                                    </div>
                                    <input type="text" class="form-control bg-secondary text-center" name="quantity" id="quantityInput" value="1">
                                    <div class="input-group-btn">
                                        <button class="btn btn-primary btn-plus" type="button" onclick="incrementQuantity()">
                                            <i class="fa fa-plus"></i>
                                        </button>
                                    </div>
                                </div>
                                <br>
                                <input type="hidden" name="product_id" value="${product.product_id}">
                                <button type="submit" class="btn btn-primary px-3"><i class="fa fa-shopping-cart mr-1"></i> Add To Cart</button>
                            </form>

                            <!-- Hidden link for redirection -->
                            <a href="#" id="redirectLink" style="display: none;"></a>
                        </div>


                        <div class="d-flex pt-2">
                            <p class="text-dark font-weight-medium mb-0 mr-2">Share on:</p>
                            <div class="d-inline-flex">
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
                                    <i class="fab fa-pinterest"></i>
                                </a>
                            </div>
                        </div>
                    </div>

                </div>
                <div class="row px-xl-5">
                    <div class="col">
                        <div class="nav nav-tabs justify-content-center border-secondary mb-4">
                            <a class="nav-item nav-link active" data-toggle="tab" href="#tab-pane-1">Description</a>
                            <a class="nav-item nav-link" data-toggle="tab" href="#tab-pane-2">Information</a>
                            <a class="nav-item nav-link" data-toggle="tab" href="#tab-pane-3">Reviews (${listComment.size()})</a>
                        </div>
                        <div class="tab-content">
                            <div class="tab-pane fade show active" id="tab-pane-1">
                                <h4 class="mb-3">Product Description</h4>
                                <p>Eos no lorem eirmod diam diam, eos elitr et gubergren diam sea. Consetetur vero aliquyam invidunt duo dolores et duo sit. Vero diam ea vero et dolore rebum, dolor rebum eirmod consetetur invidunt sed sed et, lorem duo et eos elitr, sadipscing kasd ipsum rebum diam. Dolore diam stet rebum sed tempor kasd eirmod. Takimata kasd ipsum accusam sadipscing, eos dolores sit no ut diam consetetur duo justo est, sit sanctus diam tempor aliquyam eirmod nonumy rebum dolor accusam, ipsum kasd eos consetetur at sit rebum, diam kasd invidunt tempor lorem, ipsum lorem elitr sanctus eirmod takimata dolor ea invidunt.</p>
                                <p>Dolore magna est eirmod sanctus dolor, amet diam et eirmod et ipsum. Amet dolore tempor consetetur sed lorem dolor sit lorem tempor. Gubergren amet amet labore sadipscing clita clita diam clita. Sea amet et sed ipsum lorem elitr et, amet et labore voluptua sit rebum. Ea erat sed et diam takimata sed justo. Magna takimata justo et amet magna et.</p>
                            </div>
                            <div class="tab-pane fade" id="tab-pane-2">
                                <h4 class="mb-3">Additional Information</h4>
                                <p>Eos no lorem eirmod diam diam, eos elitr et gubergren diam sea. Consetetur vero aliquyam invidunt duo dolores et duo sit. Vero diam ea vero et dolore rebum, dolor rebum eirmod consetetur invidunt sed sed et, lorem duo et eos elitr, sadipscing kasd ipsum rebum diam. Dolore diam stet rebum sed tempor kasd eirmod. Takimata kasd ipsum accusam sadipscing, eos dolores sit no ut diam consetetur duo justo est, sit sanctus diam tempor aliquyam eirmod nonumy rebum dolor accusam, ipsum kasd eos consetetur at sit rebum, diam kasd invidunt tempor lorem, ipsum lorem elitr sanctus eirmod takimata dolor ea invidunt.</p>
                                <div class="row">
                                    <div class="col-md-6">
                                        <ul class="list-group list-group-flush">
                                            <li class="list-group-item px-0">
                                                Sit erat duo lorem duo ea consetetur, et eirmod takimata.
                                            </li>
                                            <li class="list-group-item px-0">
                                                Amet kasd gubergren sit sanctus et lorem eos sadipscing at.
                                            </li>
                                            <li class="list-group-item px-0">
                                                Duo amet accusam eirmod nonumy stet et et stet eirmod.
                                            </li>
                                            <li class="list-group-item px-0">
                                                Takimata ea clita labore amet ipsum erat justo voluptua. Nonumy.
                                            </li>
                                        </ul> 
                                    </div>
                                    <div class="col-md-6">
                                        <ul class="list-group list-group-flush">
                                            <li class="list-group-item px-0">
                                                Sit erat duo lorem duo ea consetetur, et eirmod takimata.
                                            </li>
                                            <li class="list-group-item px-0">
                                                Amet kasd gubergren sit sanctus et lorem eos sadipscing at.
                                            </li>
                                            <li class="list-group-item px-0">
                                                Duo amet accusam eirmod nonumy stet et et stet eirmod.
                                            </li>
                                            <li class="list-group-item px-0">
                                                Takimata ea clita labore amet ipsum erat justo voluptua. Nonumy.
                                            </li>
                                        </ul> 
                                    </div>
                                </div>
                            </div>


                            <div class="tab-pane fade" id="tab-pane-3">
                                <div class="row">
                                    <div class="col-md-6">

                                        <section style="background-color: #f7f6f6;">
                                            <div class="container my-5 py-5 text-dark">
                                                <div class="row d-flex justify-content-center">
                                                    <div class="col-md-12 col-lg-10 col-xl-8">
                                                        <c:forEach items="${listComment}" var="comment">
                                                            <div class="card mb-4">
                                                                <div class="card-body">
                                                                    <div class="d-flex flex-start">
                                                                        <img class="rounded-circle shadow-1-strong me-3"
                                                                             src="https://mdbcdn.b-cdn.net/img/Photos/Avatars/img%20(26).webp" alt="avatar" width="40"
                                                                             height="40" />
                                                                        <div class="w-100"> <!-- Điều chỉnh chiều rộng ở đây -->
                                                                            <div class="d-flex justify-content-between align-items-center mb-3">
                                                                                <h6 class="text-primary fw-bold mb-0">
                                                                                    ${comment.getName()}
                                                                                    <span class="text-dark ms-2">${comment.getCommentText()}</span>
                                                                                </h6>
                                                                               
                                                                            </div>

                                                                        </div>
                                                                    </div>
                                                                </div>
                                                            </div>
                                                        </c:forEach>
                                                    </div>
                                                </div>
                                            </div>
                                        </section>


                                    </div>
                                    <c:if test="${user != null}">
                                        <div class="col-md-6">
                                            <h4 class="mb-4">Leave a review</h4>
                                            <small>Your email address will not be published. Required fields are marked *</small>

                                            <!-- Thêm biến để giữ product_id của sản phẩm -->
                                            <input type="hidden" name="productID" value="${productId}">
                                            
                                       


                                            <!-- Thêm form để nhập dữ liệu cho comment -->
                                            <!-- Thêm form để nhập dữ liệu cho comment -->
                                            <form action="addcommentServlet" method="get">
                                                <div class="form-group">
                                                    <!-- Thêm trường ẩn để lưu giữ giá trị productID -->
                                                    <input type="hidden" name="productID" value="${product.product_id}">

                                                    <label for="message">Your Review *</label>
                                                    <textarea name="commentText" id="message" cols="30" rows="5" class="form-control"></textarea>
                                                </div>

                                                <div class="form-group mb-0">
                                                    <input type="submit" value="Leave Your Review" class="btn btn-primary px-3">
                                                </div>
                                            </form>

                                        </div>
                                    </c:if>
                                    <c:if test = "${user == null}">   
                                        <div class="col-md-6">
                                            <h1>Vui lòng đăng nhập để sử dụng tính năng này</h1>
                                        </div>
                                    </c:if>
                                </div>

                            </div>


                        </div>
                    </div>
                </div>
            </div>
        </div>
    </c:if>

    <!-- Shop Detail End -->


    <!-- Products Start -->
    <div class="container-fluid py-5">
        <div class="text-center mb-4">
            <h2 class="section-title px-5"><span class="px-2">You May Also Like</span></h2>
        </div>
        <div class="row px-xl-5">
            <div class="col">
                <div class="owl-carousel related-carousel">
                    <c:forEach items="${listProduct}" var="product">
                        <div class="card product-item border-0">
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
                    </c:forEach>
                </div>
            </div>
        </div>
    </div>
    <!-- Products End -->


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