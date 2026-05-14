<!DOCTYPE html>
<html>
<head>
    <title>Sign Up</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/auth.css">
</head>
<body>

<div class="auth-page">

    <div class="auth-card signup-card">

        <h1>Create Account</h1>
        <p>Join FitClub and start your transformation.</p>

        <form action="/signup" method="post">

            <input type="text" name="fullName" placeholder="Full Name" required>

            <input type="text" name="username" placeholder="Username for Profile" required>

            <input type="date" name="birthday" required>

            <input type="email" name="email" placeholder="Email Address" required>

            <div class="phone-row">
                <select name="countryCode"
                        class="modern-select"
                        required>

                    <option value="+94">+94 Sri Lanka</option>
                    <option value="+91">+91 India</option>
                    <option value="+1">+1 USA</option>
                    <option value="+44">+44 UK</option>
                    <option value="+61">+61 Australia</option>
                    <option value="+971">+971 UAE</option>
                    <option value="+81">+81 Japan</option>
                    <option value="+49">+49 Germany</option>

                </select>

                <input type="text" name="phone" placeholder="Phone Number" required>
            </div>

            <select name="gender" required>
                <option value="">Select Gender</option>
                <option>Male</option>
                <option>Female</option>
                <option>Other</option>
            </select>

            <input type="password" name="password" placeholder="Password" required>

            <button type="submit">Sign Up</button>

        </form>

        <p class="switch-text">
            Already have an account?
            <a href="/login">Login</a>
        </p>

    </div>

</div>

</body>
</html>