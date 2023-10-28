<%-- 
    Document   : LoginPage
    Created on : Oct 15, 2023, 8:28:31 PM
    Author     : ADMIN
--%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Login</title>
        <link rel="stylesheet" href="./bootstrap/bootstrap.min.css">
        <script src="./jQuery/jquery-3.5.1.slim.min.js"></script>
        <script src="./jQuery/popper.min.js"></script>
        <script src="./bootstrap/bootstrap.min.js"></script>
        <script src="./jQuery/jquery-3.6.0.min.js"></script>
    </head>
    <body>
        <div class="container">
            <div class="row justify-content-center mt-5">
                <div class="col-md-4">
                    <h2 class="text-center">Login Page</h2>
                    <form id="login" action="loginservlet" method="post">
                        <div class="form-group">
                            <label for="username">Username</label>
                            <input type="text" class="form-control" id="username" name="username" placeholder="Enter username">
                            <span id="error-user" class="text-danger text-decoration-none"></span>
                        </div>
                        <div class="form-group">
                            <label for="password">Password</label>
                            <input type="password" class="form-control" id="password" name="password" placeholder="Enter password">
                            <span id="error-pass" class="text-danger text-decoration-none"></span>
                        </div>
                        <button type="submit" class="btn btn-primary btn-block">Login</button>
                    </form>
                </div>
            </div>
        </div>
        <script>
            $(document).ready(function () {
                $("#login").submit(function (event) {
                    var usernameValue = $("#username").val();
                    var passwordValue = $("#password").val();
                    if (usernameValue === "") {
                        $("#error-user").text("Please enter your username!");
                        event.preventDefault();
                    } else if (passwordValue === "") {
                        $("#error-pass").text("Please enter your password!");
                        event.preventDefault();
                    } else {
                        $("#error-pass").text(""); // Xóa thông báo lỗi nếu có
                        $("#error-user").text("");
                    }
                });
                $("#username, #password").on("input", function () {
                    $("#error-user").text("");
                    $("#error-pass").text("");
                });
            });
        </script>
    </body>
</html>