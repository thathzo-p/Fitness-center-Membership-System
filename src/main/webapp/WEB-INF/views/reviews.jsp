<%@ page import="java.util.List" %>
<%@ page import="com.fitnessmembership.fitnessmembership.model.Review" %>

<!DOCTYPE html>
<html>
<head>

    <script>
        if (localStorage.getItem("sidebarCollapsed") === "true") {
            document.documentElement.classList.add("sidebar-is-collapsed");
        }
    </script>
    <title>Reviews</title>

    <link rel="stylesheet"
          href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.1/css/all.min.css">

    <link rel="stylesheet"
          href="${pageContext.request.contextPath}/css/dashboard.css">

    <link rel="stylesheet"
          href="${pageContext.request.contextPath}/css/review.css">
</head>

<body>

<jsp:include page="components/sidebar.jsp" />

<div class="main-content" id="mainContent">

    <div class="review-header">
        <div>
            <h1>Member Reviews</h1>
            <p>See what our members say about FitClub.</p>
        </div>

        <a href="/reviews/add" class="review-btn">Add Review</a>
    </div>

    <div class="reviews-grid">

        <%
            List<Review> reviews =
                    (List<Review>) request.getAttribute("reviews");

            if (reviews != null && !reviews.isEmpty()) {
                for (Review r : reviews) {
        %>

        <div class="review-card">

            <div class="review-top">
                <div class="review-avatar">
                    <%= r.getMemberName().substring(0,1).toUpperCase() %>
                </div>

                <div>
                    <h2><%= r.getMemberName() %></h2>
                    <span><%= r.getDate() %></span>
                </div>
            </div>

            <p><%= r.getComment() %></p>

        </div>

        <%
                }
            } else {
        %>

        <div class="empty-review">
            <h2>No Reviews Yet</h2>
            <p>Be the first member to add a review.</p>
            <a href="/reviews/add">Add Review</a>
        </div>

        <%
            }
        %>

    </div>

</div>

</body>
</html>