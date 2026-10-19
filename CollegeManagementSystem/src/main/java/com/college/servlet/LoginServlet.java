
package com.college.servlet;

import com.college.dao.StudentDAO;
import com.college.model.Student;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import java.io.IOException;
import java.util.Locale;

@WebServlet("/login")
public class LoginServlet extends HttpServlet {

    private final StudentDAO dao = new StudentDAO();

    @Override
    protected void doPost(
            HttpServletRequest request,
            HttpServletResponse response)
            throws ServletException, IOException {

        request.setCharacterEncoding("UTF-8");

        String email = request.getParameter("email");
        String password = request.getParameter("password");

        if (email == null || password == null
                || email.trim().isEmpty()
                || password.isEmpty()) {

            request.setAttribute("error",
                "Please enter email and password.");

            request.getRequestDispatcher("/login.jsp")
                   .forward(request, response);
            return;
        }

        Student student = dao.login(
            email.trim().toLowerCase(Locale.ROOT),
            password
        );

        if (student != null) {

            HttpSession oldSession = request.getSession(false);

            if (oldSession != null) {
                oldSession.invalidate();
            }

            HttpSession session = request.getSession(true);
            session.setAttribute("studentId", student.getId());
            session.setAttribute("studentName", student.getFullName());
            session.setAttribute("studentEmail", student.getEmail());
            session.setAttribute("studentCourse", student.getCourse());

            session.setMaxInactiveInterval(20 * 60);

            response.sendRedirect(
                request.getContextPath() + "/dashboard.jsp"
            );

        } else {
            request.setAttribute("error",
                "Invalid email or password.");

            request.getRequestDispatcher("/login.jsp")
                   .forward(request, response);
        }
    }
}
