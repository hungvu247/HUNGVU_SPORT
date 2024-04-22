<%-- 
    Document   : single-product
    Created on : Jan 13, 2024, 1:07:33 AM
    Author     : HUNG VU
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html class="no-js" lang="zxx">
    <head>
        <meta charset="utf-8">
        <meta http-equiv="x-ua-compatible" content="ie=edge">
        <title>Coron-single product</title>
        <meta name="description" content="">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <!-- Favicon -->
        <link rel="shortcut icon" type="image/x-icon" href="assets\img\favicon.png">

        <!-- all css here -->
        <link rel="stylesheet" href="assets\css\bootstrap.min.css">
        <link rel="stylesheet" href="assets\css\plugin.css">
        <link rel="stylesheet" href="assets\css\bundle.css">
        <link rel="stylesheet" href="assets\css\style.css">
        <link rel="stylesheet" href="assets\css\responsive.css">
        <script src="assets\js\vendor\modernizr-2.8.3.min.js"></script>
    </head>
    <body>
        <!-- Add your site or application content here -->

        <!--pos page start-->
        <div class="pos_page">
            <div class="container">
                <!--pos page inner-->
                <div class="pos_page_inner">  
                    <!--header area -->
                    <div class="header_area">
                        <!--header top--> 
                        <div class="header_top">
                            <div class="header_top">
                                <div class="row align-items-center">
                                    <div class="col-lg-6 col-md-6">
                                        <div class="switcher">
                                            <ul>
                                                <li class="languages"><a href="#"><img src="assets\img\logo\fontlogo.jpg" alt=""> English <i class="fa fa-angle-down"></i></a>
                                                    <ul class="dropdown_languages">
                                                        <li><a href="#"><img src="assets\img\logo\fontlogo.jpg" alt=""> English</a></li>
                                                        <li><a href="#"><img src="assets\img\logo\fontlogo2.jpg" alt=""> French </a></li>
                                                    </ul>   
                                                </li> 

                                                <li class="currency"><a href="#"> Currency : $ <i class="fa fa-angle-down"></i></a>
                                                    <ul class="dropdown_currency">
                                                        <li><a href="#"> Dollar (USD)</a></li>
                                                        <li><a href="#"> Euro (EUR)  </a></li>
                                                    </ul> 
                                                </li> 
                                            </ul>
                                        </div>
                                    </div>
                                    <div class="col-lg-6 col-md-6">
                                        <div class="header_links">
                                            <ul>
                                                <h3> Hello ${sessionScope.user.getFirstName()}</h3>
                                                <li><a href="wishlist.html" title="wishlist">My wishlist</a></li>
                                                <li><a href="myacount?user_id=${sessionScope.user.getId()}" title="My account">My account</a></li>
                                              <li><a href="show">My order</a></li>

                                                <c:if test="${sessionScope.user ==null}">

                                                    <li>
                                                        <a  style="color:blue;margin-right: 20px;" href="login.jsp">Login</a>

                                                    </li>    
                                                </c:if>
                                                <c:if test="${sessionScope.user !=null}">
                                                    <li>
                                                        <a  style="color:blue;margin-right: 20px" href="logout">Logout</a>

                                                    </li>  
                                                </c:if>

                                            </ul>
                                        </div>   
                                    </div>
                                </div> 
                            </div> 
                        </div> 
                        <!--header top end-->

                        <!--header middel--> 
                        <div class="header_middel">
                            <div class="row align-items-center">
                                <div class="col-lg-3 col-md-3">
                                    <div class="logo">
                                        <a href="menu"><img src="img\logo.jpg" alt=""></a>
                                    </div>
                                </div>
                                <div class="col-lg-9 col-md-9">
                                    <div class="header_right_info">
                                        <div class="search_bar">
                                            <form action="timkiem">
                                                <input placeholder="Search..." type="text" name="search">
                                                <button type="submit"><i class="fa fa-search"></i></button>
                                            </form>
                                        </div>
                                        <div class="shopping_cart">
                                            <i class="fa fa-shopping-cart"></i> ${size}-items<i class="fa fa-angle-down"></i>

                                            <!--mini cart-->
                                            <div class="mini_cart">
                                                <c:forEach items="${listCart}" var="u">
                                                    <div class="cart_item">
                                                        <div class="cart_img">
                                                            <img src="${u.getProduct().getImg()}" alt="">
                                                        </div>
                                                        <div class="cart_info">
                                                            <a href="#">${u.getProduct().getProduct_name()}</a>
                                                            <span class="cart_price">$ ${u.getPrice()}</span>
                                                            <span class="quantity">Qty: ${u.getQuantity()}</span>
                                                        </div>

                                                    </div>
                                                </c:forEach>
                                                <div class="cart_button">
                                                    <a href="show" style="background-color: greenyellow;color:white;border: none;cursor:pointer"> Check out</a>
                                                </div>
                                            </div>
                                            <div>


                                            </div>
                                            <!--mini cart end-->
                                        </div>



                                    </div>
                                </div>
                            </div>
                        </div>     
                        <!--header middel end-->      
                        <div class="header_bottom">

                            <div class="col-12">
                                <div class="main_menu_inner">
                                    <div class="main_menu d-none d-lg-block">
                                        <nav>
                                            <ul>
                                                <li class="active"><a href="menu" class="clik">Home</a> 

                                                </li>
                                                <li class="active"><a href="index.html" class="clik">Football</a> <div class="mega_menu jewelry">
                                                        <div class="mega_items jewelry" class="clik">
                                                            <ul>
                                                                <li><a href="category?ci=${id}" class="clik">Football shose</a></li>
                                                                <li><a href="index-2.html" class="clik">Soccer ball</a></li>
                                                            </ul>
                                                        </div>
                                                    </div> </li>
                                                <li class="active"><a href="index.html" class="clik">Volleyball</a>
                                                    <div class="mega_menu jewelry">
                                                        <div class="mega_items jewelry">
                                                            <ul>
                                                                <li><a href="index.html" class="clik">Volleyball shose</a></li>
                                                                <li><a href="index-2.html" class="clik">Volleyball ball</a></li>
                                                            </ul>
                                                        </div>
                                                    </div> </li>
                                                <li class="active"><a href="index.html" class="clik">Badminton</a>
                                                    <div class="mega_menu jewelry" >
                                                        <div class="mega_items jewelry">
                                                            <ul>
                                                                <li><a href="index.html" class="clik">Badminton shose</a></li>
                                                                <li><a href="index-2.html"class="clik">Badminton racket</a></li>
                                                            </ul>
                                                        </div>
                                                    </div> </li>

                                                <li class="active"><a href="#" class="clik">Permission</a>
                                                    <div class="mega_menu jewelry" >
                                                        <div class="mega_items jewelry">
                                                            <ul>
                                                                <c:if test="${ sessionScope.user.getRole() == 'Admin'}">
                                                                    <li><a href="statistic" class="clik">Admin page</a></li>
                                                                    </c:if>

                                                                <c:if test="${sessionScope.user.getRole() == 'customer' || sessionScope.user.getRole() == 'admin'}">
                                                                    <li><a href="index.html" class="clik">Update information</a></li>
                                                                    </c:if>


                                                            </ul>
                                                        </div>
                                                    </div> </li>
                                            </ul>
                                        </nav>
                                    </div>

                                </div>

                            </div>
                        </div>
                        <!--header end -->               


                        <!--product wrapper start-->
                        <c:set value="${product}" var="p1" />

                        <div class="product_details">
                            <div class="row">
                                <div class="col-lg-5 col-md-6">
                                    <div class="product_tab fix">
                                        <div class="tab-content produc_tab_c">
                                            <div class="tab-pane fade show active" id="p_tab1" role="tabpanel">
                                                <div class="modal_img">
                                                    <a href="#"><img src="${p1.getImg()}" alt=""></a>
                                                    <div class="img_icone">
                                                        <img src="assets\img\cart\span-new.png" alt="">
                                                    </div>
                                                    <div class="view_img">
                                                        <a class="large_view" href="${p1.getImg()}"><i class="fa fa-search-plus"></i></a>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                <div class="col-lg-7 col-md-6">
                                    <div class="product_d_right">
                                        <!-- Other product details -->
                                        <h1>${p1.getProduct_name()}</h1>
                                        <div class="product_ratting mb-10">
                                            <ul>
                                                <li><a href="#"><i class="fa fa-star"></i></a></li>
                                                <li><a href="#"><i class="fa fa-star"></i></a></li>
                                                <li><a href="#"><i class="fa fa-star"></i></a></li>
                                                <li><a href="#"><i class="fa fa-star"></i></a></li>
                                                <li><a href="#"><i class="fa fa-star"></i></a></li>
                                                <li><a href="#"> Write a review </a></li>
                                            </ul>
                                        </div> 
                                        <div class="product_desc">
                                            <p>${p1.getDescription()}</p>
                                        </div>
                                        <div class="content_price mb-15">
                                            <span>$${p1.getPrice()}</span>
                                            <span class="old-price">$130.00</span>
                                        </div>

                                        <div class="box_quantity mb-20">
                                            <form action="buy" method="post">
                                                <input hidden value="${p1.getProduct_id()}" name="pId">
                                                <label for="quantity">Quantity</label>
                                                <input id="quantity" name="quantity" min="1" max="${p1.getQuantity()}" type="number"required="">
                                                <button type="submit"><i class="fa fa-shopping-cart"></i> Add to Cart</button>
                                            </form>
                                            <a onclick="addToWishlist(${p1.getProduct_id()})"  title="Add to Wishlist"><i class="fa fa-heart" aria-hidden="true"></i></a>
                                        </div>


                                        <div class="product_stock mb-20">
                                            <p>${p1.getQuantity()} items</p>
                                            <span> In stock </span>
                                        </div>
                                        <div class="wishlist-share">
                                            <h4>Share on:</h4>
                                            <ul>
                                                <li><a href="#"><i class="fa fa-rss"></i></a></li>           
                                                <li><a href="#"><i class="fa fa-vimeo"></i></a></li>           
                                                <li><a href="#"><i class="fa fa-tumblr"></i></a></li>           
                                                <li><a href="#"><i class="fa fa-pinterest"></i></a></li>        
                                                <li><a href="#"><i class="fa fa-linkedin"></i></a></li>        
                                            </ul>      
                                        </div>               
                                    </div>
                                </div>
                            </div>
                        </div>

                        <!--product details end-->


                        <!--product info start-->
                        <div class="product_d_info">
                            <div class="row">
                                <div class="col-12">
                                    <div class="product_d_inner">   
                                        <div class="product_info_button">    
                                            <ul class="nav" role="tablist">
                                                <li>
                                                    <a class="active" data-toggle="tab" href="#info" role="tab" aria-controls="info" aria-selected="false">More info</a>
                                                </li>
                                                <li>
                                                    <a data-toggle="tab" href="#sheet" role="tab" aria-controls="sheet" aria-selected="false">Data sheet</a>
                                                </li>
                                                <li>
                                                    <a data-toggle="tab" href="#reviews" role="tab" aria-controls="reviews" aria-selected="false">Reviews</a>
                                                </li>
                                            </ul>
                                        </div>
                                        <div class="tab-content">
                                            <div class="tab-pane fade show active" id="info" role="tabpanel">
                                                <div class="product_info_content">
                                                    <p>Fashion has been creating well-designed collections since 2010. The brand offers feminine designs delivering stylish separates and statement dresses which have since evolved into a full ready-to-wear collection in which every item is a vital part of a woman's wardrobe. The result? Cool, easy, chic looks with youthful elegance and unmistakable signature style. All the beautiful pieces are made in Italy and manufactured with the greatest attention. Now Fashion extends to a range of accessories including shoes, hats, belts and more!</p>
                                                </div>    
                                            </div>

                                            <div class="tab-pane fade" id="sheet" role="tabpanel">
                                                <div class="product_d_table">
                                                    <form action="#">
                                                        <table>
                                                            <tbody>
                                                                <tr>
                                                                    <td class="first_child">Compositions</td>
                                                                    <td>Polyester</td>
                                                                </tr>
                                                                <tr>
                                                                    <td class="first_child">Styles</td>
                                                                    <td>Girly</td>
                                                                </tr>
                                                                <tr>
                                                                    <td class="first_child">Properties</td>
                                                                    <td>Short Dress</td>
                                                                </tr>
                                                            </tbody>
                                                        </table>
                                                    </form>
                                                </div>
                                                <div class="product_info_content">
                                                    <p>Fashion has been creating well-designed collections since 2010. The brand offers feminine designs delivering stylish separates and statement dresses which have since evolved into a full ready-to-wear collection in which every item is a vital part of a woman's wardrobe. The result? Cool, easy, chic looks with youthful elegance and unmistakable signature style. All the beautiful pieces are made in Italy and manufactured with the greatest attention. Now Fashion extends to a range of accessories including shoes, hats, belts and more!</p>
                                                </div>    
                                            </div>
                                            <div class="tab-pane fade" id="reviews" role="tabpanel">
                                                <div class="product_info_content">
                                                    <p>Fashion has been creating well-designed collections since 2010. The brand offers feminine designs delivering stylish separates and statement dresses which have since evolved into a full ready-to-wear collection in which every item is a vital part of a woman's wardrobe. The result? Cool, easy, chic looks with youthful elegance and unmistakable signature style. All the beautiful pieces are made in Italy and manufactured with the greatest attention. Now Fashion extends to a range of accessories including shoes, hats, belts and more!</p>
                                                </div>
                                                <div class="product_info_inner">
                                                    <div class="product_ratting mb-10">
                                                        <ul>
                                                            <li><a href="#"><i class="fa fa-star"></i></a></li>
                                                            <li><a href="#"><i class="fa fa-star"></i></a></li>
                                                            <li><a href="#"><i class="fa fa-star"></i></a></li>
                                                            <li><a href="#"><i class="fa fa-star"></i></a></li>
                                                            <li><a href="#"><i class="fa fa-star"></i></a></li>
                                                        </ul>
                                                        <strong>Posthemes</strong> 
                                                        <p>09/07/2018</p>
                                                    </div>





                                                    <c:forEach items="${listReview}" var="list">
                                                        <br> <div class="product_demo">  
                                                            <strong>   <c:forEach items="${listAllUser}" var="user">
                                                                    <c:if test="${list.getCustomer_id() == user.getId()}">
                                                                        <td>${user.getUsername()}</td>
                                                                    </c:if>
                                                                </c:forEach>
                                                            </strong>
                                                            <p>${list.getComment()}</p>
                                                        </div>
                                                    </c:forEach>


                                                </div> 











                                                <div class="product_review_form">
                                                    <form action="addreview" method="get">
                                                        <h2>Add a review </h2>

                                                        <input name="product_id" value="${p1.getProduct_id()}">
                                                        <div class="row">
                                                            <div class="col-12">
                                                                <label for="review_comment">Your review </label>
                                                                <textarea name="comment" id="review_comment"></textarea>
                                                            </div> 

                                                        </div>
                                                        <button type="submit">Submit</button>
                                                    </form>   
                                                </div>     
                                            </div>
                                        </div>
                                    </div>     
                                </div>
                            </div>
                        </div>  
                        <!--product info end-->


                        <!--new product area start-->
                        <div class="new_product_area product_page">
                            <div class="row">
                                <div class="col-12">
                                    <div class="block_title">
                                        <h3>  11 other products category:</h3>
                                    </div>
                                </div> 
                            </div>
                            <div class="row">
                                <div class="single_p_active owl-carousel">

                                    <c:forEach items="${list11random}" var="p">
                                        <div class="col-lg-3">
                                            <div  class="single_product" style="width: 100%;">
                                                <div class="product_thumb">
                                                    <a style="width: 200px" href="singleproduct?productId=${p.getProduct_id()}"><img style="width:100%" src="${p.getImg()}" alt=""></a>
                                                    <div class="img_icone">
                                                        <img src="assets/img/cart/span-new.png" alt="">
                                                    </div>
                                                    <div class="product_action">
                                                        <a href="#"> <i class="fa fa-shopping-cart"></i> Add to cart</a>
                                                    </div>
                                                </div>
                                                <div class="product_content">
                                                    <span class="product_price">${p.getPrice()}$</span>
                                                    <h3 class="product_title"><a href="singleproduct?productId=${p.getProduct_id()}">${p.getProduct_name()}</a></h3>
                                                </div>
                                                <div class="product_info">
                                                    <ul>

                                                        <li><a href="#" title="Add to Wishlist">Add to Wishlist</a></li>
                                                        <li><a href="singleproduct?productId=${p.getProduct_id()}">View Detail</a></li>
                                                    </ul>
                                                </div>
                                            </div>

                                        </div>
                                    </c:forEach>



                                </div> 
                            </div>      
                        </div> 
                        <div class="new_product_area product_page">
                            <div class="row">
                                <div class="col-12">
                                    <div class="block_title">
                                        <h3>    Related Products</h3>
                                    </div>
                                </div> 
                            </div>
                            <div class="row">
                                <div class="single_p_active owl-carousel">
                                    <c:forEach items="${list11random2}" var="a">
                                        <div class="col-lg-3">
                                            <div  class="single_product" style="width: 100%;">
                                                <div class="product_thumb">
                                                    <a style="width: 200px" href="singleproduct?productId=${a.getProduct_id()}"><img style="width:100%" src="${a.getImg()}" alt=""></a>
                                                    <div class="img_icone">
                                                        <img src="assets/img/cart/span-new.png" alt="">
                                                    </div>
                                                    <div class="product_action">
                                                        <a href="#"> <i class="fa fa-shopping-cart"></i> Add to cart</a>
                                                    </div>
                                                </div>
                                                <div class="product_content">
                                                    <span class="product_price">${a.getPrice()}$</span>
                                                    <h3 class="product_title"><a href="singleproduct?productId=${a.getProduct_id()}">${a.getProduct_name()}</a></h3>
                                                </div>
                                                <div class="product_info">
                                                    <ul>

                                                        <li><a href="#" title="Add to Wishlist">Add to Wishlist</a></li>
                                                        <li><a href="singleproduct?productId=${a.getProduct_id()}">View Detail</a></li>
                                                    </ul>
                                                </div>
                                            </div>

                                        </div>
                                    </c:forEach>

                                </div> 
                            </div>      
                        </div> 

                    </div>
                    <!--pos page inner end-->
                </div>
            </div>


            <!-- all js here -->
            <script>
                function mycart() {
                    // Tạo một đối tượng XMLHttpRequest
                    var xhttp = new XMLHttpRequest();
                    // Xác định phương thức và URL của request
                    var method = "GET";
                    var url = "mycart"; // Đặt URL của servlet tại đây

                    // Mở kết nối với servlet
                    xhttp.open(method, url, true);
                    // Xác định hành động khi request hoàn thành
                    xhttp.onreadystatechange = function () {
                        // Kiểm tra trạng thái và readyState của request
                        if (this.readyState == 4 && this.status == 200) {
                            // Điều hướng đến trang "mycart" sau khi request thành công
                            window.location.href = "mycart"; // Đặt URL của trang mycart tại đây
                        }
                    };
                    // Gửi request đến servlet
                    xhttp.send();
                }
                function addToWishlist(pid) {
                    // Tạo một biểu mẫu (form) ẩn
                    var form = document.createElement('form');

                    // Thiết lập các thuộc tính của biểu mẫu
                    form.method = 'POST';
                    form.action = 'mywishlist'; // Đặt URL của trang mong muốn của bạn

                    // Tạo trường input ẩn để lưu trữ product_id
                    var productIdInput = document.createElement('input');
                    productIdInput.type = 'hidden';
                    productIdInput.name = 'product_id'; // Đặt tên cho trường này
                    productIdInput.value = pid; // Thiết lập giá trị của product_id

                    // Thêm trường input vào biểu mẫu
                    form.appendChild(productIdInput);

                    // Thêm biểu mẫu vào body của tài liệu
                    document.body.appendChild(form);

                    // Gửi biểu mẫu
                    form.submit();
                }</script>
            <script src="assets\js\vendor\jquery-1.12.0.min.js"></script>
            <script src="assets\js\popper.js"></script>
            <script src="assets\js\bootstrap.min.js"></script>
            <script src="assets\js\ajax-mail.js"></script>
            <script src="assets\js\plugins.js"></script>
            <script src="assets\js\main.js"></script>
    </body>
</html>

