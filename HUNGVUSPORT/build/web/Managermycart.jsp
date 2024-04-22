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
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/css/bootstrap.min.css">
        <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.6.3/css/font-awesome.css" rel="stylesheet"> <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/js/bootstrap.min.js"></script>

        <style>body {
                background: #F1F3FA;
            }


            .profile {
                margin: 20px 0;
            }

            .profile-sidebar {
                padding: 20px 0 10px 0;
                background: #fff;
            }


            .profile-userpic img {
                float: none;
                margin: 0 auto;
                width: 60%;
                height: 50%;
                -webkit-border-radius: 50% !important;
                -moz-border-radius: 50% !important;
                border-radius: 50% !important;
            }


            .profile-usertitle {
                text-align: center;
                margin-top: 20px;
            }


            .profile-usertitle-name {
                color: #5a7391;
                font-size: 16px;
                font-weight: 600;
                margin-bottom: 7px;
            }


            .profile-usertitle-job {
                text-transform: uppercase;
                color: #5b9bd1;
                font-size: 12px;
                font-weight: 600;
                margin-bottom: 15px;
            }


            .profile-userbuttons {
                text-align: center;
                margin-top: 10px;
            }


            .profile-userbuttons .btn {
                text-transform: uppercase;
                font-size: 11px;
                font-weight: 600;
                padding: 6px 15px;
                margin-right: 5px;
            }


            .profile-userbuttons .btn:last-child {
                margin-right: 0px;
            }
            .profile-usermenu {
                margin-top: 30px;
            }

            .profile-usermenu ul li {
                border-bottom: 1px solid #f0f4f7;
            }


            .profile-usermenu ul li:last-child {
                border-bottom: none;
            }

            .profile-usermenu ul li a {
                color: #93a3b5;
                font-size: 14px;
                font-weight: 400;
            }


            .profile-usermenu ul li a i {
                margin-right: 8px;
                font-size: 14px;
            }

            .profile-usermenu ul li a:hover {
                background-color: #fafcfd;
                color: #5b9bd1;
            }


            .profile-usermenu ul li.active {
                border-bottom: none;
            }


            .profile-usermenu ul li.active a {
                color: #5b9bd1;
                background-color: #f6f9fb;
                border-left: 2px solid #5b9bd1;
                margin-left: -2px;
            }


            .profile-content {
                padding: 20px;
                background: #fff;
                min-height: 460px;
            }</style>
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
                                            <li><a href="javascript:void(0)" onclick="mycart()" title="My cart">My cart</a></li>

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

                                                                <li><a href="updateuser?user_id=${sessionScope.user.getId()}" class="clik">Update information</a></li>


                                                                <li><a href="changepassword?user_id=${sessionScope.user.getId()}" class="clik">Change password</a></li>





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


     <c:set var="u" value="${requestScope.user}" />
                <div class="container" style="margin-bottom:  100px;"> 
                    <div class="row profile">        
                        <div class="col-md-3">          
                            <div class="profile-sidebar">                          
                                                                         
                                <div class="profile-usertitle">                   
                                    <div class="profile-usertitle-name">                  ${u.getFirstName()}               </div>                  
                                    <div class="profile-usertitle-job">                      ${u.getRole()}                 </div>              
                                </div>                                                
                                <div class="profile-userbuttons">                 
                                    <a type="button" class="btn btn-success btn-sm" href="menu">Trang chủ</a>                  
                                    <a type="button" class="btn btn-danger btn-sm"href="logout">Thoát ra</a>                
                                </div>                                            
                                <div class="profile-usermenu">                    
                                    <ul class="nav"><div class="logo_menuchinh" style="float:left; padding-top:5px; padding-left:10px; color:#fff; margin-left:auto; margin-right:auto; text-align:center; line-height:40px; font-size:16px;font-weight:bold;font-family:Arial">HOCWEBGIARE.COM</div><div class="menu-icon"></div>                      

                                        <li class="active">                         <a href="updateuser?user_id=${sessionScope.user.getId()}">                         <i class="glyphicon glyphicon-info-sign"></i>                           Cập nhật thông tin cá nhân </a>                     
                                        </li>  



                                    </ul>                
                                </div>                            
                            </div>     
                        </div>      

                        <div class="col-md-9"> 
                            <div class="profile-content">           
                                <div>
                                    <div><h1><a href="showmycart?user_id=${sessionScope.user.getId()}">List old order</a></h1></div>
                                    <form action="xuatExcelControl" method="get"> 
                                        <input oninput="searchByDate(this)" type="date" id="dateHoaDon" name="dateHoaDon" class="form-control mb-0" style="width:30%">

                                    </form> 
                                    <table class="table">
                                        <thead>
                                            <tr>
                                                <th>Order</th>
                                                <th>Date</th>
                                                <th>Status</th>
                                                <th>Total</th>
                                             
                                            </tr>
                                        </thead>
                                        <tbody id="content">
                                            <c:forEach items="${listOrder}" var="order">
                                                <tr>
                                                    <td>${order.getOrder_id()}</td>
                                                    <td>${order.getOrder_date()}</td>
                                                    <td>${order.getStatus()}</td>
                                                    <td>$${String.format("%.2f", order.getTotal())}</td>
                                                
                                                </tr>
                                            </c:forEach>
                                        </tbody>
                                    </table>
                                    <div>
                                        Number of order:<p>${size}-order</p>
                                        Total:<p style="color:red">$${total}</p>
                                    </div><div>
                                    <div class="clear"></div>
                                </div>
                            </div>
                        </div>

                    </div>
                </div>

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
<script>function mycart() {
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
    function searchByDate(param) {
        var txtSearchDate = param.value;
        $.ajax({
            url: "/hungvusport/searchmyorderbydate",
            type: "get", //send it through get method
            data: {
                ngayXuat: txtSearchDate
            },
            success: function (responseData) {
                document.getElementById("content").innerHTML = responseData;
            }

        });
    }</script>
<script src="assets\js\vendor\jquery-1.12.0.min.js"></script>
<script src="assets\js\popper.js"></script>
<script src="assets\js\bootstrap.min.js"></script>
<script src="assets\js\ajax-mail.js"></script>
<script src="assets\js\plugins.js"></script>
<script src="assets\js\main.js"></script>
</body>
</html>
