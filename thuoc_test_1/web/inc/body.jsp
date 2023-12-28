<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

       <section>
    <div class="container my-5">
        <header class="mb-4">
            <h3>${category.name}</h3>
        </header>

        <div class="row">
            <c:forEach items="${listProduct}" var="product">
               <div class="col-lg-3 col-md-6 col-sm-6 d-flex">
                    <div class="card w-100 my-2 shadow-2-strong">
                        <!-- Product Image -->
                        <img src="./assets/Image/${product.image}" class="card-img-top" style="aspect-ratio: 1 / 1" />

                        <!-- Product Details -->
                        <div class="card-body d-flex flex-column">
                            <h5 class="card-title">${product.product_name}</h5>
                            <p class="card-text">$${product.price}</p>

                            <!-- Card Footer with Add to Cart and Favorite buttons -->
                            <div class="card-footer d-flex align-items-end pt-3 px-0 pb-0 mt-auto">
                                <a href="#!" class="btn btn-primary shadow-0 me-1">Add to cart</a>
                                <a href="#!" class="btn btn-light border px-2 pt-2 icon-hover">
                                    <i class="fas fa-heart fa-lg text-secondary px-1">
                                        <img src="./assets/icon/heart.png" width="25" height="25"/>
                                    </i>
                                </a>
                            </div>
                        </div>
                    </div>
                </div>

            </c:forEach>
        </div>
    </div>
</section>




