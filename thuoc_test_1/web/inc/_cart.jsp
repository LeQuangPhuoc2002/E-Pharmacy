<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<section class="h-100 h-custom" style="background-color: #eee;">
    <div class="container py-5 h-100">
        <div class="row d-flex justify-content-center align-items-center h-100">
            <div class="col">
                <div class="card">
                    <div class="card-body p-4">

                        <div class="row">

                            <div class="col-lg-7">
                                <h5 class="mb-3"><a href="./home" class="text-body"><i
                                            class="fas fa-long-arrow-alt-left me-2"></i>Continue shopping</a>
                                    <a href="./cart?clear=OK" class="text-body"><i
                                            class="fas fa-long-arrow-alt-left me-2"></i>Empty cart</a></h5>
                                <hr>

                                <div class="d-flex justify-content-between align-items-center mb-4">
                                    <div>
                                        <p class="mb-1">Shopping cart</p>
                                        <p class="mb-0">You have ${empty cart ? 0 : cart.size()} items in your cart</p>
                                    </div>

                                    <div>
                                        <p class="mb-0"><span class="text-muted">Sort by:</span> <a href="#!"
                                                                                                    class="text-body">price <i
                                                    class="fas fa-angle-down mt-1"></i></a></p>
                                    </div>
                                </div>
                                <c:set var="totalPrice" value="0" />
                                <c:set var="vatRate" value="0.1" />
                                <c:forEach items="${cart}" var="product">
                                    <div class="card mb-3">
                                        <div class="card-body">
                                            <div class="d-flex justify-content-between">
                                                <div class="d-flex flex-row align-items-center">
                                                    <div>
                                                        <img src="./assets/images/${product.image}" class="img-fluid rounded-3" alt="Shopping item" style="width: 65px;">
                                                    </div>
                                                    <div class="ms-3">
                                                        <h5>${product.name}</h5>
                                                    </div>
                                                </div>
                                                <div class="d-flex flex-row align-items-center">
                                                    <form action="cart" method="post" style="width: 220px;">
                                                        <div style="float:left; width: 25%;">
                                                            <h5 class="mb-0">
                                                                <input type="hidden" name="id_product" value="${product.id}">
                                                                <input type"text" name="quantity" walme="$(product.quantity}" style="width: 30px; text-align: right;" value="${product.quantity}">                                                       
                                                            </h5>
                                                        </div>
                                                        <div style="float:left; width: 40%; ">
                                                            <h5 class="mb-0">$${product.price}</h5>
                                                        </div>
                                                        <div style="float:left; width: 35%;">
                                                            <h5 class="mb-0">
                                                                <button type="submit" name="action" value="update">
                                                                    <img src="./assets/icon/update.png" width="16" height="16" />
                                                                </button>
                                                                <button type="submit" name="action" value="delete">
                                                                    <img src="./assets/icon/delete.png" width="16" height="16" />
                                                                </button>
                                                            </h5>
                                                        </div>
                                                    </form>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                    <a href="#!" style="color: #cecece;"><i class="fas fa-trash-alt"></i></a>  
                                        <c:set var="itemTotal" value="${product.price * product.quantity}" />
                                        <c:set var="totalPrice" value="${totalPrice + itemTotal}" />
                                    </c:forEach>


                            </div>
                            <div class="col-lg-5">

                                <div class="card bg-primary text-white rounded-3">
                                    <div class="card-body">
                                        <div class="d-flex justify-content-between align-items-center mb-4">
                                            <h5 class="mb-0">Card details</h5>
                                            <img src="https://mdbcdn.b-cdn.net/img/Photos/Avatars/avatar-6.webp"
                                                 class="img-fluid rounded-3" style="width: 45px;" alt="Avatar">
                                        </div>

                                        <p class="small mb-2">Card type</p>
                                        <a class="navbar-brand" href="#">
                                            <img src="./assets/icon/logo_1.png" width="50" height="50"/>
                                        </a>
                                        <a class="navbar-brand" href="#">
                                            <img src="./assets/icon/unnamed.png" width="50" height="50"/>
                                        </a>
                                        <a class="navbar-brand" href="#">
                                            <img src="./assets/icon/321.png" width="50" height="50"/>
                                        </a>
                                        <a class="navbar-brand" href="#">
                                            <img src="./assets/icon/unnamed (1).png" width="50" height="50"/>
                                        </a>
                                        <a href="#!" type="submit" class="text-white"><i
                                                class="fab fa-cc-mastercard fa-2x me-2"></i></a>
                                        <a href="#!" type="submit" class="text-white"><i
                                                class="fab fa-cc-visa fa-2x me-2"></i></a>
                                        <a href="#!" type="submit" class="text-white"><i
                                                class="fab fa-cc-amex fa-2x me-2"></i></a>
                                        <a href="#!" type="submit" class="text-white"><i class="fab fa-cc-paypal fa-2x"></i></a>

                                        <form class="mt-4">
                                            <div class="form-outline form-white mb-4">
                                                <input type="text" id="typeName" class="form-control form-control-lg" siez="17"
                                                       placeholder="Cardholder's Name" />
                                                <label class="form-label" for="typeName">Cardholder's Name</label>
                                            </div>

                                            <div class="form-outline form-white mb-4">
                                                <input type="text" id="typeText" class="form-control form-control-lg" siez="17"
                                                       placeholder="1234 5678 9012 3457" minlength="19" maxlength="19" />
                                                <label class="form-label" for="typeText">Card Number</label>
                                            </div>

                                            <div class="row mb-4">
                                                <div class="col-md-6">
                                                    <div class="form-outline form-white">
                                                        <input type="text" id="typeExp" class="form-control form-control-lg"
                                                               placeholder="MM/YYYY" size="7" id="exp" minlength="7" maxlength="7" />
                                                        <label class="form-label" for="typeExp">Expiration</label>
                                                    </div>
                                                </div>
                                                <div class="col-md-6">
                                                    <div class="form-outline form-white">
                                                        <input type="password" id="typeText" class="form-control form-control-lg"
                                                               placeholder="&#9679;&#9679;&#9679;" size="1" minlength="3" maxlength="3" />
                                                        <label class="form-label" for="typeText">Cvv</label>
                                                    </div>
                                                </div>
                                            </div>
                                            <c:set var="vat" value="${totalPrice * vatRate}" />
                                            <c:set var="totalWithVat" value="${totalPrice + vat}" />

                                        </form>

                                        <hr class="my-4">

                                        <div class="d-flex justify-content-between">
                                            <p class="mb-2">Subtotal</p>
                                            <p class="mb-2">$${totalPrice}</p>
                                        </div>

                                        <div class="d-flex justify-content-between">
                                            <p class="mb-2">VAT</p>
                                            <p class="mb-2">$${vat}</p>
                                        </div>

                                        <div class="d-flex justify-content-between mb-4">
                                            <p class="mb-2">Total(Incl. taxes)</p>
                                            <p class="mb-2">$${totalWithVat}</p>
                                        </div>

                                        <button type="button" class="btn btn-info btn-block btn-lg">
                                            <div class="d-flex justify-content-between">                                       
                                                <span>Checkout <i class="fas fa-long-arrow-alt-right ms-2"></i></span>
                                                <span>$${totalWithVat}</span>
                                            </div>
                                        </button>

                                    </div>
                                </div>

                            </div>

                        </div>

                    </div>
                </div>
            </div>
        </div>
    </div>
</section>
