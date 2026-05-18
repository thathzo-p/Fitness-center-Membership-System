<%@ page import="java.util.List" %>
<%@ page import="com.fitnessmembership.fitnessmembership.model.Booking" %>
<%@ page import="com.fitnessmembership.fitnessmembership.model.TrainerHire" %>
<%@ page import="com.fitnessmembership.fitnessmembership.model.Payment" %>

<!DOCTYPE html>
<html>
<head>

    <script>
        if (localStorage.getItem("sidebarCollapsed") === "true") {
            document.documentElement.classList.add("sidebar-is-collapsed");
        }
    </script>
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

                </div>

                <!-- ADD MY ACTIVE PLANS SECTION HERE -->

                <div class="plan-section">

                    <div class="plan-header">
                        <h1>My Active Plans</h1>
                        <p>Your approved workout and meal plans.</p>
                    </div>

                    <div class="active-plan-grid">

                        <%
                            List<Payment> approvedPlans =
                                    (List<Payment>) request.getAttribute("approvedPlans");

                            if(approvedPlans != null && !approvedPlans.isEmpty()){
                                for(Payment p : approvedPlans){
                        %>

                        <div class="active-plan-card">

                            <div class="plan-badge">Plan Active</div>

                            <h2><%= p.getDescription() %></h2>

                            <div class="active-plan-details">

                                <div>
                                    <span>Amount</span>
                                    <strong>$<%= p.getAmount() %></strong>
                                </div>

                                <div>
                                    <span>Date</span>
                                    <strong><%= p.getDate() %></strong>
                                </div>

                                <div>
                                    <span>Status</span>
                                    <strong><%= p.getStatus() %></strong>
                                </div>

                            </div>

                            <p>
                                Your selected plan has been approved and is now active in your FitClub account.
                            </p>

                        </div>

                        <%
                                }
                            } else {
                        %>

                        <div class="active-plan-empty">
                            <h2>No Active Plans Yet</h2>
                            <p>Your approved plans will appear here after admin approval.</p>
                        </div>
                        <%
                            }
                        %>
                    </div>

        <div class="booking-grid">

            <%
                List<Booking> bookings =
                        (List<Booking>) request.getAttribute("bookings");

                if(bookings != null && !bookings.isEmpty()){
            %>

            <div class="class-booking-title">
                <h1>My Class Bookings</h1>
                <p>Your gym classes and workout session bookings.</p>
            </div>

            <div class="booking-grid">

                <%
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
                %>

            </div>

            <%
                }
            %>
    </div>
</div>
</body>
</html>