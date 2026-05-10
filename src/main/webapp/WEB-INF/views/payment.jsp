<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>PowerFit - Payments</title>
    <link rel="stylesheet" href="/css/dashboard.css">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/@tabler/icons-webfont@latest/tabler-icons.min.css">
</head>
<body>

<div class="pf-wrap">

    <!-- Navbar -->
    <div class="pf-nav">
        <span class="pf-logo">Power<span>Fit</span></span>
        <ul class="pf-nav-tabs">
            <li><a href="/dashboard">Dashboard</a></li>
            <li><a href="/bookings">Bookings</a></li>
            <li><a href="/classes">Classes</a></li>
            <li><a href="/reviews">Reviews</a></li>
        </ul>
        <div class="pf-right">
            <div class="pf-icon-btn" id="menuBtn">
                <i class="ti ti-layout-grid"></i>
            </div>
            <div class="pf-avatar" id="profileBtn">JD</div>
            <div class="pf-menu-dropdown" id="menuDropdown">
                <a href="/payments" class="pf-menu-item">
                    <div class="pf-menu-item-icon" style="background:#0d1f3a;">💳</div>
                    <div>
                        <div class="pf-menu-item-title">My Payments</div>
                        <div class="pf-menu-item-sub">View payment history</div>
                    </div>
                </a>
                <a href="/plans" class="pf-menu-item">
                    <div class="pf-menu-item-icon" style="background:#0d2a0d;">🥗</div>
                    <div>
                        <div class="pf-menu-item-title">My Plans</div>
                        <div class="pf-menu-item-sub">Meal and fitness plans</div>
                    </div>
                </a>
                <a href="/progress" class="pf-menu-item">
                    <div class="pf-menu-item-icon" style="background:#1a1a2a;">📊</div>
                    <div>
                        <div class="pf-menu-item-title">My Progress</div>
                        <div class="pf-menu-item-sub">Track your progress</div>
                    </div>
                </a>
                <a href="/bookings" class="pf-menu-item">
                    <div class="pf-menu-item-icon" style="background:#2a1a0a;">📅</div>
                    <div>
                        <div class="pf-menu-item-title">My Bookings</div>
                        <div class="pf-menu-item-sub">Upcoming classes</div>
                    </div>
                </a>
            </div>
            <div class="pf-dropdown" id="profileDropdown">
                <div class="pf-dropdown-header">
                    <p>John Doe</p>
                    <span>john@email.com</span>
                </div>
                <a href="/profile" class="pf-dropdown-item">
                    <i class="ti ti-user"></i> My Profile
                </a>
                <a href="/settings" class="pf-dropdown-item">
                    <i class="ti ti-settings"></i> Settings
                </a>
                <div class="pf-dropdown-divider"></div>
                <a href="/logout" class="pf-dropdown-item danger">
                    <i class="ti ti-logout"></i> Logout
                </a>
            </div>
        </div>
    </div>

    <!-- Page header -->
    <div class="pf-hero">
        <h2>💳 Payment <span>Management</span></h2>
        <p>View and manage all your payments</p>
    </div>

    <!-- Add payment button -->
    <div style="padding:16px 24px;">
        <a href="/payments/add" class="btn btn-primary"
           style="background:#1a6dff; color:#fff; padding:10px 20px;
                  border-radius:8px; text-decoration:none; font-size:13px;">
            + Add New Payment
        </a>
    </div>

    <!-- Payments table -->
    <div style="padding:0 24px 24px;">
        <div class="pf-card">
            <h4 style="margin-bottom:16px;">All Payments</h4>

            <c:choose>
                <c:when test="${not empty payments}">
                    <table class="data-table">
                        <thead>
                            <tr>
                                <th>ID</th>
                                <th>Member</th>
                                <th>Amount</th>
                                <th>Description</th>
                                <th>Date</th>
                                <th>Status</th>
                                <th>Actions</th>
                            </tr>
                        </thead>
                        <tbody>
                            <c:forEach var="payment" items="${payments}">
                                <tr>
                                    <td>${payment.id}</td>
                                    <td>${payment.userId}</td>
                                    <td>$${payment.amount}</td>
                                    <td>${payment.description}</td>
                                    <td>${payment.date}</td>
                                    <td>
                                        <c:choose>
                                            <c:when test="${payment.status == 'Paid'}">
                                                <span class="pf-badge paid">Paid</span>
                                            </c:when>
                                            <c:otherwise>
                                                <span class="pf-badge pending">Pending</span>
                                            </c:otherwise>
                                        </c:choose>
                                    </td>
                                    <td>
                                        <a href="/payments/edit/${payment.id}"
                                           style="background:#1a6dff; color:#fff; padding:5px 12px;
                                                  border-radius:6px; text-decoration:none; font-size:12px;
                                                  margin-right:6px;">
                                            Edit
                                        </a>
                                        <a href="/payments/delete/${payment.id}"
                                           style="background:#e74c3c; color:#fff; padding:5px 12px;
                                                  border-radius:6px; text-decoration:none; font-size:12px;"
                                           onclick="return confirm('Are you sure you want to delete this payment?')">
                                            Delete
                                        </a>
                                    </td>
                                </tr>
                            </c:forEach>
                        </tbody>
                    </table>
                </c:when>
                <c:otherwise>
                    <div style="text-align:center; padding:40px; color:#444;">
                        <p style="font-size:14px;">No payments found</p>
                        <a href="/payments/add"
                           style="color:#1a6dff; font-size:13px;">Add your first payment</a>
                    </div>
                </c:otherwise>
            </c:choose>
        </div>
    </div>
</div>

<script>
    document.getElementById('profileBtn').onclick = function(e) {
        e.stopPropagation();
        document.getElementById('profileDropdown').classList.toggle('open');
        document.getElementById('menuDropdown').classList.remove('open');
    };
    document.getElementById('menuBtn').onclick = function(e) {
        e.stopPropagation();
        document.getElementById('menuDropdown').classList.toggle('open');
        document.getElementById('profileDropdown').classList.remove('open');
    };
    document.addEventListener('click', function() {
        document.getElementById('profileDropdown').classList.remove('open');
        document.getElementById('menuDropdown').classList.remove('open');
    });
</script>

</body>
</html>