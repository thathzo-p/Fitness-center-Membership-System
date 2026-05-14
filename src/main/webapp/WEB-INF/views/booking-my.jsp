<%@ page import="java.util.List" %>
<%@ page import="com.fitnessmembership.fitnessmembership.model.Booking" %>
<%@ page import="com.fitnessmembership.fitnessmembership.model.TrainerHire" %>

<!DOCTYPE html>
<html>
<head>
    <title>My Bookings</title>

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

    <div class="booking-page">

        <div class="booking-header">
            <div>
                <h1>My Bookings</h1>
                <p>Manage your fitness classes, training sessions and personal trainers.</p>
            </div>

            <a href="/trainers" class="booking-btn">View Trainers</a>
        </div>

        <div class="hire-section">

            <div class="hire-header">
                <h1>My Personal Trainers</h1>
                <p>Your hired trainers and personal coaching packages.</p>
            </div>

            <div class="hire-grid">

                <%
                    List<TrainerHire> trainerHires =
                            (List<TrainerHire>) request.getAttribute("trainerHires");

                    if(trainerHires != null && !trainerHires.isEmpty()){
                        for(TrainerHire h : trainerHires){
                %>

                <div class="hire-card">

                    <div class="hire-badge">Personal Training Active</div>

                    <h2><%= h.getTrainerName() %></h2>

                    <div class="hire-details">
                        <div>
                            <span>Package</span>
                            <strong><%= h.getPackageType() %></strong>
                        </div>

                        <div>
                            <span>Price</span>
                            <strong>$<%= h.getPrice() %></strong>
                        </div>

                        <div>
                            <span>Status</span>
                            <strong><%= h.getStatus() %></strong>
                        </div>
                    </div>

                    <p>
                        Your trainer will guide you personally according to your selected workout plan.
                    </p>

                </div>

                <%
                        }
                    } else {
                %>

                <div class="hire-empty">
                    <h2>No Personal Trainer Hired</h2>
                    <p>Your hired trainer will appear here after you hire one from the Trainers page.</p>
                </div>

                <%
                    }
                %>

            </div>

        </div>

        <div class="class-booking-title">
            <h1>My Class Bookings</h1>
            <p>Your gym classes and workout session bookings.</p>
        </div>

        <div class="booking-grid">

            <%
                List<Booking> bookings =
                        (List<Booking>) request.getAttribute("bookings");

                if(bookings != null && !bookings.isEmpty()){
                    for(Booking b : bookings){
            %>

            <div class="booking-card">

                <div class="booking-top">
                    <h2><%= b.getFitnessClass() %></h2>
                    <span class="status"><%= b.getStatus() %></span>
                </div>

                <p><strong>Member:</strong> <%= b.getMemberName() %></p>
                <p><strong>Date:</strong> <%= b.getDate() %></p>
                <p><strong>Time:</strong> <%= b.getTimeSlot() %></p>
                <p><strong>Booking ID:</strong> <%= b.getBookingId() %></p>

                <div class="booking-actions">
                    <a href="/booking/edit/<%= b.getBookingId() %>" class="edit-booking">Edit</a>
                    <a href="/booking/cancel/<%= b.getBookingId() %>" class="cancel-booking">Cancel</a>
                </div>

            </div>

            <%
                    }
                } else {
            %>

            <div class="empty-card">
                <h2>No Class Bookings Yet</h2>
                <p>You have not booked any workout sessions yet.</p>
                <a href="/booking/new">Create Your First Booking</a>
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
</script>

</body>
</html>