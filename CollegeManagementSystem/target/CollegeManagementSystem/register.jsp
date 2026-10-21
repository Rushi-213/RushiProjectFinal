<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>Student Registration | College Portal</title>
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
    <a class="nav-link" href="login.jsp">Sign In</a>
</header>

<main class="register-layout">
    <section class="auth-card register-card">
        <div class="card-icon">+</div>
        <h2>Create Student Account</h2>
        <p class="muted">Enter your details to join the portal.</p>

       
<% if (request.getAttribute("error") != null) { %>
    <div class="error">
        <%= String.valueOf(request.getAttribute("error"))
                .replace("&", "&amp;")
                .replace("<", "&lt;")
                .replace(">", "&gt;")
                .replace("\"", "&quot;")
                .replace("'", "&#39;") %>
    </div>
<% } %>


        <form action="${pageContext.request.contextPath}/register"
              method="post">

            <label for="fullName">Full Name</label>
            <input id="fullName" type="text" name="fullName"
                   maxlength="100" autocomplete="name" required>

            <label for="email">Email Address</label>
            <input id="email" type="email" name="email"
                   maxlength="150" autocomplete="email" required>

            <label for="rollNumber">Student Roll Number</label>
            <input id="rollNumber" type="text" name="rollNumber"
                   maxlength="30" required>

            <label for="course">Select Course</label>
            <select id="course" name="course" required>
                <option value="">Choose your course</option>
                <option value="BCA">BCA</option>
                <option value="BSc Computer Science">
                    BSc Computer Science
                </option>
                <option value="MCA">MCA</option>
                <option value="MSc Computer Science">
                    MSc Computer Science
                </option>
                <option value="BBA">BBA</option>
            </select>

            <label for="password">Create Password</label>
            <input id="password" type="password" name="password"
                   minlength="8" maxlength="72"
                   autocomplete="new-password" required>

            <label for="confirmPassword">Confirm Password</label>
            <input id="confirmPassword" type="password"
                   name="confirmPassword" minlength="8" maxlength="72"
                   autocomplete="new-password" required>

            <button class="primary-btn" type="submit">
                Create Account <span>→</span>
            </button>
        </form>

        <p class="bottom-text">
            Already registered?
            <a href="login.jsp">Login here</a>
        </p>
    </section>
</main>

<footer class="footer">
    College Portal · Student & Academic Services
</footer>

</body>
</html>
