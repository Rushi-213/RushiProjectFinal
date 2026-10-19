
package com.college.servlet;

import com.college.dao.StudentDAO;
import com.college.model.Student;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;
import java.util.Locale;
import java.util.regex.Pattern;

@WebServlet("/register")
public class RegisterServlet extends HttpServlet {

    private final StudentDAO dao = new StudentDAO();

    @Override
    protected void doPost(
            HttpServletRequest request,
            HttpServletResponse response)
            throws ServletException, IOException {

        request.setCharacterEncoding("UTF-8");

        String name = request.getParameter("fullName");
        String email = request.getParameter("email");
        String roll = request.getParameter("rollNumber");
        String course = request.getParameter("course");
        String password = request.getParameter("password");
        String confirm = request.getParameter("confirmPassword");

        if (name == null || email == null || roll == null
                || course == null || password == null
                || confirm == null) {
            fail(request, response, "Please fill all fields.");
            return;
        }

        name = name.trim();
        email = email.trim().toLowerCase(Locale.ROOT);
        roll = roll.trim();
        course = course.trim();

        if (name.isEmpty() || roll.isEmpty() || course.isEmpty()
                || !Pattern.matches(
                    "^[A-Za-z0-9._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,}$",
                    email)) {
            fail(request, response,
                "Please enter valid student details.");
            return;
        }

        if (password.length() < 8 || password.length() > 72
                || !password.equals(confirm)) {
            fail(request, response,
                "Passwords must match and contain 8-72 characters.");
            return;
        }

        Student student = new Student();
        student.setFullName(name);
        student.setEmail(email);
        student.setRollNumber(roll);
        student.setCourse(course);
        student.setPasswordHash(password);

        if (dao.register(student)) {
            response.sendRedirect(
                request.getContextPath() +
                "/login.jsp?registered=1"
            );
        } else {
            fail(request, response,
                "Email or roll number already exists, or registration failed.");
        }
    }

    private void fail(
            HttpServletRequest request,
            HttpServletResponse response,
            String message)
            throws ServletException, IOException {

        request.setAttribute("error", message);
        request.getRequestDispatcher("/register.jsp")
               .forward(request, response);
    }
}
