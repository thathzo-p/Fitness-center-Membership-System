<!DOCTYPE html>
<html>
<head>
    <title>Add Review</title>

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

    <div class="review-form-card">

        <h1>Add Review</h1>
        <p>Share your experience with FitClub.</p>

        <form action="/reviews/add" method="post">

            <label>Your Rating</label>

            <select name="rating" required>
                <option value="">Select Rating</option>
                <option value="5">5 Stars - Excellent</option>
                <option value="4">4 Stars - Very Good</option>
                <option value="3">3 Stars - Good</option>
                <option value="2">2 Stars - Average</option>
                <option value="1">1 Star - Poor</option>
            </select>

            <textarea name="comment"
                      placeholder="Write your review..."
                      required></textarea>

            <button type="submit">Submit Review</button>

        </form>

        <a href="/reviews" class="back-link">Back to Reviews</a>

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