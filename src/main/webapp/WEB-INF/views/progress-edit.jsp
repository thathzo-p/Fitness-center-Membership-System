<%@ page import="com.fitnessmembership.fitnessmembership.model.MemberProgress" %>

<%
    MemberProgress progress =
            (MemberProgress) request.getAttribute("progress");
%>

<!DOCTYPE html>
<html>
<head>
    <title>Edit Progress</title>

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

    <div class="progress-form-card">

        <h1>Edit Progress</h1>
        <p>Update your fitness progress record.</p>

        <form action="/progress/edit" method="post">

            <input type="hidden"
                   name="progressId"
                   value="<%= progress.getProgressId() %>">

            <input type="date"
                   name="date"
                   value="<%= progress.getDate() %>"
                   required>

            <input type="number"
                   step="0.1"
                   name="weight"
                   value="<%= progress.getWeight() %>"
                   required>

            <input type="number"
                   step="0.1"
                   name="height"
                   value="<%= progress.getHeight() %>"
                   required>

            <input type="number"
                   name="gymDays"
                   value="<%= progress.getGymDays() %>"
                   required>

            <textarea name="notes" required><%= progress.getNotes() %></textarea>

            <button type="submit">
                Update Progress
            </button>

        </form>

        <a href="/progress" class="back-link">
            Back to Progress
        </a>

    </div>

</div>

</body>
</html>