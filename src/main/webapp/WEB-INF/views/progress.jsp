<%@ page import="java.util.List" %>
<%@ page import="com.fitnessmembership.fitnessmembership.model.MemberProgress" %>

<%
    List<MemberProgress> progressList =
            (List<MemberProgress>) request.getAttribute("progressList");

    MemberProgress latestProgress = null;

    if (progressList != null && !progressList.isEmpty()) {
        latestProgress = progressList.get(progressList.size() - 1);
    }
%>

<!DOCTYPE html>
<html>
<head>

    <script>
        if (localStorage.getItem("sidebarCollapsed") === "true") {
            document.documentElement.classList.add("sidebar-is-collapsed");
        }
    </script>
    <meta charset="UTF-8">
    <title>My Fitness Progress</title>

    <script src="https://cdn.jsdelivr.net/npm/chart.js"></script>

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

    <div class="progress-page">

        <!-- HEADER -->

        <div class="progress-top-header">

            <div class="progress-title-box">
                <h1>
                    <i class="fa-solid fa-chart-line"></i>
                    My Fitness Progress
                </h1>

                <p>
                    Track your weight, BMI, gym attendance and progress history.
                </p>
            </div>

            <a href="/progress/add" class="add-progress-btn">
                <i class="fa-solid fa-plus"></i>
                Add Progress
            </a>

        </div>


        <!-- SUMMARY CARDS -->

        <div class="progress-summary-grid">

            <div class="advanced-summary-card purple-card">
                <div class="summary-top">
                    <div class="summary-icon purple-icon">
                        <i class="fa-solid fa-weight-scale"></i>
                    </div>

                    <div>
                        <span>Latest Weight</span>
                        <h2>
                            <%= latestProgress != null ? latestProgress.getWeight() + " kg" : "--" %>
                        </h2>
                    </div>
                </div>

                <p id="weightDifferenceText" class="summary-status">
                    Latest progress report
                </p>

                <div class="mini-chart-box">
                    <canvas id="weightMiniChart"></canvas>
                </div>
            </div>


            <div class="advanced-summary-card cyan-card">
                <div class="summary-top">
                    <div class="summary-icon cyan-icon">
                        <i class="fa-solid fa-heart-pulse"></i>
                    </div>

                    <div>
                        <span>Latest BMI</span>
                        <h2>
                            <%= latestProgress != null ? latestProgress.getBmi() : "--" %>
                        </h2>
                    </div>
                </div>

                <p id="bmiStatusText" class="summary-status green-text">
                    BMI status
                </p>

                <div class="mini-chart-box">
                    <canvas id="bmiMiniChart"></canvas>
                </div>
            </div>


            <div class="advanced-summary-card gold-card">
                <div class="summary-top">
                    <div class="summary-icon gold-icon">
                        <i class="fa-solid fa-calendar-check"></i>
                    </div>

                    <div>
                        <span>Latest Gym Days</span>
                        <h2>
                            <%= latestProgress != null ? latestProgress.getGymDays() + " Days" : "--" %>
                        </h2>
                    </div>
                </div>

                <p class="summary-status">
                    Based on latest progress report
                </p>

                <div class="mini-chart-box">
                    <canvas id="gymMiniChart"></canvas>
                </div>
            </div>


            <div class="advanced-summary-card green-card">
                <div class="summary-top">
                    <div class="summary-icon green-icon">
                        <i class="fa-solid fa-arrow-trend-up"></i>
                    </div>

                    <div>
                        <span>Progress Trend</span>
                        <h2 id="progressTrendValue">--</h2>
                    </div>
                </div>

                <p id="progressTrendText" class="summary-status green-text">
                    Waiting for progress data
                </p>

                <div class="mini-chart-box">
                    <canvas id="trendMiniChart"></canvas>
                </div>
            </div>

        </div>


        <!-- MAIN CHART AREA -->

        <div class="progress-analytics-grid">

            <div class="large-chart-card">
                <div class="chart-title-row">
                    <h2>
                        <i class="fa-solid fa-chart-line"></i>
                        Weight Progress
                    </h2>

                    <span class="chart-tag">kg</span>
                </div>

                <div class="large-chart-canvas">
                    <canvas id="weightChart"></canvas>
                </div>
            </div>


            <div class="large-chart-card">
                <div class="chart-title-row">
                    <h2>
                        <i class="fa-solid fa-wave-square"></i>
                        BMI Progress
                    </h2>

                    <span class="chart-tag healthy-tag">Healthy</span>
                </div>

                <div class="large-chart-canvas">
                    <canvas id="bmiChart"></canvas>
                </div>
            </div>


            <div class="side-insight-card">

                <div class="chart-title-row">
                    <h2>
                        <i class="fa-solid fa-dumbbell"></i>
                        Gym Attendance
                    </h2>
                </div>

                <div class="side-chart-canvas">
                    <canvas id="gymDaysChart"></canvas>
                </div>

                <div class="latest-note-card">
                    <div class="latest-note-icon">
                        <i class="fa-solid fa-message"></i>
                    </div>

                    <div>
                        <span>Latest Note</span>
                        <p>
                            <%= latestProgress != null && latestProgress.getNotes() != null
                                    && !latestProgress.getNotes().trim().isEmpty()
                                    ? latestProgress.getNotes()
                                    : "No progress note added yet." %>
                        </p>
                    </div>
                </div>

            </div>

        </div>


        <!-- HISTORY TABLE -->

        <div class="progress-history-panel">

            <div class="history-panel-header">
                <div>
                    <h2>
                        <i class="fa-solid fa-table-list"></i>
                        Progress History Log
                    </h2>

                    <p>Your saved reports, measurements and fitness records.</p>
                </div>
            </div>

            <div class="history-table">

                <div class="history-row history-head">
                    <span>Date</span>
                    <span>Weight</span>
                    <span>BMI</span>
                    <span>Height</span>
                    <span>Gym Days</span>
                    <span>Notes</span>
                    <span>Actions</span>
                </div>

                <%
                    if (progressList != null && !progressList.isEmpty()) {
                        for (MemberProgress p : progressList) {
                %>

                <div class="history-row">

                    <span><%= p.getDate() %></span>

                    <span>
                        <strong><%= p.getWeight() %></strong> kg
                    </span>

                    <span>
                        <b class="bmi-pill"><%= p.getBmi() %></b>
                    </span>

                    <span>
                        <strong><%= p.getHeight() %></strong> cm
                    </span>

                    <span>
                        <%= p.getGymDays() %> days
                    </span>

                    <span class="history-note">
                        <%= p.getNotes() %>
                    </span>

                    <span class="history-actions">
                        <a href="/progress/edit/<%= p.getProgressId() %>"
                           class="edit-progress">
                            <i class="fa-solid fa-pen-to-square"></i>
                        </a>

                        <a href="/progress/delete/<%= p.getProgressId() %>"
                           class="delete-progress">
                            <i class="fa-solid fa-trash"></i>
                        </a>
                    </span>

                </div>

                <%
                    }
                } else {
                %>

                <div class="empty-progress">
                    <i class="fa-solid fa-chart-line"></i>
                    <h3>No Progress Records Yet</h3>
                    <p>Add your first progress report to start tracking your fitness journey.</p>
                    <a href="/progress/add">Add Progress</a>
                </div>

                <%
                    }
                %>

            </div>

        </div>

    </div>

