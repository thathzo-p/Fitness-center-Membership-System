<%@ page import="java.util.List" %>
<%@ page import="com.fitnessmembership.fitnessmembership.model.Plan" %>

<!DOCTYPE html>
<html>
<head>

    <script>
        if (localStorage.getItem("sidebarCollapsed") === "true") {
            document.documentElement.classList.add("sidebar-is-collapsed");
        }
    </script>

    <link rel="stylesheet"
          href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.1/css/all.min.css">

    <link rel="stylesheet"
          href="${pageContext.request.contextPath}/css/dashboard.css">
    <title>Plans</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/dashboard.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/trainer.css">
</head>

<body>
<jsp:include page="components/sidebar.jsp" />
<div class="main-content" id="mainContent">

    <div class="page-title">
        <h1>Our Plans</h1>
        <p>Choose the perfect workout or meal plan for your fitness journey.</p>
    </div>

    <div class="plan-tabs">
        <button class="tab-btn active" onclick="showPlans('workout')">Workout Plans</button>
        <button class="tab-btn" onclick="showPlans('meal')">Meal Plans</button>
    </div>

    <div id="workoutPlans" class="plans-grid four-grid">

        <%
            List<Plan> plans =
                    (List<Plan>) request.getAttribute("plans");

            if (plans != null) {
                int index = 0;
                for (Plan p : plans) {
                    index++;
        %>

        <div class="plan-card">

            <% if(index == 1){ %>
                <div class="popular-badge">POPULAR</div>
            <% } %>

            <h2><%= p.getName() %></h2>
            <p><%= p.getDescription() %></p>

            <h1>$<%= p.getPrice() %><span>/month</span></h1>

            <ul>
                <%
                    for (String feature : p.getFeatureList()) {
                %>
                    <li><%= feature %></li>
                <%
                    }
                %>
            </ul>

            <a class="choose-plan-btn"
               href="/payments/portal?plan=<%= p.getName() %>&amount=<%= p.getPrice() %>">
                Choose Plan
            </a>

        </div>

        <%
                }
            }
        %>

    </div>

    <div id="mealPlans" class="plans-grid four-grid hidden">

        <div class="plan-card meal-card">
            <h2>Weight Loss Meal Plan</h2>
            <p>Calorie-controlled meals for fat loss and healthy energy.</p>
            <h1>$24.99<span>/month</span></h1>

            <ul>
                <liLow calorie meals</li>
                <li>Weekly diet schedule</li>
                <li>Hydration guide</li>
                <li>Healthy snack options</li>
            </ul>

            <a class="choose-plan-btn"
               href="/payments/portal?plan=Weight Loss Meal Plan&amount=24.99">
                Choose Meal Plan
            </a>
        </div>

        <div class="plan-card meal-card">
            <h2>Muscle Gain Meal Plan</h2>
            <p>High-protein meals designed for strength and muscle growth.</p>
            <h1>$34.99<span>/month</span></h1>

            <ul>
                <li>High protein meals</li>
                <li>Bulking meal schedule</li>
                <li>Supplement guidance</li>
                <li>Calorie surplus plan</li>
            </ul>

            <a class="choose-plan-btn"
               href="/payments/portal?plan=Muscle Gain Meal Plan&amount=34.99">
                Choose Meal Plan
            </a>
        </div>

        <div class="plan-card meal-card">
            <h2>Balanced Diet Plan</h2>
            <p>Perfect for maintaining fitness, energy and healthy lifestyle.</p>
            <h1>$29.99<span>/month</span></h1>

            <ul>
                <li>Balanced nutrition</li>
                <li>Daily meal routine</li>
                <li>Vegetarian options</li>
                <li>Lifestyle coaching</li>
            </ul>

            <a class="choose-plan-btn"
               href="/payments/portal?plan=Balanced Diet Plan&amount=29.99">
                Choose Meal Plan
            </a>
        </div>

        <div class="plan-card meal-card">
            <h2>Athlete Nutrition Plan</h2>
            <p>Advanced nutrition plan for performance, endurance and recovery.</p>
            <h1>$49.99<span>/month</span></h1>

            <ul>
                <li>Performance meals</li>
                <li>Recovery nutrition</li>
                <li>Macro tracking</li>
                <li>Expert diet support</li>
            </ul>

            <a class="choose-plan-btn"
               href="/payments/portal?plan=Athlete Nutrition Plan&amount=49.99">
                Choose Meal Plan
            </a>
        </div>

    </div>

</div>

<script>
    function showPlans(type) {
        const workout = document.getElementById("workoutPlans");
        const meal = document.getElementById("mealPlans");
        const buttons = document.querySelectorAll(".tab-btn");

        buttons.forEach(btn => btn.classList.remove("active"));

        if(type === "workout"){
            workout.classList.remove("hidden");
            meal.classList.add("hidden");
            buttons[0].classList.add("active");
        } else {
            workout.classList.add("hidden");
            meal.classList.remove("hidden");
            buttons[1].classList.add("active");
        }
    }

</script>

</body>
</html>