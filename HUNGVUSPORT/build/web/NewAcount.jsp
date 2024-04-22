<%-- 
    Document   : NewAcount
    Created on : Jan 11, 2024, 11:40:49 PM
    Author     : HUNG VU
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <title>WELLCOME TO HUNGVUSPORT</title>
        <meta name="viewport" content="width=device-width, initial-scale=1" />
        <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
        <meta name="keywords" content="Clean Login Form Responsive, Login Form Web Template, Flat Pricing Tables, Flat Drop-Downs, Sign-Up Web Templates, Flat Web Templates, Login Sign-up Responsive Web Template, Smartphone Compatible Web Template, Free Web Designs for Nokia, Samsung, LG, Sony Ericsson, Motorola Web Design" />

        <!-- css files -->
        <link href="css/font-awesome.min.css" rel="stylesheet" type="text/css" media="all">
        <link href="css/style.css" rel="stylesheet" type="text/css" media="all" />
        <!-- /css files -->

        <!-- online fonts -->
        <link href="//fonts.googleapis.com/css?family=Sirin+Stencil" rel="stylesheet">
        <!-- online fonts -->

    <body>
        <div class="container demo-1">
            <div class="content">
                <div id="large-header" class="large-header">
                    <h1>HUNG VU SPORT</h1>
                    <div class="main-agileits">
                        <!--form-stars-here-->
                        <div class="form-w3-agile">
                            <h2>Sign In</h2>
                            <form action="register" method="post">
                                <div class="form-sub-w3">
                                    <input type="text" name="user" placeholder="Username" required="" />
                                    <div class="icon-w3">
                                        <i class="fa fa-user" aria-hidden="true"></i>
                                    </div>
                                </div>
                                <div class="form-sub-w3">
                                    <input type="password" name="pass" placeholder="Password" required="" />
                                    <input type="password" name="passConfirm" placeholder="Confirm password" required="" />
                                    <div class="icon-w3"> 
                                        <i class="fa fa-unlock-alt" aria-hidden="true"></i>
                                    </div>
                                </div>


                                <div class=" form-sub-w3 info">
                                    <h2>Information user</h2>
                                    <input type="text" name="firstname" placeholder="Enter firstname" required="" />
                                    <input type="text" name="lastname" placeholder="Enter lastname" required="" />
                                    <input type="text" name="address" placeholder="Enter address" required="" />
                                    <input type="text" name="phone" placeholder="Enter phone" required="" />

                                </div>

                                <div class="clear"></div>
                                <div class="submit-w3l">
                                    <input type="submit" value="Sign In">
                                  
                
                                </div>
                                <div><a href="login" style="color: white;border: 1px;">Back to login</a></div>
                            </form>
                            <p style="color:red">${requestScope.erorr}</p>

                        </div>
                        <!--//form-ends-here-->
                    </div><!-- copyright -->
                    <div class="copyright w3-agile">
                        <p> ©hungvusport@gmail.com | 09637531263 </p>
                    </div>
                    <!-- //copyright --> 
                </div>
            </div>
        </div>	

    </body>
</html>
