e<%-- 
    Document   : Menu
    Created on : Jan 8, 2024, 1:59:34 PM
    Author     : HUNG VU
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@page import="java.util.ArrayList"%>

<!DOCTYPE html>
<html class="no-js" lang="zxx">
    <head>
        <meta charset="utf-8">
        <meta http-equiv="x-ua-compatible" content="ie=edge">
        <title>Hung Vu Sport</title>
        <meta name="description" content="">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <!-- Favicon -->
        <link rel="shortcut icon" type="image/x-icon" href="assets\img\favicon.png">

        <!-- all css here -->
        <link rel="stylesheet" href="assets\css\bootstrap.min.css">
        <link rel="stylesheet" href="assets\css\plugin.css">
        <link rel="stylesheet" href="assets\css\bundle.css">
        <link rel="stylesheet" href="assets\css\style.css">
        <script src="assets\js\vendor\modernizr-2.8.3.min.js"></script>
        <style> .block_tags button {
                background-color: gray;
                color: #fff;
                padding: 5px 10px;
                border: none;
                cursor: pointer;
            }

            .block_tags button:hover {
                background-color: #2980b9;
            }
            .pageIndex{

                color: white;
                font-weight: bold;
                border: 1px solid greenyellow;
                background-color: green;
            }
            .mb-4 h6.font-weight-bold {
                color: #333; /* Màu chữ */
                font-size: 1.2rem; /* Kích thước chữ */
                margin-bottom: 1rem; /* Khoảng cách dưới */
            }
            .mb-3 .form-check {
                margin-bottom: 1rem; /* Khoảng cách dưới */
            }
            input[type="number"] {
                width: 80px; /* Độ rộng */
                padding: 0.375rem 0.75rem; /* Kích thước padding */
                border-radius: 0.25rem; /* Độ cong viền */
                border: 1px solid #ccc; /* Viền */
            }
            #priceMin,
            #priceMax {
                width: 100px; /* Độ rộng */
            }
            label[for="priceMin"],
            label[for="priceMax"] {
                color: #666; /* Màu chữ */
                font-size: 0.9rem; /* Kích thước chữ */
            }
            input[type="text"]:focus {
                border-color: #007bff; /* Màu viền khi focus */
                box-shadow: 0 0 0 0.2rem rgba(0, 123, 255, 0.25); /* Hiệu ứng shadow khi focus */
            }
            input[type="radio"] {
                margin-right: 0.5rem; /* Khoảng cách với label */
            }

            .form-check-label {
                color: #666; /* Màu chữ */
                font-size: 0.9rem; /* Kích thước chữ */
            }
            .active{
                color:white
            }

        </style>

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
                                            <li><a href="myacount?user_id=${sessionScope.user.getId()}" title="My account">My account</a></li>
                                            <li><a href="show">My order</a></li>

                                            <c:if test="${sessionScope.user ==null}">

                                                <li>
                                                    <a  style="color:blue;margin-right: 20px;" href="login">Login</a>

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
                        <!--header top--> 
                        <div class="header_top">
                            <div class="row align-items-center">
                                <div class="col-lg-6 col-md-6">

                                </div>

                            </div> 
                        </div> 
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
                                            <form action="timkiem?index=1" method="post">
                                                <input placeholder="Search..." type="text" name="search" required="">
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
                                                <li class="active"> <a onclick="loadCate('football')"style="cursor: pointer">Football</a>
                                                </li>
                                                <li class="active">   <a onclick="loadCate('volleyball')"style="cursor: pointer">Volleyball</a>
                                                </li>
                                                <li class="active"> <a onclick="loadCate('Badminton')"style="cursor: pointer">Badminton</a>
                                                </li>
                                                <li class="active"> <a onclick="loadCate('tabletennis')"style="cursor: pointer">Table tennis</a>
                                                </li>
                                                <li class="active"><a href="#" class="clik">Permission</a>
                                                    <div class="mega_menu jewelry" >
                                                        <div class="mega_items jewelry">
                                                            <ul>


                                                                <li><a href="updateuser?user_id=${sessionScope.user.getId()}" class="clik">Update information</a></li>


                                                                <li><a href="changepassword" class="clik">Change password</a></li>

                                                                <c:if test="${ sessionScope.user.getRole() == 'admin'}">
                                                                    <li><a href="statistic" class="clik">Admin page</a></li>
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
                    </div>


                    <!--pos home section-->
                    <div class=" pos_home_section shop_section shop_fullwidth">
                        <div class="row">
                            <div class="col-12">
                                <!--banner slider start-->
                                <div class="banner_slider slider_1">
                                    <div class="slider_active owl-carousel">
                                        <div class="single_slider" style="background-image: url(img/banner2.jpg) ;width:100%">
                                            <div class="slider_content">
                                                <div class="slider_content_inner">  
                                                    <h1>Product hot</h1>
                                                    <p>Make by japan</p>
                                                    <a href="#">shop now</a>
                                                </div>     
                                            </div>    
                                        </div>
                                        <div class="single_slider" style="background-image:url(img/banner3.jpg);width:100%">
                                            <div class="slider_content">
                                                <div class="slider_content_inner">  
                                                    <h1>New Product</h1>
                                                    <p>Lorem ipsum dolor sit amet, consectetur adipisicing elit. </p>
                                                    <a href="#">shop now</a>
                                                </div>         
                                            </div>         
                                        </div>
                                        <div class="single_slider" style="background-image: url(img/banner1.jpg);width:100%">
                                            <div class="slider_content">  
                                                <div class="slider_content_inner">  
                                                    <h1>Best Product</h1>
                                                    <p>Lorem ipsum dolor sit amet, consectetur adipisicing elit. </p>
                                                    <a href="#">shop now</a>
                                                </div> 
                                            </div> 
                                        </div>
                                    </div>
                                </div>  
                                <!--banner slider start-->
                            </div>
                        </div>       
                        <div class="row">
                            <div class="col-12">
                                <!--shop toolbar start-->
                                <div class="shop_toolbar mb-35">
                                    <div class="list_button">
                                        <ul class="nav" role="tablist">
                                            <li>
                                                <a class="active" data-toggle="tab" href="#large" role="tab" aria-controls="large" aria-selected="true"><i class="fa fa-th-large"></i></a>
                                            </li>
                                            <li>
                                                <a data-toggle="tab" href="#list" role="tab" aria-controls="list" aria-selected="false"><i class="fa fa-th-list"></i></a>
                                            </li>
                                        </ul>
                                    </div>
                                    <div class="page_amount">
                                        <p>Showing </p>
                                    </div>
                                    <div class="select_option">

                                        <label>Sort By</label>

                                        <select name="getproductbyselect" id="short" onchange="handleChange()">
                                            <option selected="" value="All">All</option>
                                            <option value="Lowest">Price: Lowest</option>
                                            <option value="Highest">Price: Highest</option>
                                            <option value="A-Z">Character A-Z</option>
                                            <option value="Z-A">Character Z-A</option>
                                        </select>




                                    </div>
                                </div>
                                <!--shop toolbar end-->
                            </div>
                        </div>        

                        <!--shop tab product-->
                        <div class="shop_tab_product shop_fullwidth">   
                            <div class="tab-content" id="myTabContent">
                                <div class="row pos_home">
                                    <div class="col-lg-3 col-md-8 col-12">
                                        <!--sidebar banner-->
                                        <div style="color:Red ;font-style: inherit;text-align: center;font-size:20px">Special shose</div>
                                        <div class="sidebar_widget banner mb-35">
                                            <div class="banner_img mb-35"style="width: 250px;">
                                                <a href="#" ><img style="width: 100%;"src="img\new1.jpg" alt=""></a>
                                            </div>
                                            <div class="banner_img"style="width: 250px;">
                                                <a href="#"><img  style="width: 100%;" src="img\new2.jpg" alt=""></a>
                                            </div>
                                        </div>
                                        <!--sidebar banner end-->

                                        <!--categorie menu start-->
                                        <div class="sidebar_widget catrgorie mb-35">

                                            <ul>

                                                <li class="has-sub"><a href="#"><i class="fa fa-caret-right"></i> <h3>Categories</h3></a>
                                                    <ul class="categorie_sub">
                                                        <c:forEach items="${listCate}" var="cate">

                                                            <li>
                                                                <a onclick="load(${cate.getId()})"style="cursor: pointer">${cate.getName()}</a>


                                                            </li>
                                                        </c:forEach>
                                                    </ul> 

                                                    </div>
                                                    <!--categorie menu end-->
                                                    <div></div>
                                         

                                                    <!--popular tags area-->
                                                    <div class="sidebar_widget tags mb-35">
                                                        <div class="block_title">
                                                            <h3>popular tags</h3>
                                                        </div>
                                                        <div class="block_tags">
                                                            <a onclick="searchByPorpularTag('ball')"style="cursor: pointer">ball</a>
                                                            <a onclick="searchByPorpularTag('shose')"style="cursor: pointer">shose</a>
                                                            <a onclick="searchByPorpularTag('wave')"style="cursor: pointer">wave</a>
                                                            <a onclick="searchByPorpularTag('in')"style="cursor: pointer">in</a>

                                                        </div>

                                                    </div>
                                                    <section class="mb-4">

                                                        <h6 class="font-weight-bold mb-3">Price</h6>

                                                        <div class="form-check pl-0 mb-3">
                                                            <input onchange="searchByPriceUnder200()" type="radio" class="form-check-input" id="under200" name="materialExampleRadios" style="width: 20px;">
                                                            <label class="form-check-label small text-uppercase card-link-secondary" for="under100">Under
                                                                $200</label>
                                                        </div>
                                                        <div class="form-check pl-0 mb-3">
                                                            <input onchange="searchByPrice200To500()" type="radio" class="form-check-input" id="200500" name="materialExampleRadios" style="width: 20px;">
                                                            <label class="form-check-label small text-uppercase card-link-secondary" for="200500">$200 to
                                                                $500</label>
                                                        </div>
                                                        <div class="form-check pl-0 mb-3">
                                                            <input onchange="searchByPriceAbove500()" type="radio" class="form-check-input" id="500above" name="materialExampleRadios" style="width: 20px;">
                                                            <label class="form-check-label small text-uppercase card-link-secondary" for="200above">$500 &
                                                                Above</label>
                                                        </div>
                                                        <form>
                                                            <div class="d-flex align-items-center mt-4 pb-1">
                                                                <div class="md-form md-outline my-0">
                                                                    <input oninput="searchByPriceMinToMax()" id="priceMin" type="text" class="form-control mb-0">
                                                                    <label for="priceMin">$ Min</label>
                                                                </div>
                                                                <p class="px-2 mb-0 text-muted"> - </p>
                                                                <div class="md-form md-outline my-0">
                                                                    <input oninput="searchByPriceMinToMax()" id="priceMax" type="text" class="form-control mb-0">
                                                                    <label for="priceMax">$ Max</label>
                                                                </div>
                                                            </div>
                                                        </form>

                                                    </section>
                                                    <!--newsletter block start-->
                                                    <div class="sidebar_widget newsletter mb-35">
                                                        <div class="block_title">
                                                            <h3>newsletter</h3>
                                                        </div> 
                                                        <form action="#">
                                                            <p>Sign up for your newsletter</p>
                                                            <input placeholder="Your email address" type="text">
                                                            <button type="submit">Subscribe</button>
                                                        </form>   
                                                    </div>




                                                    </div>
                                                    <div class="col-lg-9 col-md-12">
                                                        <div class="tab-pane fade show active" id="large" role="tabpanel">
                                                            <div class="row" id="lisrproduct">
                                                                <c:forEach items="${listP}" var="p">
                                                                    <div class="col-lg-3 col-md-4 col-sm-6">
                                                                        <div  class="single_product" style="width: 100%;">
                                                                            <div class="product_thumb">
                                                                                <a style="width: 200px" href="singleproduct?productId=${p.getProduct_id()}"><img style="width:280px;height: 250px;" src="${p.getImg()}" alt=""></a>
                                                                                <div class="img_icone">
                                                                                    <img src="assets/img/cart/span-new.png" alt="">
                                                                                </div>
                                                                                <div class="product_action">
                                                                                    <a href="singleproduct?productId=${p.getProduct_id()}"style="cursor:pointer"> <i class="fa fa-shopping-cart"></i> Add to cart</a>
                                                                                </div>
                                                                            </div>
                                                                            <div class="product_content">
                                                                                <span class="product_price">${p.getPrice()}$</span>
                                                                                <h3 class="product_title"><a href="singleproduct?productId=${p.getProduct_id()}">${p.getProduct_name()}</a></h3>
                                                                            </div>
                                                                            <div class="product_info">
                                                                                <ul>

                                                                                    <li><a onclick="addToWishlist(${p.getProduct_id()})" title="Add to Wishlist" style="cursor:pointer">Add to Wishlist</a></li>


                                                                                </ul>
                                                                            </div>
                                                                        </div>

                                                                    </div>
                                                                </c:forEach>

                                                            </div>  
                                                        </div>

                                                    </div>
                                                    </div>
                                                    </div>
                                                    </div>    
                                                    <!--shop tab product end-->

                                                    <!--pagination style start--> 
                                                    <div class="pagination_style shop_page">                        
                                                        <div class="page_number">
                                                            <span style="font-size: 20px">Pages: </span>
                                                            <c:if test="${tag > 1}">
                                                                <a href="menu?index=${tag - 1}" style="padding-left: 10px; font-size: 20px">Previous</a>
                                                            </c:if>

                                                            <c:forEach begin="1" end="${endP}" var="i">
                                                                <a class="${tag == i ? 'pageIndex' : ''}" href="menu?index=${i}" style="margin-left: 5px; font-size: 20px">${i}</a>
                                                            </c:forEach>

                                                            <c:if test="${tag < endP}">
                                                                <a href="menu?index=${tag + 1}" style="padding-left: 10px; font-size: 20px">Next</a>
                                                            </c:if>


                                                        </div>

                                                    </div>

                                                    </div>
                                                    <!--pos home section end-->
                                                    </div>
                                                    <!--pos page inner end-->
                                                    <div class="footer_area">
                                                        <div class="footer_top">
                                                            <div class="container">
                                                                <div class="row">
                                                                    <div class="col-lg-3 col-md-6 col-sm-6">
                                                                        <div class="footer_widget">
                                                                            <h3>Hung Vu Sport</h3>
                                                                            <p>GREASTEST OF ALL TIME</p>
                                                                            <div class="footer_widget_contect">
                                                                                <p><i class="fa fa-map-marker" aria-hidden="true"></i>  37 KHOI 2 - THI TRAN -DIEN CHAU -NGHE AN </p>

                                                                                <p><i class="fa fa-mobile" aria-hidden="true"></i> (012) 234 432 3568</p>
                                                                                <a href="#"><i class="fa fa-envelope-o" aria-hidden="true"></i> Vuquanghung240703@gmail.com </a>
                                                                            </div>
                                                                        </div>
                                                                    </div>
                                                                    <div class="col-lg-3 col-md-6 col-sm-6">
                                                                        <div class="footer_widget">
                                                                            <h3>My Account</h3>
                                                                            <ul>
                                                                                <li><a href="#">Your Account</a></li>
                                                                                <li><a href="#">My orders</a></li>
                                                                                <li><a href="#">My credit slips</a></li>
                                                                                <li><a href="#">My addresses</a></li>
                                                                                <li><a href="#">Login</a></li>
                                                                            </ul>
                                                                        </div>
                                                                    </div>
                                                                    <div class="col-lg-3 col-md-6 col-sm-6">
                                                                        <div class="footer_widget">
                                                                            <h3>Informations</h3>
                                                                            <ul>
                                                                                <li><a href="#">Specials</a></li>
                                                                                <li><a href="#">Our store(s)!</a></li>
                                                                                <li><a href="#">My credit slips</a></li>
                                                                                <li><a href="#">Terms and conditions</a></li>
                                                                                <li><a href="#">About us</a></li>
                                                                            </ul>
                                                                        </div>
                                                                    </div>

                                                                </div>
                                                            </div>
                                                        </div>
                                                        <div class="footer_bottom">
                                                            <div class="container">
                                                                <div class="row align-items-center">
                                                                    <div class="col-lg-6 col-md-6">
                                                                        <p>Copyright &copy; 2018 <a href="#">Pos Coron</a>. All rights reserved. </p>

                                                                    </div>
                                                                    <div class="col-lg-6 col-md-6">
                                                                        <div class="footer_social text-right">
                                                                            <ul>
                                                                                <li><a href="#"><i class="fa fa-facebook"></i></a></li>
                                                                                <li><a href="#"><i class="fa fa-twitter"></i></a></li>
                                                                                <li><a href="#"><i class="fa fa-google-plus" aria-hidden="true"></i></a></li>
                                                                                <li><a class="pinterest" href="#"><i class="fa fa-pinterest-p" aria-hidden="true"></i></a></li>

                                                                                <li><a href="#"><i class="fa fa-wifi" aria-hidden="true"></i></a></li>
                                                                            </ul>
                                                                        </div>
                                                                    </div>
                                                                </div>
                                                            </div>
                                                        </div>
                                                    </div>
                                                    </div>
                                                    </div>
                                                    <!--pos page end-->

                                                    <!-- all js here -->
                                                    <script>
                                                        function deleteCart(id) {

                                                        }
                                                        function handleChange() {
                                                            var select = document.getElementById("short").value;
                                                            $.ajax({
                                                                url: "/hungvusport/getproductbyselect",
                                                                type: "post",
                                                                data: {
                                                                    selected: select // Pass the selected value
                                                                },
                                                                success: function (responseData) {
                                                                    document.getElementById("lisrproduct").innerHTML = responseData;
                                                                }
                                                            });
                                                        }
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


                                                        function load(cateid) {
                                                            $.ajax({
                                                                url: "/hungvusport/controlCate",
                                                                type: "post",
                                                                data: {
                                                                    cid: cateid
                                                                },
                                                                success: function (responseData) {
                                                                    document.getElementById("lisrproduct").innerHTML = responseData;
                                                                }
                                                            });
                                                        }
                                                        function loadCate(cateName1) {
                                                            $.ajax({
                                                                url: "/hungvusport/searchbycate",
                                                                type: "post",
                                                                data: {
                                                                    cateName: cateName1
                                                                },
                                                                success: function (responseData) {
                                                                    document.getElementById("lisrproduct").innerHTML = responseData;
                                                                }
                                                            });
                                                        }
                                                        function searchByPorpularTag(tagName) {
                                                            $.ajax({
                                                                url: "/hungvusport/searchtag",
                                                                type: "post",
                                                                data: {
                                                                    tag: tagName
                                                                },
                                                                success: function (responseData) {
                                                                    document.getElementById("lisrproduct").innerHTML = responseData;
                                                                }
                                                            });
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
                                                        }

                                                        function searchByPriceMinToMax() {
                                                            var numMin = document.getElementById("priceMin").value;
                                                            var numMax = document.getElementById("priceMax").value;
                                                            $.ajax({
                                                                url: "/hungvusport/searchAjaxPriceMinToMax",
                                                                type: "get", //send it through get method
                                                                data: {
                                                                    priceMin: numMin,
                                                                    priceMax: numMax
                                                                },
                                                                success: function (data) {
                                                                    var row = document.getElementById("lisrproduct");
                                                                    row.innerHTML = data;
                                                                },
                                                                error: function (xhr) {
                                                                    //Do Something to handle error
                                                                }
                                                            });
                                                        }
                                                        function searchByPriceUnder200() {
                                                            $.ajax({
                                                                url: "/hungvusport/searchAjaxPriceUnder200Shop",
                                                                type: "get", //send it through get method
                                                                data: {

                                                                },
                                                                success: function (data) {
                                                                    var row = document.getElementById("lisrproduct");
                                                                    row.innerHTML = data;
                                                                },
                                                                error: function (xhr) {
                                                                    //Do Something to handle error
                                                                }
                                                            });
                                                        }
                                                        function searchByPrice200To500() {
                                                            $.ajax({
                                                                url: "/hungvusport/searchAjaxPrice200To500Shop",
                                                                type: "get", //send it through get method
                                                                data: {

                                                                },
                                                                success: function (data) {
                                                                    var row = document.getElementById("lisrproduct");
                                                                    row.innerHTML = data;
                                                                },
                                                                error: function (xhr) {
                                                                    //Do Something to handle error
                                                                }
                                                            });
                                                        }
                                                        function searchByPriceAbove500() {
                                                            $.ajax({
                                                                url: "/hungvusport/searchAjaxPriceAbove500Shop",
                                                                type: "get", //send it through get method
                                                                data: {

                                                                },
                                                                success: function (data) {
                                                                    var row = document.getElementById("lisrproduct");
                                                                    row.innerHTML = data;
                                                                },
                                                                error: function (xhr) {
                                                                    //Do Something to handle error
                                                                }
                                                            });
                                                        }

                                                    </script>

                                                    <script src="assets\js\vendor\jquery-1.12.0.min.js"></script>
                                                    <script src="assets\js\popper.js"></script>
                                                    <script src="assets\js\bootstrap.min.js"></script>
                                                    <script src="assets\js\ajax-mail.js"></script>
                                                    <script src="assets\js\plugins.js"></script>
                                                    <script src="assets\js\main.js"></script>
                                                    </body>
                                                    </html>
