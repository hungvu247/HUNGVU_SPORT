<!DOCTYPE html>
<html lang="en">
    <head>
        <title>WELLCOME TO HUNGVUSPORT</title>
        <!-- Meta tags -->
        <meta name="viewport" content="width=device-width, initial-scale=1" />
        <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
        <meta name="keywords" content="Clean Login Form Responsive, Login Form Web Template, Flat Pricing Tables, Flat Drop-Downs, Sign-Up Web Templates, Flat Web Templates, Login Sign-up Responsive Web Template, Smartphone Compatible Web Template, Free Web Designs for Nokia, Samsung, LG, Sony Ericsson, Motorola Web Design" />

        <!-- CSS files -->
        <link href="css/font-awesome.min.css" rel="stylesheet" type="text/css" media="all">
        <link href="css/style.css" rel="stylesheet" type="text/css" media="all" />
        <!-- Online fonts -->
        <link href="//fonts.googleapis.com/css?family=Sirin+Stencil" rel="stylesheet">
    </head>
    <body>
        <div class="container demo-1">
            <div class="content">
                <div id="large-header" class="large-header" style=" background-image: url('img/bannerLogo.jpg');
    background-position: center bottom;">
                    <!-- Logo or website name -->
                    <h1>HUNG VU SPORT</h1>
                    <div class="main-agileits">
                        <!-- Login Form -->
                        <div class="form-w3-agile">
                            <h2>Login Now</h2>
                            <form action="login" method="post">
                                <!-- Username input -->
                                <div class="form-sub-w3">
                                    <input type="text" name="user" value="${user}"  placeholder="Username" required="" />
                                    <div class="icon-w3">
                                        <i class="fa fa-user" aria-hidden="true"></i>
                                    </div>
                                </div>
                                <!-- Password input -->
                                <div class="form-sub-w3">
                                    <div><input type="password" name="pass" value="${password}"id="password" placeholder="Password" required="" />
                                        <button type="button" onclick="switchVisibility()">Show/hide</button>
                                    </div>
                                    <div class="form-group form-check">
                                        <input name="remember" value="1" type="checkbox" class="form-check-input" id="exampleCheck1">
                                        <label class="form-check-label" for="exampleCheck1" style="color:white;font-size:20px">Remember me</label>
                                    </div>

                                    <div class="icon-w3">
                                        <i class="fa fa-unlock-alt" aria-hidden="true"></i>
                                    </div>
                                </div>
                                <!-- Forgot password link -->
                                <p class="p-bottom-w3ls">Forgot Password?<a href="#">Click here</a></p>
                                <!-- Register link -->
                                <p class="p-bottom-w3ls1">New User?<a href="register">Register here</a></p>
                                <div class="clear"></div>
                                <!-- Submit button -->
                                <div class="submit-w3l">
                                    <input type="submit" value="Login">
                                </div>
                            </form>
                            <!-- Error message display -->
                            <p style="color:red">${msg}</p>
                        </div>
                    </div>
                    <!-- Footer -->
                    <div class="copyright w3-agile">
                        <p> ©hungvusport@gmail.com | 09637531263 </p>
                    </div>
                </div>
            </div>
        </div>
        <!-- JavaScript for toggling password visibility -->
        <script>
            const passwordField = document.querySelector("#password");
            function switchVisibility() {
                if (passwordField.getAttribute("type") === "password")
                    passwordField.setAttribute("type", "text");
                else
                    passwordField.setAttribute("type", "password")
            }
        </script>
    </body>
</html>
