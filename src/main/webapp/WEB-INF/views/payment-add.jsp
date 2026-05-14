<!DOCTYPE html>
<html>

<head>

    <link rel="stylesheet"
          href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.1/css/all.min.css">

    <link rel="stylesheet"
          href="${pageContext.request.contextPath}/css/dashboard.css">
    <title>Add Payment</title>

    <link rel="stylesheet"
          href="${pageContext.request.contextPath}/css/dashboard.css">

    <link rel="stylesheet"
          href="${pageContext.request.contextPath}/css/payment.css">

</head>

<body>

<jsp:include page="components/sidebar.jsp" />

<div class="main-content" id="mainContent">

<!-- SIDEBAR -->

<div class="sidebar">

    <div class="logo">
        FitClub
    </div>

    <ul>

        <li><a href="/dashboard">Dashboard</a></li>

        <li><a href="/payments">Payments</a></li>

    </ul>

</div>

<!-- MAIN -->

<div class="main-content">

    <div class="form-container">

        <h1>Add Payment</h1>

        <form action="/payments/add"
              method="post">

            <input type="text"
                   name="userId"
                   placeholder="User ID"
                   required>

            <input type="text"
                   name="amount"
                   placeholder="Amount"
                   required>

            <input type="text"
                   name="description"
                   placeholder="Description"
                   required>

            <input type="date"
                   name="date"
                   required>

            <button type="submit">

                Save Payment

            </button>

        </form>

    </div>

</div>
<script>
    function toggleSidebar(){
        document.getElementById("sidebar").classList.toggle("collapsed");
        document.getElementById("mainContent").classList.toggle("expand-content");
    }
</script>

</body>
</html>