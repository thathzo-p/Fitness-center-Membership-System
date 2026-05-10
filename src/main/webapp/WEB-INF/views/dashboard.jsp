<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<%@ taglib prefix="fn" uri="jakarta.tags.functions" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>PowerFit - Dashboard</title>
    <link rel="stylesheet" href="/css/dashboard.css">
    <script src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/4.4.0/chart.umd.min.js"></script>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/@tabler/icons-webfont@latest/tabler-icons.min.css">
</head>
<body>

<div class="pf-wrap">

    <!-- Navbar -->
    <div class="pf-nav">
        <span class="pf-logo">Power<span>Fit</span></span>

        <ul class="pf-nav-tabs">
            <li><a href="/dashboard" class="active">Dashboard</a></li>
            <li><a href="/bookings">Bookings</a></li>
            <li><a href="/classes">Classes</a></li>
            <li><a href="/reviews">Reviews</a></li>
        </ul>

        <div class="pf-right">

            <!-- Menu icon -->
            <div class="pf-icon-btn" id="menuBtn" title="Quick menu">
                <i class="ti ti-layout-grid"></i>
            </div>

            <!-- Profile avatar -->
            <div class="pf-avatar" id="profileBtn">
                ${fn:toUpperCase(fn:substring(username, 0, 2))}
            </div>

            <!-- Menu dropdown -->
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

            <!-- Profile dropdown -->
            <div class="pf-dropdown" id="profileDropdown">
                <div class="pf-dropdown-header">
                    <p>${username}</p>
                    <span>${email}</span>
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

    <!-- Welcome -->
    <div class="pf-hero">
        <h2>Welcome back, <span>${username}</span>!</h2>
        <p>Here's your fitness summary for this month</p>
    </div>

    <!-- Stats -->
    <div class="pf-stats">
        <div class="pf-stat">
            <div class="pf-stat-label">Membership</div>
            <div class="pf-stat-value">${membership}</div>
            <div class="pf-stat-sub">Expires ${expiryDate}</div>
        </div>
        <div class="pf-stat blue">
            <div class="pf-stat-label">Gym Days This Month</div>
            <div class="pf-stat-value">${gymDays}</div>
            <div class="pf-stat-sub">Out of ${scheduledDays} scheduled</div>
        </div>
        <div class="pf-stat red">
            <div class="pf-stat-label">Next Payment</div>
            <div class="pf-stat-value">$${nextPayment}</div>
            <div class="pf-stat-sub">Due ${paymentDueDate}</div>
        </div>
    </div>

    <!-- Progress chart -->
    <div class="pf-section-title">Progress overview</div>

    <div class="chart-card">
        <h4>Monthly Progress Chart
            <span>Based on meal plan and gym attendance</span>
        </h4>
        <div class="chart-legend">
            <div class="legend-item">
                <div class="legend-dot" style="background:#1a6dff;"></div>
                Overall Progress
            </div>
            <div class="legend-item">
                <div class="legend-dot" style="background:#fff;"></div>
                Meal Plan
            </div>
            <div class="legend-item">
                <div class="legend-dot" style="background:#e74c3c;"></div>
                Gym Attendance
            </div>
        </div>
        <div class="chart-area">
            <canvas id="progressChart"></canvas>
        </div>

        <!-- Weekly check-in -->
        <div class="check-row">
            <div class="check-section-label">This week — daily check-in</div>
            <div class="check-label-row">
                <span>Mon</span><span>Tue</span><span>Wed</span>
                <span>Thu</span><span>Fri</span><span>Sat</span><span>Sun</span>
            </div>
            <div class="check-row-label">Gym</div>
            <div class="check-grid" id="gymGrid"></div>
            <div class="check-row-label">Meal plan</div>
            <div class="check-grid" id="mealGrid"></div>
        </div>
    </div>

    <!-- Details -->
    <div class="pf-section-title">Your details</div>

    <div class="pf-grid">

        <!-- Recent payments -->
        <div class="pf-card">
            <h4>Recent Payments <a href="/payments">View all</a></h4>
            <c:choose>
                <c:when test="${not empty recentPayments}">
                    <c:forEach var="payment" items="${recentPayments}">
                        <div class="pf-payment-row">
                            <div>
                                <div class="pf-payment-label">${payment.description}</div>
                                <div class="pf-payment-date">${payment.date}</div>
                            </div>
                            <div style="text-align:right;">
                                <div class="pf-payment-amount">$${payment.amount}</div>
                                <c:choose>
                                    <c:when test="${payment.status == 'Paid'}">
                                        <span class="pf-badge paid">${payment.status}</span>
                                    </c:when>
                                    <c:otherwise>
                                        <span class="pf-badge pending">${payment.status}</span>
                                    </c:otherwise>
                                </c:choose>
                            </div>
                        </div>
                    </c:forEach>
                </c:when>
                <c:otherwise>
                    <p style="color:#444; font-size:12px;">No payments yet</p>
                </c:otherwise>
            </c:choose>
        </div>

        <!-- My plans -->
        <div class="pf-card">
            <h4>My Plans <a href="/plans">View all</a></h4>
            <c:choose>
                <c:when test="${not empty myPlans}">
                    <c:forEach var="plan" items="${myPlans}">
                        <div class="pf-plan-item">
                            <div class="pf-plan-icon">${plan.icon}</div>
                            <div>
                                <div class="pf-plan-name">${plan.name}</div>
                                <div class="pf-plan-detail">${plan.detail}</div>
                            </div>
                        </div>
                    </c:forEach>
                </c:when>
                <c:otherwise>
                    <p style="color:#444; font-size:12px;">No plans yet</p>
                </c:otherwise>
            </c:choose>
        </div>

    </div>
