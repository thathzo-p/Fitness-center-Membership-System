<%@ page import="java.util.List" %>
<%@ page import="com.fitnessmembership.fitnessmembership.model.MemberProgress" %>
<%@ page import="com.fitnessmembership.fitnessmembership.model.Review" %>

<%
    List<MemberProgress> progressList =
            (List<MemberProgress>) request.getAttribute("progressList");

    MemberProgress latestProgress =
            (MemberProgress) request.getAttribute("latestProgress");
%>

<!DOCTYPE html>
<html>
<head>

    <script>
        if (localStorage.getItem("sidebarCollapsed") === "true") {
            document.documentElement.classList.add("sidebar-is-collapsed");
        }
    </script>

    <title>Member Dashboard</title>

    <script src="https://cdn.jsdelivr.net/npm/chart.js"></script>
    <link rel="stylesheet"
          href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.0/css/all.min.css">

    <link rel="stylesheet"
          href="${pageContext.request.contextPath}/css/dashboard.css">

    <link rel="stylesheet"
          href="${pageContext.request.contextPath}/css/progress.css">
</head>

<body>

<jsp:include page="components/sidebar.jsp" />

<div class="main-content" id="mainContent">

    <div class="topbar">

        <div>
            <h1>Welcome to FitClub</h1>
            <p>Your personal fitness space, plans, trainers and progress in one place.</p>
        </div>

        <div class="profile-wrapper">

            <div class="profile-box" onclick="toggleProfileMenu()">
                <div class="profile-icon">T</div>

                <div>
                    <h4>Thathsuka</h4>
                    <span>Member</span>
                </div>
            </div>

            <div class="profile-dropdown" id="profileDropdown">
                <a href="/profile">My Profile</a>
                <a href="/plans">My Membership</a>
                <a href="/logout" class="logout-link">Logout</a>
            </div>

        </div>

    </div>

    <div class="hero-dashboard">

        <div>
            <h2>Start Your Fitness Journey Today</h2>

            <p>
                Explore workout plans, meal plans, expert trainers and track your fitness
                progress with FitClub.
            </p>

            <div class="hero-actions">
                <a href="/plans">Choose Plan</a>
                <a href="/trainers">Meet Trainers</a>
            </div>
        </div>

    </div>

    <div class="cards">

        <div class="card">
            <p>Expert Trainers</p>
            <h2>15+</h2>
            <span>Certified professionals</span>
        </div>

        <div class="card">
            <p>Workout Plans</p>
            <h2>20+</h2>
            <span>For every fitness goal</span>
        </div>

        <div class="card">
            <p>Happy Members</p>
            <h2>2,450+</h2>
            <span>Growing fitness community</span>
        </div>

        <div class="card">
            <p>Average Rating</p>
            <h2>4.9</h2>
            <span>Based on member reviews</span>
        </div>

    </div>

    <div class="dashboard-progress-preview">

        <div class="progress-preview-header">
            <div>
                <h2>Your Fitness Progress</h2>
                <p>Latest updates from your personal progress reports.</p>
            </div>

            <a href="/progress">
                View Full Progress
                <i class="fa-solid fa-arrow-right"></i>
            </a>
        </div>

        <div class="dashboard-progress-cards">

            <div class="dashboard-progress-card">
                <span>Latest Weight</span>
                <h3>
                    <%= latestProgress != null ? latestProgress.getWeight() + " kg" : "--" %>
                </h3>
                <p>From your latest report</p>
            </div>

            <div class="dashboard-progress-card">
                <span>Latest BMI</span>
                <h3>
                    <%= latestProgress != null ? latestProgress.getBmi() : "--" %>
                </h3>
                <p>Current BMI record</p>
            </div>

            <div class="dashboard-progress-card">
                <span>Gym Days</span>
                <h3>
                    <%= latestProgress != null ? latestProgress.getGymDays() + " Days" : "--" %>
                </h3>
                <p>Latest monthly attendance</p>
            </div>

        </div>

        <div class="dashboard-progress-charts">

            <div class="dashboard-chart-card">
                <h3>
                    <i class="fa-solid fa-weight-scale"></i>
                    Weight Progress
                </h3>
                <div class="dashboard-chart-box">
                    <canvas id="dashWeightChart"></canvas>
                </div>
            </div>

            <div class="dashboard-chart-card">
                <h3>
                    <i class="fa-solid fa-heart-pulse"></i>
                    BMI Progress
                </h3>
                <div class="dashboard-chart-box">
                    <canvas id="dashBmiChart"></canvas>
                </div>
            </div>

            <div class="dashboard-chart-card">
                <h3>
                    <i class="fa-solid fa-calendar-check"></i>
                    Gym Attendance
                </h3>
                <div class="dashboard-chart-box">
                    <canvas id="dashGymChart"></canvas>
                </div>
            </div>

        </div>

    </div>

    <div class="dashboard-grid">

        <div class="activity-card">
            <h2>Recommended For You</h2>

            <div class="activity">
                <strong>Premium Workout Plan</strong>
                <span>Best for strength, fat loss and progress tracking.</span>
            </div>

            <div class="activity">
                <strong>Muscle Gain Meal Plan</strong>
                <span>High protein diet plan for better results.</span>
            </div>

            <div class="activity">
                <strong>Trainer: Mike Johnson</strong>
                <span>Strength training specialist with 4.9 rating.</span>
            </div>

        </div>

        <%@ page import="java.util.List" %>
        <%@ page import="com.fitnessmembership.fitnessmembership.model.Review" %>

        <%
            List<Review> latestReviews =
                    (List<Review>) request.getAttribute("latestReviews");
        %>

        <div class="activity-card">
            <h2>Latest Reviews</h2>

            <%
                if (latestReviews != null && !latestReviews.isEmpty()) {
                    for (Review review : latestReviews) {
            %>

            <div class="activity">
                <strong><%= review.getMemberName() %></strong>
                <span><%= review.getComment() %></span>
            </div>

            <%
                    }
                } else {
            %>

            <div class="activity">
                <strong>No reviews yet</strong>
                <span>Member reviews will appear here.</span>
            </div>

            <%
                }
            %>
        </div>

    </div>

