<%
    String uri = request.getRequestURI();
%>

<div class="sidebar" id="sidebar">

    <div class="sidebar-header">

        <div class="logo">
            Fit<span>Club</span>
        </div>

        <button class="menu-toggle" onclick="toggleSidebar()">
            <i class="fa-solid fa-bars"></i>
        </button>

    </div>

    <ul>

        <li>
            <a class="<%= uri.contains("/dashboard") ? "active" : "" %>" href="/dashboard">
                <i class="fa-solid fa-house"></i>
                <span>Dashboard</span>
            </a>
        </li>

        <li>
            <a class="<%= uri.contains("/trainers") ? "active" : "" %>" href="/trainers">
                <i class="fa-solid fa-user-group"></i>
                <span>Trainers</span>
            </a>
        </li>

        <li>
            <a class="<%= uri.contains("/plans") ? "active" : "" %>" href="/plans">
                <i class="fa-solid fa-dumbbell"></i>
                <span>Plans</span>
            </a>
        </li>

        <li>
            <a class="<%= uri.contains("/booking") ? "active" : "" %>" href="/booking/my">
                <i class="fa-solid fa-calendar-check"></i>
                <span>Bookings</span>
            </a>
        </li>

        <li>
            <a class="<%= uri.contains("/progress") ? "active" : "" %>"
               href="${pageContext.request.contextPath}/progress">

                <i class="fa-solid fa-chart-line"></i>
                <span>Progress</span>

            </a>
        </li>

        <li>
            <a class="<%= uri.contains("/reviews") ? "active" : "" %>"
               href="/reviews">
                <i class="fa-solid fa-star"></i>
                <span>Reviews</span>
            </a>
        </li>

        <li>
            <a class="<%= uri.contains("/payments") ? "active" : "" %>" href="/payments">
                <i class="fa-solid fa-credit-card"></i>
                <span>My Payments</span>
            </a>
        </li>

        <li>
            <a class="<%= uri.contains("/profile") ? "active" : "" %>" href="/profile">
                <i class="fa-solid fa-user"></i>
                <span>Profile</span>
            </a>
        </li>

    </ul>

</div>