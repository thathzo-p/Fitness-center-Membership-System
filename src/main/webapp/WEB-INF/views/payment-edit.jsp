<%@ page import="com.fitnessmembership.fitnessmembership.model.Payment" %>

<%

    Payment payment =
            (Payment) request.getAttribute("payment");

%>

<!DOCTYPE html>
<html>

<head>

    <link rel="stylesheet"
          href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.1/css/all.min.css">

    <link rel="stylesheet"
          href="${pageContext.request.contextPath}/css/dashboard.css">

    <title>Edit Payment</title>

    <link rel="stylesheet"
          href="${pageContext.request.contextPath}/css/dashboard.css">

    <link rel="stylesheet"
          href="${pageContext.request.contextPath}/css/payment.css">

</head>

<script>
function toggleSidebar(){

    document
        .getElementById("sidebar")
        .classList
        .toggle("collapsed");

    document
        .getElementById("mainContent")
        .classList
        .toggle("expand-content");
}
</script>

<body>

<div class="sidebar">

    <div class="logo">
        FitClub
    </div>

    <ul>

        <li><a href="/dashboard">Dashboard</a></li>

        <li><a href="/payments">Payments</a></li>

    </ul>

</div>

<div class="main-content">

    <div class="form-container">

        <h1>Edit Payment</h1>

        <form action="/payments/edit/<%= payment.getId() %>"
              method="post">

            <input type="text"
                   value="<%= payment.getAmount() %>"
                   name="amount"
                   required>

            <input type="text"
                   value="<%= payment.getDescription() %>"
                   name="description"
                   required>

            <select name="status">

                <option>
                    Pending
                </option>

                <option>
                    Paid
                </option>

            </select>

            <button type="submit">

                Update Payment

            </button>

        </form>

    </div>

</div>

</body>
</html>