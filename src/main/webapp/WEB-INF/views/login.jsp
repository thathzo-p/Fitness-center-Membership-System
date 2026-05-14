<!DOCTYPE html>
<html>
<head>
    <title>Login</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/auth.css">
</head>
<body>

<div class="auth-page">

    <div class="auth-card">

        <h1>Welcome Back</h1>
        <p>Login to continue your fitness journey.</p>

        <form action="/login" method="post">

            <input type="text" name="username" placeholder="Username" required>

            <input type="password" name="password" placeholder="Password" required>

            <button type="submit">Login</button>

        </form>

        <p class="switch-text">
            Don't have an account?
            <a href="/signup">Create Account</a>
        </p>

    </div>

</div>

</body>
</html>