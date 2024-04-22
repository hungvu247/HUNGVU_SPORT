e<%-- 
    Document   : Menu
    Created on : Jan 8, 2024, 1:59:34 PM
    Author     : HUNG VU
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

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
                                            <li><a href="myacount?user_id=${sessionScope.user.getId()}" title="My account">My account</a></li>


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
                    <!--pos home section end-->
                </div>
                <div>     <div class="shopping_cart_area">

                        <div class="row">
                            <div class="col-12">
                                <div class="table_desc">
                                    <div class="cart_page table-responsive">
                                        <table>
                                            <thead>
                                                <tr>

                                                    <th class="product_thumb">Image</th>
                                                    <th class="product_name">Product</th>
                                                    <th class="product-price">Price</th>
                                                    <th class="product_quantity">Quantity</th>
                                                    <th class="product_total">Total</th>  
                                                    <th class="product_remove">Delete</th>
                                                </tr>
                                            </thead>
                                            <tbody>
                                                <c:forEach items="${cart.getItems()}" var="u">
                                                    <tr>

                                                        <td class="product_thumb"><a href="#"><img src="${u.getProduct().getImg()}" alt=""></a></td>
                                                        <td class="product_name"><a href="#">${u.getProduct().getProduct_name()}</a></td>
                                                        <td class="product-price">$ ${u.getPrice()}</td>
                                                        <td class="product_quantity" style="text-align: center">

                                                            <button><a href="process?num=-1&id=${u.getProduct().getProduct_id()}">-</a></button>
                                                            ${u.getQuantity()}
                                                            <button><a href="process?num=1&id=${u.getProduct().getProduct_id()}">+</a></button>
                                                        </td>
                                                        <td class="product_total">$ ${u.getPrice()* u.getQuantity()}</td>
                                                        <td class="product_remove">
                                                            <form action="process" method="post">
                                                                <input type="hidden" name="pid" value="${u.getProduct().getProduct_id()}">
                                                                <button type="submit" style="background:none;border:none;padding:0;margin:0;">
                                                                    <i class="fa fa-trash-o" style="margin: 0;padding: 0"></i>
                                                                </button>
                                                            </form>
                                                        </td>

                                                    </tr>
                                                </c:forEach>
                                            </tbody>
                                        </table>   
                                    </div>      
                                </div>
                            </div>
                        </div>
                        <!--coupon code area start-->
                        <div class="coupon_area">
                            <div class="row">
                                <div class="col-lg-6 col-md-6">
                                    <div class="coupon_code">
                                        <h3>Coupon</h3>
                                        <div class="coupon_inner">   
                                            <p>Enter your coupon code if you have one.</p>                                
                                            <input placeholder="Coupon code" type="text">
                                            <button type="submit">Apply coupon</button>
                                        </div>    
                                    </div>
                                </div>
                                <div class="col-lg-6 col-md-6">
                                    <div class="coupon_code">

                                        <h3>Cart Totals</h3>
                                        <div class="coupon_inner">
                                            <div class="cart_subtotal">
                                                <p> Subtotal</p>
                                                <p class="cart_amount"> ${cart.getTotal()}$</p>
                                            </div>
                                            <div class="cart_subtotal ">
                                                <p>Shipping</p>
                                                <p class="cart_amount"><span>Flat Rate:</span> $1.5</p>
                                            </div>
                                            <a href="#">Calculate shipping</a>

                                            <div class="cart_subtotal">
                                                <p>Total</p>
                                                <p class="cart_amount">${cart.getTotal()*1.5}$</p>
                                            </div>
                                            <div class="checkout_btn">
                                                <form action="checkcout" method="post">
                                                    <input type="submit" value="Buy Now" style="background-color: greenyellow;
                                                           color:white;cursor: pointer"/>
                                                </form>
                                            </div>

                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <!--coupon code area end-->
                        </form> 
                    </div></div>                                         
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


        </script>
        <script src="assets\js\vendor\jquery-1.12.0.min.js"></script>
        <script src="assets\js\popper.js"></script>
        <script src="assets\js\bootstrap.min.js"></script>
        <script src="assets\js\ajax-mail.js"></script>
        <script src="assets\js\plugins.js"></script>
        <script src="assets\js\main.js"></script>
    </body>
</html>
