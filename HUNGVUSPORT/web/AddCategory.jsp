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
        <style>

            .submit-button {
                /* Thiết lập các thuộc tính mặc định */
                color: black;
                border: none;
                padding: 10px 20px;
                border-radius: 5px;
                width: 300px;
            }

            .submit-button:hover {
                color:white;
                background-color: green; /* Thay đổi màu nền khi trỏ vào */
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
                                            <li><a href="contact.html" title="Contact">Contact</a></li>
                                            <li><a href="wishlist.html" title="wishlist">My wishlist</a></li>
                                            <li><a href="my-account.html" title="My account">My account</a></li>
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
                                            <form action="timkiem" method="post">
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

                                                <li class="active"><a href="index.html" class="clik">Permission</a>
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
                                                                    <li><a href="changepassword?user_id=${sessionScope.user.getId()}" class="clik">Change password</a></li>
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



                    <!--pos home section end-->
                </div>
                <div> <form action="addcategory" method="post">
                        <div>
                            <label for="name_product">Enter name product:</label>
                            <input type="text" id="name_product" name="name_category"><br>
                        </div>
                        <div>
                            <label for="description">Enter description of category:</label>
                            <input type="text" id="description" name="description"><br>
                        </div>

                        <div style="text-align: center;margin-top: 10px"><input type="submit" value="Add" name="submit" class="submit-button"></div>

                    </form>
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
