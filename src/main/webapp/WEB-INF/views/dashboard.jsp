<!DOCTYPE html>
<html>
<head>
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

<div class="sidebar" id="sidebar">

    <div class="sidebar-header">

        <div class="logo">
            Fit<span>Club</span>
        </div>

        <button class="menu-toggle"
                onclick="toggleSidebar()">
            <i class="fa-solid fa-bars"></i>
        </button>

    </div>

    <ul>

        <li>
            <a class="active" href="/dashboard">
                <i class="fa-solid fa-house"></i>
                <span>Dashboard</span>
            </a>
        </li>

        <li>
            <a href="/trainers">
                <i class="fa-solid fa-user-group"></i>
                <span>Trainers</span>
            </a>
        </li>

        <li>
            <a href="/plans">
                <i class="fa-solid fa-dumbbell"></i>
                <span>Plans</span>
            </a>
        </li>

        <li>
            <a href="/booking/my">
                <i class="fa-solid fa-calendar-check"></i>
                <span>Bookings</span>
            </a>
        </li>

        <li>
            <a href="/progress">
                <i class="fa-solid fa-chart-line"></i>
                <span>Progress</span>
            </a>
        </li>

        <li>
            <a href="/reviews">
                <i class="fa-solid fa-star"></i>
                <span>Reviews</span>
            </a>
        </li>

        <li>
            <a href="/payments">
                <i class="fa-solid fa-credit-card"></i>
                <span>My Payments</span>
            </a>
        </li>

    </ul>

</div>

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
                <h2>Your Fitness Progress</h2>
                <a href="/progress">View Full Progress</a>
            </div>

            <div class="progress-summary">
                <div class="summary-card">
                    <span>Current Weight</span>
                    <h2>72.0 kg</h2>
                    <p>Latest entry</p>
                </div>

                <div class="summary-card">
                    <span>BMI Score</span>
                    <h2>23.51</h2>
                    <p class="green">Healthy Range</p>
                </div>

                <div class="summary-card">
                    <span>Gym Days</span>
                    <h2>12</h2>
                    <p class="green">This month</p>
                </div>

                <div class="summary-card glow">
                    <span>Gym Streak</span>
                    <h2>7 Days</h2>
                    <p>Keep it up!</p>
                </div>
            </div>

            <div class="chart-grid dashboard-charts">
                <div class="chart-card">
                    <h2>Weight Progress</h2>
                    <canvas id="dashWeightChart"></canvas>
                </div>

                <div class="chart-card">
                    <h2>Gym Attendance</h2>
                    <canvas id="dashGymChart"></canvas>
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

        <div class="activity-card">
            <h2>Latest Reviews</h2>

            <div class="activity">
                <strong>Excellent trainers</strong>
                <span>The trainers are friendly and professional.</span>
            </div>

            <div class="activity">
                <strong>Great equipment</strong>
                <span>Modern gym machines and clean environment.</span>
            </div>

            <div class="activity">
                <strong>Best plans</strong>
                <span>Workout and meal plans helped me improve fast.</span>
            </div>

        </div>

    </div>

</div>

<script>
    function toggleSidebar(){
        document.getElementById("sidebar").classList.toggle("collapsed");
        document.getElementById("mainContent").classList.toggle("expand-content");
    }

    function toggleProfileMenu(){
        document.getElementById("profileDropdown").classList.toggle("show");
    }

    new Chart(document.getElementById("dashWeightChart"), {
        type: "line",
        data: {
            labels: ["Feb", "Mar", "Apr", "May"],
            datasets: [{
                label: "Weight",
                data: [76, 75, 73.5, 72],
                borderColor: "#ff3131",
                backgroundColor: "rgba(255,49,49,0.2)",
                fill: true,
                tension: 0.4
            }]
        },
        options: {
            responsive: true,
            maintainAspectRatio: false
        }
    });

    new Chart(document.getElementById("dashGymChart"), {
        type: "bar",
        data: {
            labels: ["Week 1", "Week 2", "Week 3", "Week 4"],
            datasets: [{
                label: "Gym Days",
                data: [3, 4, 2, 3],
                backgroundColor: "#ff3131"
            }]
        },
        options: {
            responsive: true,
            maintainAspectRatio: false
        }
    });
</script>

</body>
</html>