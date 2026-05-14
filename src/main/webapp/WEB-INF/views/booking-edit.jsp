<%@ page import="com.fitnessmembership.fitnessmembership.model.Booking" %>

<%
    Booking booking =
            (Booking) request.getAttribute("booking");
%>

<!DOCTYPE html>
<html>
<head>
    <title>Edit Booking</title>

    <link rel="stylesheet"
          href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.1/css/all.min.css">

    <link rel="stylesheet"
          href="${pageContext.request.contextPath}/css/dashboard.css">

    <link rel="stylesheet"
          href="${pageContext.request.contextPath}/css/booking.css">
</head>

<body>

<jsp:include page="components/sidebar.jsp" />

<div class="main-content" id="mainContent">

    <div class="booking-form-page">

        <div class="booking-form-card">

            <h1>Edit Booking</h1>
            <p>Update your fitness session details.</p>

            <form action="/booking/update" method="post">

                <input type="hidden"
                       name="bookingId"
                       value="<%= booking.getBookingId() %>">

                <select name="fitnessClass" required>
                    <option><%= booking.getFitnessClass() %></option>
                    <option>Strength Training</option>
                    <option>Yoga Session</option>
                    <option>Cardio Training</option>
                    <option>HIIT Workout</option>
                    <option>Personal Training</option>
                    <option>Zumba Class</option>
                </select>

                <input type="date"
                       name="date"
                       value="<%= booking.getDate() %>"
                       required>

                <select name="timeSlot" required>
                    <option><%= booking.getTimeSlot() %></option>
                    <option>06:00 AM</option>
                    <option>08:00 AM</option>
                    <option>10:00 AM</option>
                    <option>04:00 PM</option>
                    <option>06:00 PM</option>
                    <option>08:00 PM</option>
                </select>

                <button type="submit">
                    Update Booking
                </button>

            </form>

            <a href="/booking/my" class="back-link">
                Back to My Bookings
            </a>

        </div>

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