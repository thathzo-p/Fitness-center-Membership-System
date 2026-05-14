<%@ page import="java.util.List" %>
<%@ page import="com.fitnessmembership.fitnessmembership.model.MemberProgress" %>

<!DOCTYPE html>
<html>
<head>
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

        <a href="/progress/add" class="progress-btn">
            Add Progress
        </a>
    </div>

    <div class="progress-grid">

        <%
            List<MemberProgress> progressList =
                    (List<MemberProgress>) request.getAttribute("progressList");

            if(progressList != null && !progressList.isEmpty()) {
                for(MemberProgress p : progressList) {
        %>

        <div class="progress-card">

            <div class="progress-top">
                <h2><%= p.getDate() %></h2>
                <span>BMI <%= p.getBmi() %></span>
            </div>

            <div class="progress-stats">
                <div>
                    <h3><%= p.getWeight() %> kg</h3>
                    <p>Weight</p>
                </div>

                <div>
                    <h3><%= p.getHeight() %> cm</h3>
                    <p>Height</p>
                </div>

                <div>
                    <h3><%= p.getGymDays() %></h3>
                    <p>Gym Days</p>
                </div>
            </div>

            <p class="notes">
                <%= p.getNotes() %>
            </p>

            <div class="progress-actions">
                <a href="/progress/edit/<%= p.getProgressId() %>" class="edit-progress">
                    Edit
                </a>

                <a href="/progress/delete/<%= p.getProgressId() %>" class="delete-progress">
                    Delete
                </a>
            </div>

        </div>

        <%
                }
            } else {
        %>

        <div class="empty-progress">
            <h2>No Progress Added Yet</h2>
            <p>Add your first progress record to start tracking your fitness journey.</p>
            <a href="/progress/add">Add First Progress</a>
        </div>

        <%
            }
        %>

    </div>

</div>

<script>
    function toggleSidebar(){
        document.getElementById("sidebar").classList.toggle("collapsed");
        document.getElementById("mainContent").classList.toggle("expand-content");
    }
</script>

</body>
</html>