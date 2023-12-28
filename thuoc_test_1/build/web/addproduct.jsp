<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="vi">
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>addproduct</title>
        <link rel="stylesheet" href="assets/css/bootstrap.min.css">
        <script src="assets/js/bootstrap.bundle.min.js"></script>
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
    <!-- Navbar -->
    <br><br><br><br>
    <div class="container">

        <section class="panel panel-default">

            <div class="panel-body">
                <div class="panel-heading"> 
                    <br>
                    <h3 class="panel-title">THÊM SẢN PHẨM</h3> 
                </div> 
                <div class="panel-body">
                    <form action="addproductServlet" method="post" enctype="multipart/form-data">
                        <div class="form-group">
                            <label for="name" class="col-sm-3 control-label">Tên sản phẩm</label>
                            <div class="col-sm-9">
                                <input type="text" class="form-control" name="name" placeholder="Thuốc...">
                            </div>
                        </div> <!-- form-group // -->

                        <div class="form-group">
                            <label for="name" class="col-sm-3 control-label">Giá</label>
                            <div class="col-sm-9">
                                <input type="text" class="form-control" name="price" placeholder="$$...">
                            </div>
                        </div> <!-- form-group // -->

                        <div class="form-group">
                            <label for="qty" class="col-sm-3 control-label">Số lượng</label>
                            <div class="col-sm-3">
                                <input type="text" class="form-control" name="quantity" placeholder="...">
                            </div>
                        </div>

                        <div class="form-group">
                            <label for="tech" class="col-sm-3 control-label">Loại sản phẩm</label>
                            <div class="col-sm-3">
                                <select class="form-control" name="category_id">
                                    <c:forEach items="${listCategory}" var="category">
                                        <option value="${category.category_id}">${category.category_name}</option>
                                    </c:forEach>
                                </select>
                            </div>
                        </div>    

                        <div class="form-group">
                            <label for="name" class="col-sm-3 control-label">Hãy thêm ảnh sản phẩm</label>
                            <div class="col-sm-3">
                                <label class="control-label small" for="file_img">Ảnh 1 (jpg/png):</label>
                                <input type="file" name="file_img" id="file_img">
                                <br/>
                                <img src="" alt="Preview" id="imagePreview" style="display:none; max-width: 100%; margin-top: 10px;">
                                <button type="button" id="removeImage" style="display:none;">Xóa ảnh</button>
                            </div>
                        </div> <!-- form-group // -->
                        <br/>

                        <div class="form-group">
                            <label for="about" class="col-sm-3 control-label">Mô tả sản phẩm</label>
                            <div class="col-sm-9">
                                <textarea class="form-control" name="description" placeholder="Sản phẩm ..."></textarea>
                            </div>
                        </div> <!-- form-group // -->

                        <hr>

                        <div class="form-group">
                            <div class="col-sm-offset-3 col-sm-9">
                                <a href="adminServlet">
                                    <button class="btn btn-primary" type="button">Thoát</button>
                                </a>
                                <button type="submit" class="btn btn-primary">Thêm sản phẩm</button>
                            </div>
                        </div> <!-- form-group // -->
                    </form>

                    <script>
                        document.getElementById('file_img').addEventListener('change', function (e) {
                            var fileInput = e.target;
                            var imagePreview = document.getElementById('imagePreview');
                            var removeImageBtn = document.getElementById('removeImage');

                            if (fileInput.files && fileInput.files[0]) {
                                var reader = new FileReader();

                                reader.onload = function (e) {
                                    imagePreview.src = e.target.result;
                                    imagePreview.style.display = 'block';
                                    removeImageBtn.style.display = 'block';
                                };

                                reader.readAsDataURL(fileInput.files[0]);
                            }
                        });

                        document.getElementById('removeImage').addEventListener('click', function () {
                            var fileInput = document.getElementById('file_img');
                            var imagePreview = document.getElementById('imagePreview');
                            var removeImageBtn = document.getElementById('removeImage');

                            fileInput.value = '';
                            imagePreview.src = '';
                            imagePreview.style.display = 'none';
                            removeImageBtn.style.display = 'none';
                        });
                    </script>

                </div><!-- panel-body // -->
        </section><!-- panel// -->


    </div> <!-- container// -->