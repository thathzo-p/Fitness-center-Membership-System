<%@ page import="java.util.List" %>
<%@ page import="com.fitnessmembership.fitnessmembership.model.Payment" %>

<!DOCTYPE html>
<html>
<head>

    <script>
        if (localStorage.getItem("sidebarCollapsed") === "true") {
            document.documentElement.classList.add("sidebar-is-collapsed");
        }
    </script>
    <title>My Payments</title>

    <link rel="stylesheet"
          href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.1/css/all.min.css">

    <link rel="stylesheet"
          href="${pageContext.request.contextPath}/css/dashboard.css">

    <link rel="stylesheet"
          href="${pageContext.request.contextPath}/css/payment.css">
</head>

<body>

<jsp:include page="components/sidebar.jsp" />

<div class="main-content" id="mainContent">

    <div class="payment-header">
        <div>
            <h1>My Payments</h1>
            <p>View your membership, trainer and plan payment history.</p>
        </div>

        <a href="/plans" class="payment-action-btn">Choose New Plan</a>
    </div>

    <div class="member-payment-grid">

        <%
            List<Payment> payments =
                    (List<Payment>) request.getAttribute("payments");

            if(payments != null && !payments.isEmpty()){
                for(Payment p : payments){
        %>

        <div class="member-payment-card">

            <div class="payment-card-top">
                <div>
                    <h2><%= p.getDescription() %></h2>
                    <span>Payment ID: <%= p.getId() %></span>
                </div>

                <span class="payment-status">
                    <%= p.getStatus() %>
                </span>
            </div>

            <div class="payment-card-body">
                <div>
                    <p>Amount</p>
                    <h3>$<%= p.getAmount() %></h3>
                </div>

                <div>
                    <p>Date</p>
                    <h3><%= p.getDate() %></h3>
                </div>

                <div>
                    <p>User</p>
                    <h3><%= p.getUserId() %></h3>
                </div>
            </div>

        </div>

        <%
                }
            } else {
        %>

        <div class="empty-payment-card">
            <h2>No Payments Yet</h2>
            <p>Your plan, trainer and membership payments will appear here.</p>
            <a href="/plans">Choose a Plan</a>
        </div>

        <%
            }
        %>

    </div>

</div>

</body>
</html>