</div>


<script>

    const progressLabels = [
        <%
            if (progressList != null) {
                for (MemberProgress p : progressList) {
        %>
        "<%= p.getDate() %>",
        <%
                }
            }
        %>
    ];

    const weightData = [
        <%
            if (progressList != null) {
                for (MemberProgress p : progressList) {
        %>
        <%= p.getWeight() %>,
        <%
                }
            }
        %>
    ];

    const bmiData = [
        <%
            if (progressList != null) {
                for (MemberProgress p : progressList) {
        %>
        <%= p.getBmi() %>,
        <%
                }
            }
        %>
    ];

    const gymDaysData = [
        <%
            if (progressList != null) {
                for (MemberProgress p : progressList) {
        %>
        <%= p.getGymDays() %>,
        <%
                }
            }
        %>
    ];


    function buildLineChart(canvasId, labels, data, borderColor, fillColor, label) {
        const canvas = document.getElementById(canvasId);

        if (!canvas) return;

        new Chart(canvas, {
            type: "line",
            data: {
                labels: labels,
                datasets: [{
                    label: label,
                    data: data,
                    borderColor: borderColor,
                    backgroundColor: fillColor,
                    fill: true,
                    tension: 0.42,
                    borderWidth: 3,
                    pointRadius: 4,
                    pointHoverRadius: 7,
                    pointBackgroundColor: borderColor
                }]
            },
            options: {
                responsive: true,
                maintainAspectRatio: false,
                plugins: {
                    legend: {
                        labels: {
                            color: "#d1d5db"
                        }
                    }
                },
                scales: {
                    x: {
                        ticks: {
                            color: "#94a3b8"
                        },
                        grid: {
                            color: "rgba(255,255,255,0.05)"
                        }
                    },
                    y: {
                        ticks: {
                            color: "#94a3b8"
                        },
                        grid: {
                            color: "rgba(255,255,255,0.05)"
                        }
                    }
                }
            }
        });
    }


    function buildMiniChart(canvasId, labels, data, borderColor, fillColor) {
        const canvas = document.getElementById(canvasId);

        if (!canvas) return;

        new Chart(canvas, {
            type: "line",
            data: {
                labels: labels,
                datasets: [{
                    data: data,
                    borderColor: borderColor,
                    backgroundColor: fillColor,
                    fill: true,
                    tension: 0.45,
                    borderWidth: 2,
                    pointRadius: 0
                }]
            },
            options: {
                responsive: true,
                maintainAspectRatio: false,
                plugins: {
                    legend: {
                        display: false
                    },
                    tooltip: {
                        enabled: false
                    }
                },
                scales: {
                    x: {
                        display: false
                    },
                    y: {
                        display: false
                    }
                }
            }
        });
    }


    function buildBarChart() {
        const canvas = document.getElementById("gymDaysChart");

        if (!canvas) return;

        new Chart(canvas, {
            type: "bar",
            data: {
                labels: progressLabels,
                datasets: [{
                    label: "Gym Days",
                    data: gymDaysData,
                    backgroundColor: "rgba(255,49,49,0.85)",
                    borderRadius: 10
                }]
            },
            options: {
                responsive: true,
                maintainAspectRatio: false,
                plugins: {
                    legend: {
                        labels: {
                            color: "#d1d5db"
                        }
                    }
                },
                scales: {
                    x: {
                        ticks: {
                            color: "#94a3b8"
                        },
                        grid: {
                            color: "rgba(255,255,255,0.05)"
                        }
                    },
                    y: {
                        ticks: {
                            color: "#94a3b8"
                        },
                        grid: {
                            color: "rgba(255,255,255,0.05)"
                        }
                    }
                }
            }
        });
    }


    function updateSummaryTexts() {
        const bmiStatusText = document.getElementById("bmiStatusText");
        const weightDifferenceText = document.getElementById("weightDifferenceText");
        const progressTrendValue = document.getElementById("progressTrendValue");
        const progressTrendText = document.getElementById("progressTrendText");

        if (bmiData.length > 0) {
            const latestBmi = bmiData[bmiData.length - 1];

            if (latestBmi >= 18.5 && latestBmi <= 24.9) {
                bmiStatusText.innerText = "Healthy Range";
                bmiStatusText.className = "summary-status green-text";
            } else if (latestBmi < 18.5) {
                bmiStatusText.innerText = "Below Healthy Range";
                bmiStatusText.className = "summary-status gold-text";
            } else {
                bmiStatusText.innerText = "Above Healthy Range";
                bmiStatusText.className = "summary-status red-text";
            }
        }

        if (weightData.length >= 2) {
            const previousWeight = weightData[weightData.length - 2];
            const latestWeight = weightData[weightData.length - 1];
            const difference = latestWeight - previousWeight;
            const absoluteDifference = Math.abs(difference).toFixed(1);

            if (difference < 0) {
                weightDifferenceText.innerText = absoluteDifference + " kg vs previous";
                weightDifferenceText.className = "summary-status green-text";

                progressTrendValue.innerText = "+" + ((absoluteDifference / previousWeight) * 100).toFixed(1) + "%";
                progressTrendText.innerText = "Weight improved from last report";
                progressTrendText.className = "summary-status green-text";
            } else if (difference > 0) {
                weightDifferenceText.innerText = absoluteDifference + " kg vs previous";
                weightDifferenceText.className = "summary-status gold-text";

                progressTrendValue.innerText = ((absoluteDifference / previousWeight) * 100).toFixed(1) + "%";
                progressTrendText.innerText = "Weight increased from last report";
                progressTrendText.className = "summary-status red-text";
            } else {
                weightDifferenceText.innerText = "No weight change";
                weightDifferenceText.className = "summary-status";

                progressTrendValue.innerText = "0%";
                progressTrendText.innerText = "Stable progress";
                progressTrendText.className = "summary-status";
            }
        } else {
            progressTrendValue.innerText = "--";
            progressTrendText.innerText = "Add more reports to compare";
            progressTrendText.className = "summary-status";
        }
    }


    buildLineChart(
        "weightChart",
        progressLabels,
        weightData,
        "#b146ff",
        "rgba(177,70,255,0.18)",
        "Weight"
    );

    buildLineChart(
        "bmiChart",
        progressLabels,
        bmiData,
        "#2f7cff",
        "rgba(47,124,255,0.18)",
        "BMI"
    );

    buildBarChart();

    buildMiniChart(
        "weightMiniChart",
        progressLabels,
        weightData,
        "#b146ff",
        "rgba(177,70,255,0.16)"
    );

    buildMiniChart(
        "bmiMiniChart",
        progressLabels,
        bmiData,
        "#00d4ff",
        "rgba(0,212,255,0.16)"
    );

    buildMiniChart(
        "gymMiniChart",
        progressLabels,
        gymDaysData,
        "#ffb21a",
        "rgba(255,178,26,0.16)"
    );

    buildMiniChart(
        "trendMiniChart",
        progressLabels,
        weightData,
        "#22c55e",
        "rgba(34,197,94,0.16)"
    );

    updateSummaryTexts();
</script>

</body>
</html>