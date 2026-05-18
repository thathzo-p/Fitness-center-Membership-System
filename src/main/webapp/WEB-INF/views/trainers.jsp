<%@ page import="java.util.List" %>
<%@ page import="com.fitnessmembership.fitnessmembership.model.Trainer" %>

<!DOCTYPE html>
<html>
<head>

    <script>
        if (localStorage.getItem("sidebarCollapsed") === "true") {
            document.documentElement.classList.add("sidebar-is-collapsed");
        }
    </script>
    <title>Our Trainers</title>

    <link rel="stylesheet"
          href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.1/css/all.min.css">

    <link rel="stylesheet"
          href="${pageContext.request.contextPath}/css/dashboard.css">

    <link rel="stylesheet"
          href="${pageContext.request.contextPath}/css/trainer.css">
</head>

<body>

<jsp:include page="components/sidebar.jsp" />

<div class="main-content" id="mainContent">

    <div class="page-title">
        <h1>Our Expert Trainers</h1>
        <p>Choose a trainer and hire them for personal coaching.</p>
    </div>

    <div class="trainer-grid">

        <%
            List<Trainer> trainers =
                    (List<Trainer>) request.getAttribute("trainers");

            if (trainers != null) {
                for (Trainer t : trainers) {
        %>

        <div class="trainer-card">

            <img src="${pageContext.request.contextPath}/images/<%= t.getImage() %>"
                 alt="Trainer">

            <h2><%= t.getName() %></h2>
            <h4><%= t.getSpecialty() %></h4>

            <p><%= t.getDescription() %></p>

            <div class="trainer-meta">
                <div>
                    <strong><%= t.getRating() %></strong>
                    <span>Rating</span>
                </div>

                <div>
                    <strong><%= t.getClients() %>+</strong>
                    <span>Clients</span>
                </div>
            </div>

            <form action="/trainer-hire/hire" method="post" class="hire-form">

                <input type="hidden"
                       name="trainerName"
                       value="<%= t.getName() %>">

                <select name="packageType" required>
                    <option value="Weekly">1 Week Personal Training - $100</option>
                    <option value="Monthly">1 Month Personal Training - $250</option>
                </select>

                <button type="submit">
                    Hire Trainer
                </button>

            </form>

        </div>

        <%
                }
            }
        %>

    </div>

</div>

</body>
</html>