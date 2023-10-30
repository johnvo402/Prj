function showHide(show, hide, element) {
    var showButtons = document.querySelectorAll("." + show);
    var hideButton = document.getElementById(hide);
    var elementToToggle = document.getElementById(element);

    showButtons.forEach(function (button) {
        button.addEventListener("click", function () {
            elementToToggle.style.display = "block";
        });
    });

    hideButton.addEventListener("click", function () {
        elementToToggle.style.display = "none";
    });
}

function transmisson() {
    $(document).ready(function () {
        $(".update-button").click(function () {
            var orderId = $(this).data("order-id");
            var username = $(this).data("username");
            var orderTotal = $(this).data("order-total");
            var orderDate = $(this).data("order-date");
            var orderDes = $(this).data("order-des");

            $("#orderID").val(orderId);
            $("#username").val(username);
            $("#orderTotal").val(orderTotal);
            $("#orderDate").val(orderDate);
            $("#orderDescription").val(orderDes);

        });
    });
}
function checkLogin() {
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
                $("#error-pass").text("");
                $("#error-user").text("");
            }
        });
        $("#username, #password").on("input", function () {
            $("#error-user").text("");
            $("#error-pass").text("");
        });
    });
}

function checkfill(formId, id, errId, mess) {
    $(document).ready(function () {
        $(formId).submit(function (event) {
            var usernameValue = $(id).val();
            if (usernameValue === "") {
                $(errId).text(mess);
                event.preventDefault();
            } else {
                $(errId).text("");
            }
        });
        $(id).on("input", function () {
            $(errId).text("");
        });
    });
}

function checkNum(formId, id, errorid) {
    $(document).ready(function () {
        $(formId).submit(function (event) {
            var inputValue = parseFloat($(id).val());
            if (!isNaN(inputValue) && inputValue > 0) {
                $(errorid).text("");
            } else {
                $(errorid).text("Please enter a positive number!");
                event.preventDefault();
            }
        });
        $(id).on("input", function () {
            $(errorid).text("");
        });
    });
}

function Delete(show, link, element) {
    var showButtons = document.getElementById(show);
    var elementToToggle = document.getElementById(element);
    showButtons.addEventListener("click", function () {
          window.location.href = link;
        elementToToggle.style.display = "none";
    });
}
