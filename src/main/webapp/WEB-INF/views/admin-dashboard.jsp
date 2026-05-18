<%@ page import="com.fitnessmembership.fitnessmembership.model.UserManagement" %>

<%
    UserManagement admin =
            (UserManagement) session.getAttribute("loggedUser");
%>

<!DOCTYPE html>
<html>
<head>
    <title>Admin Dashboard</title>

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
            <a class="active" href="/admin/dashboard">
                <i class="fa-solid fa-gauge-high"></i>
                Dashboard
            </a>
        </li>

        <li>
            <a href="/admin/payments">
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
            <h1>Admin Dashboard</h1>
            <p>Manage FitClub operations from one place.</p>
        </div>

        <div class="admin-profile">
            <div class="admin-avatar">A</div>

            <div>
                <h3><%= admin != null ? admin.getFullName() : "Administrator" %></h3>
                <span>ADMIN</span>
            </div>
        </div>

    </div>

    <div class="admin-hero">

        <div>
            <h2>Welcome Back, Admin</h2>
            <p>
                Review payments, monitor members, manage bookings and keep the platform running smoothly.
            </p>
        </div>

    </div>

    <div class="admin-cards">

        <div class="admin-card">
            <i class="fa-solid fa-credit-card"></i>
            <h3>Payment Approvals</h3>
            <p>Approve pending member transactions.</p>
            <a href="/admin/payments">Open</a>
        </div>

        <div class="admin-card">
            <i class="fa-solid fa-users"></i>
            <h3>Member Overview</h3>
            <p>Review registered user activity.</p>
            <a href="#">View</a>
        </div>

        <div class="admin-card">
            <i class="fa-solid fa-calendar-days"></i>
            <h3>Booking Monitor</h3>
            <p>Check bookings and trainer hires.</p>
            <a href="#">Check</a>
        </div>

        <div class="admin-card">
            <i class="fa-solid fa-star"></i>
            <h3>Review Center</h3>
            <p>See what members say about FitClub.</p>
            <a href="#">Explore</a>
        </div>

    </div>

</div>

</body>
</html>