</div>

<script>
    // Progress chart
    const ctx = document.getElementById('progressChart').getContext('2d');
    new Chart(ctx, {
        type: 'line',
        data: {
            labels: ['Week 1', 'Week 2', 'Week 3', 'Week 4'],
            datasets: [
                {
                    label: 'Overall Progress',
                    data: [45, 58, 70, 82],
                    borderColor: '#1a6dff',
                    backgroundColor: 'rgba(26,109,255,0.07)',
                    borderWidth: 2,
                    pointBackgroundColor: '#1a6dff',
                    pointRadius: 4,
                    tension: 0.4,
                    fill: true
                },
                {
                    label: 'Meal Plan',
                    data: [60, 65, 75, 80],
                    borderColor: '#ffffff',
                    backgroundColor: 'transparent',
                    borderWidth: 1.5,
                    pointBackgroundColor: '#fff',
                    pointRadius: 3,
                    tension: 0.4,
                    borderDash: [5, 4]
                },
                {
                    label: 'Gym Attendance',
                    data: [30, 50, 62, 78],
                    borderColor: '#e74c3c',
                    backgroundColor: 'transparent',
                    borderWidth: 1.5,
                    pointBackgroundColor: '#e74c3c',
                    pointRadius: 3,
                    tension: 0.4,
                    borderDash: [2, 3]
                }
            ]
        },
        options: {
            responsive: true,
            maintainAspectRatio: false,
            plugins: {
                legend: { display: false },
                tooltip: {
                    backgroundColor: '#0d0d0d',
                    titleColor: '#fff',
                    bodyColor: '#888',
                    borderColor: '#222',
                    borderWidth: 1
                }
            },
            scales: {
                x: {
                    grid: { color: '#141414' },
                    ticks: { color: '#444', font: { size: 10 } }
                },
                y: {
                    min: 0, max: 100,
                    grid: { color: '#141414' },
                    ticks: {
                        color: '#444',
                        font: { size: 10 },
                        callback: function(v) { return v + '%'; }
                    }
                }
            }
        }
    });

    // Check-in grids
    const gymDays  = [true, false, true, true, false, true, false];
    const mealDays = [true, true, true, false, true, true, false];

    function renderGrid(elementId, data, presentClass) {
        const grid = document.getElementById(elementId);
        data.forEach(function(day) {
            const cell = document.createElement('div');
            cell.className = 'check-cell ' + (day ? presentClass : 'check-none');
            cell.textContent = day ? '✓' : '–';
            grid.appendChild(cell);
        });
    }

    renderGrid('gymGrid',  gymDays,  'check-gym');
    renderGrid('mealGrid', mealDays, 'check-meal');

    // Dropdowns
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