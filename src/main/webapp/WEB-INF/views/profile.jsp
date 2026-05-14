<%@ page import="com.fitnessmembership.fitnessmembership.model.UserManagement" %>

<%
    UserManagement user =
            (UserManagement) request.getAttribute("user");
%>

<!DOCTYPE html>
<html>
<head>

    <link rel="stylesheet"
          href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.1/css/all.min.css">

    <link rel="stylesheet"
          href="${pageContext.request.contextPath}/css/dashboard.css">
    <title>My Profile</title>

    <link rel="stylesheet"
          href="${pageContext.request.contextPath}/css/dashboard.css">

    <link rel="stylesheet"
          href="${pageContext.request.contextPath}/css/profile.css">
</head>

<body>

<jsp:include page="components/sidebar.jsp" />
<div class="main-content" id="mainContent">

<div class="profile-page">

    <div class="profile-card">

        <div class="profile-avatar">
            <%= user.getFullName().substring(0,1).toUpperCase() %>
        </div>

        <h1><%= user.getFullName() %></h1>
        <p>@<%= user.getUsername() %></p>

        <div class="profile-info">

            <div>
                <span>Email</span>
                <strong><%= user.getEmail() %></strong>
            </div>

            <div>
                <span>Birthday</span>
                <strong><%= user.getBirthday() %></strong>
            </div>

            <div>
                <span>Phone</span>
                <strong><%= user.getCountryCode() %> <%= user.getPhone() %></strong>
            </div>

            <div>
                <span>Gender</span>
                <strong><%= user.getGender() %></strong>
            </div>

            <div>
                <span>Role</span>
                <strong><%= user.getRole() %></strong>
            </div>

        </div>

        <a href="/dashboard" class="back-btn">
            Back to Dashboard
        </a>

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