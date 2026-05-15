<%@ page import="java.util.List" %>
<%@ page import="com.fitnessmembership.fitnessmembership.model.MemberProgress" %>

<%
    List<MemberProgress> progressList = (List<MemberProgress>) request.getAttribute("progressList");
%>
<!DOCTYPE html>
<html>
<head>

    <script src="https://cdn.jsdelivr.net/npm/chart.js"></script>
    <title>My Progress</title>

    <link rel="stylesheet"
          href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.1/css/all.min.css">

    <link rel="stylesheet"
          href="${pageContext.request.contextPath}/css/dashboard.css">

    <link rel="stylesheet"
          href="${pageContext.request.contextPath}/css/progress.css">
</head>

<body>

<jsp:include page="components/sidebar.jsp" />

<div class="main-content" id="mainContent">

    <div class="progress-header">
        <div>
            <h1>My Fitness Progress</h1>
            <p>Track your weight, BMI and monthly gym attendance.</p>
        </div>

        <a href="/progress/add" class="add-progress-btn">+ Add Progress</a>
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
            <span>Gym Days This Month</span>
            <h2>12</h2>
            <p class="green">Keep going</p>
        </div>

        <div class="summary-card">
            <span>Gym Streak</span>
            <h2>7 Days</h2>
            <p>Keep it up!</p>
        </div>
    </div>

    <div class="chart-grid">
        <div class="chart-card">
            <h2>Weight Progress</h2>
            <canvas id="weightChart"></canvas>
        </div>

        <div class="chart-card">
            <h2>Gym Attendance</h2>
            <canvas id="gymChart"></canvas>
        </div>
    </div>

    <div class="progress-history">
        <div class="history-header">
            <div>
                <h2>Progress History</h2>
                <p>Your saved progress records</p>
            </div>
        </div>

        <div class="history-table">
            <div class="history-row history-head">
                <span>Date</span>
                <span>Weight</span>
                <span>Height</span>
                <span>BMI</span>
                <span>Gym Days</span>
                <span>Notes</span>
                <span>Actions</span>
            </div>

            <%

                if(progressList != null && !progressList.isEmpty()){
                    for(MemberProgress p : progressList){
            %>

            <div class="history-row">
                <span><%= p.getDate() %></span>
                <span><strong><%= p.getWeight() %></strong> kg</span>
                <span><strong><%= p.getHeight() %></strong> cm</span>
                <span><b class="bmi-pill"><%= p.getBmi() %></b></span>
                <span><%= p.getGymDays() %> days</span>
                <span><%= p.getNotes() %></span>
                <span class="history-actions">
                    <a href="/progress/edit/<%= p.getProgressId() %>" class="edit-progress">Edit</a>
                    <a href="/progress/delete/<%= p.getProgressId() %>" class="delete-progress">Delete</a>
                </span>
            </div>

            <%
                    }
                } else {
            %>

            <div class="empty-progress">
                <h3>No Progress Added Yet</h3>
                <p>Add your first progress record to start tracking.</p>
            </div>

            <%
                }
            %>
        </div>
    </div>

</div>

<script>
    function toggleSidebar(){
        document.getElementById("sidebar").classList.toggle("collapsed");
        document.getElementById("mainContent").classList.toggle("expand-content");
    }
        const weightLabels = [
            <%
                if(progressList != null){
                    for(MemberProgress p : progressList){
            %>
            "<%= p.getDate() %>",
            <%
                    }
                }
            %>
        ];

        const weightData = [
            <%
                if(progressList != null){
                    for(MemberProgress p : progressList){
            %>
            <%= p.getWeight() %>,
            <%
                    }
                }
            %>
        ];

        new Chart(document.getElementById("weightChart"), {
            type: "line",
            data: {
                labels: weightLabels,
                datasets: [{
                    label: "Weight",
                    data: weightData,
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

    new Chart(document.getElementById("gymChart"), {
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