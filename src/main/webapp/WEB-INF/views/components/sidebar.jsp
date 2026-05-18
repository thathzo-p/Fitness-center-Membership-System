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

    </ul>

    <div class="sidebar-bottom">
        <a href="/logout" class="sidebar-logout">
            <i class="fa-solid fa-right-from-bracket"></i>
            <span>Logout</span>
        </a>
    </div>

</div>

<script>
    window.toggleSidebar = function () {
        const sidebar = document.getElementById("sidebar");
        const mainContent = document.getElementById("mainContent");

        if (!sidebar) return;

        const isCurrentlyCollapsed =
                sidebar.classList.contains("collapsed");

        if (isCurrentlyCollapsed) {
            sidebar.classList.remove("collapsed");

            if (mainContent) {
                mainContent.classList.remove("expand-content");
            }

            document.documentElement.classList.remove("sidebar-is-collapsed");
            localStorage.setItem("sidebarCollapsed", "false");

        } else {
            sidebar.classList.add("collapsed");

            if (mainContent) {
                mainContent.classList.add("expand-content");
            }

            document.documentElement.classList.add("sidebar-is-collapsed");
            localStorage.setItem("sidebarCollapsed", "true");
        }
    };

    document.addEventListener("DOMContentLoaded", function () {
        const sidebar = document.getElementById("sidebar");
        const mainContent = document.getElementById("mainContent");

        if (!sidebar) return;

        if (localStorage.getItem("sidebarCollapsed") === "true") {
            sidebar.classList.add("collapsed");

            if (mainContent) {
                mainContent.classList.add("expand-content");
            }

            document.documentElement.classList.add("sidebar-is-collapsed");
        }
    });
</script>