</div>

<script>

    function toggleProfileMenu(){
        document.getElementById("profileDropdown").classList.toggle("show");
    }

    const dashboardProgressLabels = [
        <%
            if (progressList != null) {
                for (MemberProgress p : progressList) {
        %>
        "<%= p.getDate() %>",
        <%
                }
            }
        %>
    ];

    const dashboardWeightData = [
        <%
            if (progressList != null) {
                for (MemberProgress p : progressList) {
        %>
        <%= p.getWeight() %>,
        <%
                }
            }
        %>
    ];

    const dashboardBmiData = [
        <%
            if (progressList != null) {
                for (MemberProgress p : progressList) {
        %>
        <%= p.getBmi() %>,
        <%
                }
            }
        %>
    ];

    const dashboardGymData = [
        <%
            if (progressList != null) {
                for (MemberProgress p : progressList) {
        %>
        <%= p.getGymDays() %>,
        <%
                }
            }
        %>
    ];

    function createDashboardLineChart(canvasId, labels, data, label, borderColor, backgroundColor) {
        const chartCanvas = document.getElementById(canvasId);

        if (!chartCanvas) return;

        new Chart(chartCanvas, {
            type: "line",
            data: {
                labels: labels,
                datasets: [{
                    label: label,
                    data: data,
                    borderColor: borderColor,
                    backgroundColor: backgroundColor,
                    fill: true,
                    tension: 0.4,
                    borderWidth: 3,
                    pointRadius: 4,
                    pointHoverRadius: 6
                }]
            },
            options: {
                responsive: true,
                maintainAspectRatio: false,
                plugins: {
                    legend: {
                        labels: {
                            color: "#d1d5db"
                        }
                    }
                },
                scales: {
                    x: {
                        ticks: {
                            color: "#94a3b8"
                        },
                        grid: {
                            color: "rgba(255,255,255,0.05)"
                        }
                    },
                    y: {
                        ticks: {
                            color: "#94a3b8"
                        },
                        grid: {
                            color: "rgba(255,255,255,0.05)"
                        }
                    }
                }
            }
        });
    }

    function createDashboardBarChart(canvasId, labels, data) {
        const chartCanvas = document.getElementById(canvasId);

        if (!chartCanvas) return;

        new Chart(chartCanvas, {
            type: "bar",
            data: {
                labels: labels,
                datasets: [{
                    label: "Gym Days",
                    data: data,
                    backgroundColor: "rgba(255,49,49,0.85)",
                    borderRadius: 10
                }]
            },
            options: {
                responsive: true,
                maintainAspectRatio: false,
                plugins: {
                    legend: {
                        labels: {
                            color: "#d1d5db"
                        }
                    }
                },
                scales: {
                    x: {
                        ticks: {
                            color: "#94a3b8"
                        },
                        grid: {
                            color: "rgba(255,255,255,0.05)"
                        }
                    },
                    y: {
                        ticks: {
                            color: "#94a3b8"
                        },
                        grid: {
                            color: "rgba(255,255,255,0.05)"
                        }
                    }
                }
            }
        });
    }

    createDashboardLineChart(
        "dashWeightChart",
        dashboardProgressLabels,
        dashboardWeightData,
        "Weight",
        "#b146ff",
        "rgba(177,70,255,0.18)"
    );

    createDashboardLineChart(
        "dashBmiChart",
        dashboardProgressLabels,
        dashboardBmiData,
        "BMI",
        "#2f7cff",
        "rgba(47,124,255,0.18)"
    );

    createDashboardBarChart(
        "dashGymChart",
        dashboardProgressLabels,
        dashboardGymData
    );


</script>

</body>
</html>