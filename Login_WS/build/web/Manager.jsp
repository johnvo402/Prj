<%@page import="jakarta.servlet.http.HttpSession" %>
<%@page contentType="text/html" pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="en">

    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Manager</title>
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
                        <a class="nav-link" href="WelcomePage.jsp">Welcome</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link  text-warning" href="Manager.jsp">Management</a>
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
                    <h1 class="text-center">Order Management</h1>
                </div>
            </div>
            <div class="d-flex justify-content-center bg-light" style="padding: 16px 0; margin: 20px 0;">
                <div class="col-5 text-center">
                    Notification:
                </div>
                <div class="text-danger text-decoration-none col-7">${mess}</div>
            </div>


            <div class="row justify-content-between" style="margin: 20px 0;">
                <button class="showCreate btn btn-info">Add new</button>
                <form action="maincoller" method="POST">
                    <button class="btn btn-danger" name="action" value="LIST">Show All</button>
                </form>

                <form action="maincoller" class="row justify-content-center col-6">
                    <input type="text" class="form-control col-5" id="search" name="search" value="${lastS}"required>
                    <button type="submit" class="btn btn-dark" style="margin: 0 16px;" name="action" value="SEARCH">
                        Search
                    </button>
                </form>

            </div>

            <table class="table table-striped">
                <thead>
                    <tr class="table-warning">
                        <th>Order ID</th>
                        <th>Username</th>
                        <th>Order Total</th>
                        <th>Order Date</th>
                        <th>Order Description</th>
                        <th>Edit</th>
                    </tr>
                </thead>
                <tbody>
                    <c:forEach var="order" items="${orders}">
                        <tr>
                            <td>${order.orderId}</td>
                            <td>${order.username}</td>
                            <td>${order.orderTotal}</td>
                            <td>${order.orderDate}</td>
                            <td>${order.orderDes}</td>
                            <td>
                                <c:url var="delete" value="maincoller">
                                    <c:param name="action" value="DELETE" />
                                    <c:param name="deleteId" value="${order.orderId}" />
                                </c:url>

                                <button id="showPopupButton" class="btn btn-dark showPopupButton" >
                                    Delete </button>
                                <button class="update-button showButton btn btn-primary" data-target="elementToToggle"
                                        data-order-id="${order.orderId}" data-username="${order.username}"
                                        data-order-total="${order.orderTotal}"
                                        data-order-date="${order.orderDate}" data-order-des="${order.orderDes}">
                                    Update
                                </button>
                            </td>


                        </tr>
                    </c:forEach>
                    <c:forEach var="order" items="${search}">
                        <tr>
                            <td>${order.orderId}</td>
                            <td>${order.username}</td>
                            <td>${order.orderTotal}</td>
                            <td>${order.orderDate}</td>
                            <td>${order.orderDes}</td>
                            <td>
                                <c:url var="delete" value="maincoller">
                                    <c:param name="action" value="DELETE" />
                                    <c:param name="deleteId" value="${order.orderId}" />
                                </c:url>

                                <button id="showPopupButton" class="showPopupButton btn btn-dark">
                                    Delete </button>
                                <button class="update-button showButton btn btn-primary" data-target="elementToToggle"
                                        data-order-id="${order.orderId}" data-username="${order.username}"
                                        data-order-total="${order.orderTotal}"
                                        data-order-date="${order.orderDate}" data-order-des="${order.orderDes}">
                                    Update
                                </button>
                            </td>


                        </tr>
                    </c:forEach>
                </tbody>


            </table>
        </div>
        <div class="popup" id="myPopup">
            <h2 class="text-danger">Warning!</h2>
            <p>Do you want delete?</p>
            <button id="acceptButton" class="accept">Accept</button>
            <button id="cancelButton" class="cancel">Cancel</button>
        </div>
        <div id="elementToToggle" class="update">
            <div class="update-content container">
                <h1>Update Order</h1>
                <button id="hideButton" type="button" class="btn btn-dark" data-bs-dismiss="modal"
                        aria-label="Close"
                        style="position: absolute; top: 15px; right: 15px;">&#215</button>
                <form action="maincoller" method="POST" id="formUpdate">
                    <div class="mb-3">
                        <label for="orderID" class="form-label">Order ID:</label>
                        <input type="text" class="form-control" id="orderID" name="orderID" readonly>
                    </div>
                    <div class="mb-3">
                        <label for="username" class="form-label">Username:</label>
                        <input type="text" class="form-control" id="username" name="username">
                        <span id="error-user" class="text-danger text-decoration-none"></span>

                    </div>
                    <div class="mb-3">
                        <label for="orderTotal" class="form-label">Order Total:</label>
                        <input type="number" class="form-control" id="orderTotal" name="orderTotal">
                        <span id="error-total" class="text-danger text-decoration-none"></span>

                    </div>
                    <div class="mb-3">
                        <label for="orderDate" class="form-label">Order Date:</label>
                        <input type="date" class="form-control" id="orderDate" name="orderDate">
                        <span id="error-date" class="text-danger text-decoration-none"></span>

                    </div>
                    <div class="mb-3">
                        <label for="orderDescription" class="form-label">Order Description:</label>
                        <textarea class="form-control" id="orderDescription" name="orderDescription"></textarea>
                        <span id="error-des" class="text-danger text-decoration-none"></span>

                    </div>
                    <button type="submit" class="btn btn-success" name="action"
                            value="UPDATE">Update</button>
                </form>
            </div>
        </div>
        <div id="elementCreate" class="update">
            <div class="create-content container">
                <h1>Create Order</h1>
                <button id="hideCreate" type="button" class="btn btn-dark" data-bs-dismiss="modal"
                        aria-label="Close"
                        style="position: absolute; top: 15px; right: 15px;">&#215</button>
                <form action="maincoller" method="POST" id="formCreate">
                    <div class="mb-3">
                        <label for="orderID" class="form-label">Order ID:</label>
                        <input type="text" class="form-control" id="orderIDC" name="orderID">
                        <span id="error-id" class="text-danger text-decoration-none"></span>
                    </div>
                    <div class="mb-3">
                        <label for="username" class="form-label">Username:</label>
                        <input type="text" class="form-control" id="usernameC" name="username">
                        <span id="error-user-create" class="text-danger text-decoration-none"></span>
                    </div>
                    <div class="mb-3">
                        <label for="orderTotal" class="form-label">Order Total:</label>
                        <input type="number" class="form-control" id="orderTotalC" name="orderTotal">
                        <span id="error-total-create" class="text-danger text-decoration-none"></span>
                    </div>
                    <div class="mb-3">
                        <label for="orderDate" class="form-label">Order Date:</label>
                        <input type="date" class="form-control" id="orderDateC" name="orderDate">
                        <span id="error-date-create" class="text-danger text-decoration-none"></span>
                    </div>
                    <div class="mb-3">
                        <label for="orderDescription" class="form-label">Order Description:</label>
                        <textarea class="form-control" id="orderDescriptionC" name="orderDescription"></textarea>
                        <span id="error-des-create" class="text-danger text-decoration-none"></span>
                    </div>
                    <button type="submit" class="btn btn-success" name="action"
                            value="CREATE">Create</button>
                </form>
            </div>
        </div>
        <script type="text/javascript">

            showHide("showButton", "hideButton", "elementToToggle");
            showHide("showCreate", "hideCreate", "elementCreate");
            showHide("showPopupButton", "cancelButton", "myPopup");
            Delete("acceptButton", '${delete}', "myPopup");
            transmisson();
            checkfill("#formUpdate", "#username", "#error-user", "Please fill in this field!");
            checkfill("#formUpdate", "#orderTotal", "#error-total", "Please fill in this field!");
            checkfill("#formUpdate", "#orderDate", "#error-date", "Please fill in this field!");
            checkfill("#formUpdate", "#orderDescription", "#error-des", "Please fill in this field!");

            checkfill("#formCreate", "#orderIDC", "#error-id", "Please fill in this field!");
            checkfill("#formCreate", "#usernameC", "#error-user-create", "Please fill in this field!");
            checkfill("#formCreate", "#orderTotalC", "#error-total-create", "Please fill in this field!");
            checkfill("#formCreate", "#orderDateC", "#error-date-create", "Please fill in this field!");
            checkfill("#formCreate", "#orderDescriptionC", "#error-des-create", "Please fill in this field!");

            checkNum("#formUpdate", "#orderTotal", "#error-total");
            checkNum("#formCreate", "#orderTotalC", "#error-total-create");

            window.onload = function () {
                if (localStorage.getItem('mess') !== null) {
                    localStorage.removeItem('mess');
                }
            };
        </script>
    </body>

</html>