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
        <script src="./js/script.js"></script>
    </head>
    <body>
        <div class="container">
            <div class="row justify-content-center mt-5">
                <div class="col-md-4">
                    <h2 class="text-center">Login Page</h2>
                    <form id="login" action="maincoller" method="POST">
                        <span class="text-danger text-decoration-none">${mess}</span>
                        <div class="mb-3">
                            <label for="username" class="form-label">Username</label>
                            <input type="text" value="${username}" class="form-control" id="username" name="username" placeholder="Enter your username">
                            <span id="error-user" class="text-danger text-decoration-none"></span>
                        </div>
                        <div class="mb-3">
                            <label for="password" class="form-label">Password</label>
                            <input type="password" value="${password}" class="form-control" id="password" name="password" placeholder="Enter your password">
                            <span id="error-pass" class="text-danger text-decoration-none"></span>
                        </div>
                        <div class="mb-3 form-check">
                            <input type="checkbox" class="form-check-input" id="rememberMe" name="rememberMe" value="on">
                            <label class="form-check-label" for="rememberMe">Remember me</label>
                        </div>
                        <button type="submit" class="btn btn-primary btn-block" name="action" value="LOGIN">Login</button>
                    </form>
                </div>
            </div>
        </div>
        <script>
            checkLogin();
        </script>
    </body>
</html>