<%@page import="jakarta.servlet.http.HttpSession" %>
<%@page contentType="text/html" pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="en">

    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Welcome</title>
        <link rel="stylesheet" href="./css/style-welcome.css" />
        <link rel="stylesheet" href="./bootstrap/bootstrap.min.css">
        <script src="./jQuery/jquery-3.5.1.slim.min.js"></script>
        <script src="./jQuery/popper.min.js"></script>
        <script src="./bootstrap/bootstrap.min.js"></script>
        <script src="./js/script.js"></script>
    </head>

    <body>
        <nav class="navbar navbar-expand-lg navbar-dark bg-dark">
            <a class="navbar-brand" href="#">
                <img src="https://th.bing.com/th/id/OIG.LAmyVaL7gIglpfB.BKdP?pid=ImgGn&w=1024&h=1024&rs=1" width="30" height="30" alt="TT">
            </a>
            <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarNav" aria-controls="navbarNav" aria-expanded="false" aria-label="Toggle navigation">
                <span class="navbar-toggler-icon"></span>
            </button>
            <div class="collapse navbar-collapse" id="navbarNav">
                <ul class="navbar-nav">
                    <li class="nav-item">
                            <a class="nav-link text-warning" href="WelcomePage.jsp">Welcome</a>
                    </li>
                    <li class="nav-item">
                        <c:url var="orderlist" value="maincoller">
                            <c:param name="action" value="LIST" />
                        </c:url>
                            <a class="nav-link" href="${orderlist}">Management</a>

                    </li>
                </ul>
            </div>
        </nav>
        <% String uid=(String) session.getAttribute("user"); if (uid==null) { %>
        <jsp:forward page="LoginPage.jsp" />
        <% } %>
        <div class="container">
            <div class="row justify-content-center mt-5">
                <div class="col-md-6">
                    <h1 class="text-center">Hello, <%= session.getAttribute("user")%>!</h1>
                    <form method="POST" action="maincoller">
                        <button id="logoutButton" type="submit" class="btn btn-danger btn-block"
                                name="action" value="LOGOUT" style="width: 50%; margin: 0 auto;">
                            Logout
                        </button>
                    </form>

                </div>
            </div>

            <div class="welcome-img">
                <img src="https://khoinguonsangtao.vn/wp-content/uploads/2022/11/hinh-anh-welcome-780x321.jpg"  style="width:100%; margin-top: 100px"/>
            </div>
        </div>

    </body>

</html>