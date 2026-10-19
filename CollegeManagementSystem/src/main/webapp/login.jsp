<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>Student Login | College Portal</title>
    <link rel="stylesheet"
          href="${pageContext.request.contextPath}/css/style.css">
</head>
<body>

<header class="topbar">
    <div class="brand">
        <div class="brand-icon">C</div>
        <div>
            <strong>College Portal</strong>
            <small>Student Management System</small>
        </div>
    </div>
    <a class="nav-link" href="register.jsp">Create Account</a>
</header>

<main class="auth-layout">
    <section class="welcome-panel">
        <span class="eyebrow">YOUR CAMPUS, CONNECTED</span>
        <h1>Welcome back to your college.</h1>
        <p>Access your student profile, course information
           and academic journey from one place.</p>

        <div class="feature">
            <span>01</span>
            <div>
                <strong>Student Portal</strong>
                <p>Your academic information in one place.</p>
            </div>
        </div>

        <div class="feature">
            <span>02</span>
            <div>
                <strong>Secure Access</strong>
                <p>Your account is protected by authentication.</p>
            </div>
        </div>
    </section>

    <section class="auth-card">
        <div class="card-icon">C</div>
        <h2>Student Login</h2>
        <p class="muted">Enter your details to continue.</p>

        <% if ("1".equals(request.getParameter("registered"))) { %>
            <div class="success">
                Registration successful! Please log in.
            </div>
        <% } %>

        <% if (request.getAttribute("error") != null) { %>
    <div class="error">
        <%= ((String) request.getAttribute("error"))
                .replace("&", "&amp;")
                .replace("<", "&lt;")
                .replace(">", "&gt;")
                .replace("\"", "&quot;")
                .replace("'", "&#39;") %>
    </div>
<% } %>

        <form action="${pageContext.request.contextPath}/login"
              method="post">

            <label for="email">Email Address</label>
            <input id="email" type="email" name="email"
                   placeholder="student@example.com"
                   autocomplete="username" required>

            <label for="password">Password</label>
            <input id="password" type="password" name="password"
                   placeholder="Enter your password"
                   autocomplete="current-password" required>

            <button class="primary-btn" type="submit">
                Sign In <span>→</span>
            </button>
        </form>

        <p class="bottom-text">
            New to the portal?
            <a href="register.jsp">Register as a student</a>
        </p>
    </section>
</main>

<footer class="footer">
    College Portal · Student & Academic Services
</footer>

</body>
</html>
