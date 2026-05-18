<!DOCTYPE html>
<html>
<head>
    <title>Add Progress</title>

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

        <h1>Add Progress</h1>
        <p>Enter your current fitness details.</p>

        <form action="/progress/add" method="post">

            <input type="date" name="date" required>

            <input type="number"
                   step="0.1"
                   name="weight"
                   placeholder="Weight in kg"
                   required>

            <input type="number"
                   step="0.1"
                   name="height"
                   placeholder="Height in cm"
                   required>

            <input type="number"
                   name="gymDays"
                   placeholder="Gym days this month"
                   required>

            <textarea name="notes"
                      placeholder="Notes about your progress"
                      required></textarea>

            <button type="submit">
                Save Progress
            </button>

        </form>

        <a href="/progress" class="back-link">
            Back to Progress
        </a>
    </div>
</div>
</body>
</html>