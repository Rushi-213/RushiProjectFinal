<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%
    if (session.getAttribute("studentId") == null) {
        response.sendRedirect(
            request.getContextPath() + "/login.jsp"
        );
        return;
    }

    String studentName = org.apache.commons.text.StringEscapeUtils
        .escapeHtml4(String.valueOf(session.getAttribute("studentName")));

    String studentEmail = org.apache.commons.text.StringEscapeUtils
        .escapeHtml4(String.valueOf(session.getAttribute("studentEmail")));

    String studentCourse = org.apache.commons.text.StringEscapeUtils
        .escapeHtml4(String.valueOf(session.getAttribute("studentCourse")));
%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>Student Dashboard | College Portal</title>
    <link rel="stylesheet"
          href="${pageContext.request.contextPath}/css/style.css">
    <style>
        .dashboard {
            max-width: 1050px;
            margin: 40px auto;
            padding: 24px;
        }

        .dashboard-hero {
            background: #174ea6;
            color: white;
            padding: 35px;
            border-radius: 18px;
        }

        .dashboard-hero p {
            color: #dce8ff;
        }

        .info-grid {
            display: grid;
            grid-template-columns: repeat(2, minmax(0, 1fr));
            gap: 20px;
            margin-top: 25px;
        }

        .info-card {
            background: white;
            border: 1px solid #e2e8f0;
            padding: 25px;
            border-radius: 14px;
            overflow-wrap: anywhere;
        }

        .info-card p {
            color: #718096;
            font-size: 13px;
        }

        .logout-btn {
            color: white;
            background: #174ea6;
            padding: 10px 16px;
            border-radius: 8px;
        }

        @media (max-width: 600px) {
            .info-grid {
                grid-template-columns: 1fr;
            }

            .dashboard {
                margin: 15px auto;
            }
        }
    </style>
</head>
<body>

<header class="topbar">
    <div class="brand">
        <div class="brand-icon">C</div>
        <div>
            <strong>College Portal</strong>
            <small>Student Dashboard</small>
        </div>
    </div>
    <form action="${pageContext.request.contextPath}/logout"
          method="post">
        <button class="logout-btn" type="submit">Logout</button>
    </form>
</header>

<main class="dashboard">
    <section class="dashboard-hero">
        <span class="eyebrow">STUDENT PORTAL</span>
        <h1>Welcome, <%= studentName %>!</h1>
        <p>Your student account is active. Here is your profile.</p>
    </section>

    <section class="info-grid">
        <div class="info-card">
            <p>STUDENT NAME</p>
            <h3><%= studentName %></h3>
        </div>

        <div class="info-card">
            <p>EMAIL ADDRESS</p>
            <h3><%= studentEmail %></h3>
        </div>

        <div class="info-card">
            <p>COURSE</p>
            <h3><%= studentCourse %></h3>
        </div>

        <div class="info-card">
            <p>ACCOUNT STATUS</p>
            <h3>Logged In</h3>
        </div>
    </section>
</main>

</body>
</html>
