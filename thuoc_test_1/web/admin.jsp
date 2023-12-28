<%-- 
    Document   : admin
    Created on : 15 Dec 2023, 5:36:13 pm
    Author     : admin
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="vi">
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>admin</title>
        <link rel="stylesheet" href="assets/css/bootstrap.min.css">
        <script src="assets/js/bootstrap.bundle.min.js"></script>
        <script src="https://apis.google.com/js/platform.js" async defer></script>
        <meta name="google-signin-client_id" content="your-client-id.apps.googleusercontent.com">
    </head>     
    <!-- Navbar -->
    <nav class="navbar navbar-expand-lg navbar-light bg-light fixed-top">
        <!-- Container wrapper -->
        <div class="container">
            <!-- Navbar brand -->
            <a href="adminServlet">
                <img src="assets/icon/husc_logo.png" width="50" height="50" class="ms-auto" style="margin-right: 150px;" alt="HUSC Logo">
            </a>
            <!-- Search form -->
            <!-- Biểu mẫu tìm kiếm -->
            <form class="input-group mx-auto" style="width: 400px" action="adminServlet" method="GET">
                <input type="search" class="form-control" name="search_query" placeholder="Nhập truy vấn" aria-label="Tìm kiếm" />
                <button class="btn btn-outline-primary" type="submit" data-mdb-ripple-color="dark" style="padding: .45rem 1.5rem .35rem;">
                    Tìm kiếm
                </button>
            </form>



            <!-- Toggle button -->
            <button class="navbar-toggler" type="button" data-mdb-toggle="collapse"
                    data-mdb-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false"
                    aria-label="Toggle navigation">
                <i class="fas fa-bars"></i>
            </button>
            <!-- Collapsible wrapper -->
            <div class="collapse navbar-collapse" id="navbarSupportedContent">
                <!-- Left links -->
                <ul class="navbar-nav ms-auto mb-2 mb-lg-0">
                    <li class="nav-item">
                        <a class="nav-link d-flex flex-column text-center" aria-current="page" href="adminServlet"><i
                                class="fas fa-user-friends fa-lg"></i><span class="small">Quản lý sản phẩm</span></a>
                    </li>

                    <!--                    <li class="nav-item">
                                            <a class="nav-link d-flex flex-column text-center" aria-current="page" href="adminServlet"><i
                                                    class="fas fa-user-friends fa-lg"></i><span class="small">Xin chào ADMIN !</span></a>
                                        </li>-->
                    <c:if test="${admin == null}">
                        <a href="adminloginServlet" class="nav-item nav-link">Login</a>
                    </c:if>
                    <c:if test = "${admin != null}">  
                        <li class="nav-item">
                            <a class="nav-link d-flex flex-column text-center" aria-current="page" href="adminServlet"><i
                                    class="fas fa-user-friends fa-lg"></i><span class="small">Xin chào ${admin.getName()} !</span></a>
                        </li>

                        <a href="adminlogout.jsp" class="nav-item nav-link">Đăng xuất</a>
                    </c:if>


                </ul>
                <!-- Left links -->
            </div>
            <!-- Collapsible wrapper -->
        </div>
        <!-- Container wrapper -->
    </nav>

    <a href="adminloginServlet" class="nav-item nav-link">Login</a>
    <style>
        .centered-text {
            font-size: 24px; /* Đặt kích thước chữ theo ý muốn */
            font-weight: bold; /* Đặt độ đậm của chữ theo ý muốn */
            text-align: center; /* Canh giữa văn bản */
            margin-top: 50px; /* Điều chỉnh khoảng cách từ trên xuống */
        }

        .cta-button {
            display: inline-block;
            padding: 10px 20px;
            font-size: 18px;
            font-weight: bold;
            text-decoration: none;
            background-color: #3498db;
            color: #fff;
            border-radius: 5px;
            transition: background-color 0.3s ease;
        }

        .cta-button:hover {
            background-color: #2980b9;
        }
    </style>
    <!-- Navbar -->
    <c:if test="${admin == null}">
        <div class="centered-text">
            <br/><br/><br/><br/>
            <p>
                Chào mừng bạn đến với trang quản trị. Đăng nhập để trải nghiệm đầy đủ các tính năng và quyền lợi.
            </p>
        </div>
    </c:if>
    <!-- Thêm các trường hợp khác nếu cần -->


    <c:if test="${admin != null}">
        <div class="container">
            <div class="row justify-content-center">
                <div class="col-12 col-md-10 text-center">
                    <div class="heading pb-4">
                        <h2>Quản lý sản phẩm</h2>
                        <br>
                    </div>
                </div>
            </div>

            <a href="addproductServlet">
                <button class="btn btn-primary" type="button">Thêm sản phẩm</button>
            </a>
            <link href="https://maxcdn.bootstrapcdn.com/font-awesome/4.3.0/css/font-awesome.min.css" rel="stylesheet">
            <div class="container">
                <div class="row">
                    <div class="col-lg-14">
                        <div class="main-box clearfix">
                            <div class="table-responsive">
                                <table class="table user-list">
                                    <thead>
                                        <tr>
                                            <th><span>#</span></th>                                          
                                            <th><span>Ảnh</span></th>
                                            <th><span>Id sản phẩm</span></th>
                                            <th><span>Tên sản phẩm</span></th>                                        
                                            <th><span>Mô tả</span></th>
                                            <th><span>Loại sản phẩm</span></th>
                                            <th><span>Giá sản phẩm</span></th>                                          
                                            <th class="text-center"><span>Số lượng</span></th>
                                            <th><span>Quản lý</span></th>
                                            <th>&nbsp;</th>
                                        </tr>
                                    </thead>
                                    <tbody>   

                                        <c:forEach items="${listProduct}" var="product">

                                            <tr>
                                                <td class="text-center">
                                                    <span class="label label-default">${count + 1}</span>
                                                    <c:set var="count" value="${count + 1}" />
                                                </td>
                                                <td>
                                                    <span class="label label-default"><img src="assets/Image/${product.image}" width="100" height="100"></span>
                                                </td>
                                                <td  class="text-center">
                                                    <span class="label label-default">${product.product_id}</span>
                                                </td>
                                                <td>
                                                    <span class="label label-default">${product.product_name}</span>
                                                </td>
                                                <td>
                                                    <span class="label label-default">${product.description}</span>
                                                </td>
                                                <td>
                                                    <c:set var="foundCategory" value="false" />
                                                    <c:forEach items="${listCategory}" var="category">
                                                        <c:if test="${category.category_id eq product.category_id and not foundCategory}">
                                                            <span class="label label-default">${category.category_name}</span>
                                                            <c:set var="foundCategory" value="true" />
                                                        </c:if>
                                                    </c:forEach>

                                                </td>
                                                <td>$${product.price}</td>
                                                <td class="text-center">
                                                    <span class="label label-default">${product.quantity}</span>
                                                </td>
                                                <td style="width: 7%;">
                                                    <a href="updateproductServlet?productId=${product.product_id}" class="table-link">
                                                        <span class="fa-stack">
                                                            <i class="fa fa-square fa-stack-2x"></i>
                                                            <i class="fa fa-pencil fa-stack-1x fa-inverse"></i>
                                                        </span>
                                                    </a>
                                                    <a href="deleteproductServlet?productId=${product.product_id}" onclick="return confirmDelete();">
                                                        <span class="fa-stack">
                                                            <i class="fa fa-square fa-stack-2x"></i>
                                                            <i class="fa fa-trash-o fa-stack-1x fa-inverse"></i>
                                                        </span>
                                                    </a>
                                                    <script>
                                                        function confirmDelete() {
                                                            return confirm('Bạn có chắc chắn muốn xóa sản phẩm này không?');
                                                        }
                                                    </script>
                                                </td>
                                            </tr>
                                        </c:forEach>

                                    </tbody></table></div></div></div></div></div>

        </c:if>
