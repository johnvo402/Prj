<%-- 
    Document   : WelcomePage
    Created on : Oct 15, 2023, 11:11:20 PM
    Author     : ADMIN
--%>

<%@page import="javax.servlet.http.HttpSession" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Welcome</title>
        <link rel="stylesheet" href="./bootstrap/bootstrap.min.css">
        <script src="./jQuery/jquery-3.5.1.slim.min.js"></script>
        <script src="./jQuery/popper.min.js"></script>
        <script src="./bootstrap/bootstrap.min.js"></script>
    </head>
    <body>
        <%
            String uid = (String) session.getAttribute("user");
            if (uid == null) {
        %>
        <jsp:forward page="LoginPage.jsp"/>
        <%
            }
        %>
        <div class="container">
            <div class="row justify-content-center mt-5">
                <div class="col-md-6">
                    <h1 class="text-center">Welcome back <%= session.getAttribute("user")%>!</h1>
                    <form method="POST" action="logoutservlet">
                        <button id="logoutButton" type="submit" class="btn btn-primary btn-block" name="action" value="logout" style="width: 50%; margin: 0 auto;">
                            Logout
                        </button>
                    </form>

                </div>
            </div>
            <table>
                <tr>
                    <th>Order ID</th>
                    <th>Username</th>
                    <th>Order Total</th>
                    <th>Order Date</th>
                    <th>Order Description</th>
                </tr>     
                <c:forEach items="${order}" var="order" >
                    <tr>
                        <td>${order.orderId}</td>
                        <td>${order.username}</td>
                        <td>${order.orderTotal}</td>
                        <td>${order.orderDate}</td>
                        <td>${order.orderDes}</td>
                    </tr>
                </c:forEach>

            </table>
        </div>
    </body>
</html>
