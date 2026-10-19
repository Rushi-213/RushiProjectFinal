<%@ page contentType="text/html; charset=UTF-8" %>
<%
    if (session.getAttribute("studentId") != null) {
        response.sendRedirect(
            request.getContextPath() + "/dashboard.jsp"
        );
    } else {
        response.sendRedirect(
            request.getContextPath() + "/login.jsp"
        );
    }
%>
