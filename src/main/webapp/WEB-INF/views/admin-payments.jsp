<%@ page import="java.util.List" %>
<%@ page import="com.fitnessmembership.fitnessmembership.model.Payment" %>
<%@ page import="com.fitnessmembership.fitnessmembership.model.UserManagement" %>

<%
    UserManagement admin =
            (UserManagement) session.getAttribute("loggedUser");

    List<Payment> payments =
            (List<Payment>) request.getAttribute("payments");
%>

<!DOCTYPE html>
<html>
<head>
    <title>Admin Payment Approvals</title>

    <link rel="stylesheet"
          href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.1/css/all.min.css">

    <link rel="stylesheet"
          href="${pageContext.request.contextPath}/css/admin.css">
</head>

<body>

<div class="admin-sidebar">

    <div class="admin-logo">
        Fit<span>Club</span>
        <small>Admin</small>
    </div>

    <ul>
        <li>
            <a href="/admin/dashboard">
                <i class="fa-solid fa-gauge-high"></i>
                Dashboard
            </a>
        </li>

        <li>
            <a class="active" href="/admin/payments">
                <i class="fa-solid fa-credit-card"></i>
                Payment Approvals
            </a>
        </li>

        <li>
            <a href="#">
                <i class="fa-solid fa-users"></i>
                Members
            </a>
        </li>

        <li>
            <a href="#">
                <i class="fa-solid fa-calendar-check"></i>
                Bookings
            </a>
        </li>

        <li>
            <a href="#">
                <i class="fa-solid fa-star"></i>
                Reviews
            </a>
        </li>
    </ul>

    <a href="/logout" class="admin-logout">
        <i class="fa-solid fa-right-from-bracket"></i>
        Logout
    </a>

</div>

<div class="admin-main">

    <div class="admin-topbar">

        <div>
            <h1>Payment Approvals</h1>
            <p>Review and approve member payment requests.</p>
        </div>

        <div class="admin-profile">
            <div class="admin-avatar">A</div>

            <div>
                <h3><%= admin != null ? admin.getFullName() : "Administrator" %></h3>
                <span>ADMIN</span>
            </div>
        </div>

    </div>

    <div class="approval-panel">

        <div class="approval-header">
            <h2>All Payments</h2>
            <p>Pending payments can be approved by admins only.</p>
        </div>

        <div class="approval-table">

            <div class="approval-row approval-head">
                <span>Payment ID</span>
                <span>User ID</span>
                <span>Description</span>
                <span>Amount</span>
                <span>Date</span>
                <span>Status</span>
                <span>Action</span>
            </div>

            <%
                if (payments != null && !payments.isEmpty()) {
                    for (Payment p : payments) {
            %>

            <div class="approval-row">
                <span><%= p.getId() %></span>
                <span><%= p.getUserId() %></span>
                <span><%= p.getDescription() %></span>
                <span>$<%= p.getAmount() %></span>
                <span><%= p.getDate() %></span>

                <span>
                    <b class="<%= "Paid".equalsIgnoreCase(p.getStatus()) ? "status-paid" : "status-pending" %>">
                        <%= p.getStatus() %>
                    </b>
                </span>

                <span>
                    <%
                        if ("Pending".equalsIgnoreCase(p.getStatus())) {
                    %>
                        <a class="approve-btn"
                           href="/admin/payments/approve/<%= p.getId() %>">
                            Approve
                        </a>
                    <%
                        } else {
                    %>
                        <span class="approved-label">Approved</span>
                    <%
                        }
                    %>
                </span>
            </div>

            <%
                    }
                } else {
            %>

            <div class="empty-approval">
                <h3>No Payments Found</h3>
                <p>Member payments will appear here.</p>
            </div>

            <%
                }
            %>

        </div>

    </div>

</div>

</body>
</html>