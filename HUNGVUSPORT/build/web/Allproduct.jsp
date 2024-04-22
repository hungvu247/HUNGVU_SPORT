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
                                            <li><a href="wishlist.html" title="wishlist">My wishlist</a></li>
                                            <li><a href="MyAcount.jsp" title="My account">My account</a></li>
                                            <li><a href="cart.html" title="My cart">My cart</a></li>

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
                                            <a href="#"><i class="fa fa-shopping-cart"></i> 2Items - $209.44 <i class="fa fa-angle-down"></i></a>

                                            <!--mini cart-->
                                            <div class="mini_cart">
                                                <div class="cart_item">
                                                    <div class="cart_img">
                                                        <a href="#"><img src="img\football1.jpg" alt=""></a>
                                                    </div>
                                                    <div class="cart_info">
                                                        <a href="#">lorem ipsum dolor</a>
                                                        <span class="cart_price">$115.00</span>
                                                        <span class="quantity">Qty: 1</span>
                                                    </div>
                                                    <div class="cart_remove">
                                                        <a title="Remove this item" href="#"><i class="fa fa-times-circle"></i></a>
                                                    </div>
                                                </div>
                                                <div class="cart_item">
                                                    <div class="cart_img">
                                                        <a href="#"><img src="img\football4.jpg" alt=""></a>
                                                    </div>
                                                    <div class="cart_info">
                                                        <a href="#">Quisque ornare dui</a>
                                                        <span class="cart_price">$105.00</span>
                                                        <span class="quantity">Qty: 1</span>
                                                    </div>
                                                    <div class="cart_remove">
                                                        <a title="Remove this item" href="#"><i class="fa fa-times-circle"></i></a>
                                                    </div>
                                                </div>
                                                <div class="shipping_price">
                                                    <span> Shipping </span>
                                                    <span>  $7.00  </span>
                                                </div>
                                                <div class="total_price">
                                                    <span> total </span>
                                                    <span class="prices">  $227.00  </span>
                                                </div>
                                                <div class="cart_button">
                                                    <a href="checkout.html"> Check out</a>
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
                                                <li class="active"><a href="index.html" class="clik">Table tennis</a>
                                                    <div class="mega_menu jewelry" >
                                                        <div class="mega_items jewelry">
                                                            <ul>
                                                                <li><a href="index.html" class="clik"></a></li>
                                                                <li><a href="index-2.html"class="clik"></a></li>
                                                            </ul>
                                                        </div>
                                                    </div> </li>
                                                <li class="active"><a href="#" class="clik">Permission</a>
                                                    <div class="mega_menu jewelry" >
                                                        <div class="mega_items jewelry">
                                                            <ul>
                                                             <c:if test="${ sessionScope.user.getRole() == 'Admin'}">
                                                                    <li><a href="Statistic.jsp" class="clik">Admin page</a></li>
                                                                    </c:if>
                                                                    <c:if test="${sessionScope.user.getRole() == 'Customer' || sessionScope.user.getRole() == 'Admin'}">
                                                                    <li><a href="updateuser?user_id=${sessionScope.user.getId()}" class="clik">Update information</a></li>
                                                                    </c:if>
                                                                    <c:if test="${sessionScope.user.getRole() == 'Customer' || sessionScope.user.getRole() == 'Admin'}">
                                                                    <li><a href="changepassword" class="clik">Change password</a></li>
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
                                        <form action="menu">
                                            <label>Sort By</label>
                                            <select name="orderby" id="short">
                                                <option selected="" value="1">All</option>
                                                <option value="2">Price: Lowest</option>
                                                <option value="3">Price: Highest</option>
                                                <option value="4">Character A-Z</option>
                                                <option value="5">Character Z-A</option>
                                            </select>
                                        </form>

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
                                                                <a href="controlCate?cid=${cate.getId()}">
                                                                    ${cate.getName()}
                                                                </a>
                                                            </li>
                                                        </c:forEach>
                                                    </ul> 

                                                    </div>
                                                    <!--categorie menu end-->
                                                    <div></div>
                                                    <!--wishlist block start-->
                                                    <div class="sidebar_widget wishlist mb-35">
                                                        <div class="block_title">
                                                            <h3><a href="#">Wishlist</a></h3>
                                                        </div>
                                                        <div class="cart_item">
                                                            <div class="cart_img">
                                                                <a href="#"><img src="assets\img\cart\cart.jpg" alt=""></a>
                                                            </div>
                                                            <div class="cart_info">
                                                                <a href="#">lorem ipsum dolor</a>
                                                                <span class="cart_price">$115.00</span>
                                                                <span class="quantity">Qty: 1</span>
                                                            </div>
                                                            <div class="cart_remove">
                                                                <a title="Remove this item" href="#"><i class="fa fa-times-circle"></i></a>
                                                            </div>
                                                        </div>
                                                        <div class="cart_item">
                                                            <div class="cart_img">
                                                                <a href="#"><img src="assets\img\cart\cart2.jpg" alt=""></a>
                                                            </div>
                                                            <div class="cart_info">
                                                                <a href="#">Quisque ornare dui</a>
                                                                <span class="cart_price">$105.00</span>
                                                                <span class="quantity">Qty: 1</span>
                                                            </div>
                                                            <div class="cart_remove">
                                                                <a title="Remove this item" href="#"><i class="fa fa-times-circle"></i></a>
                                                            </div>
                                                        </div>
                                                        <div class="block_content">
                                                            <p>2  products</p>
                                                            <a href="#">» My wishlists</a>
                                                        </div>
                                                    </div>
                                                    <!--wishlist block end-->

                                                    <!--popular tags area-->
                                                    <div class="sidebar_widget tags mb-35">
                                                        <div class="block_title">
                                                            <h3>popular tags</h3>
                                                        </div>
                                                        <div class="block_tags">
                                                            <form action="timkiem" method="post">
                                                                <button name="search" type="submit" value="ball">ball</button>
                                                                <button name="search" type="submit" value="shose">shoes</button>
                                                                <button name="search" type="submit" value="wave">wave</button>
                                                                <button name="search" type="submit" value="in">in</button>
                                                            </form>
                                                        </div>

                                                    </div>
                                                    <!--popular tags end-->

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
                                                            <div class="row">
                                                                <c:forEach items="${listP}" var="p">
                                                                    <div class="col-lg-3 col-md-4 col-sm-6">
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
                                                    <script src="assets\js\vendor\jquery-1.12.0.min.js"></script>
                                                    <script src="assets\js\popper.js"></script>
                                                    <script src="assets\js\bootstrap.min.js"></script>
                                                    <script src="assets\js\ajax-mail.js"></script>
                                                    <script src="assets\js\plugins.js"></script>
                                                    <script src="assets\js\main.js"></script>
                                                    </body>
                                                    </html>
