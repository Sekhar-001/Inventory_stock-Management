package com.inventory.servlet;

import jakarta.servlet.*;
import jakarta.servlet.http.*;
import jakarta.servlet.annotation.WebServlet;
import java.io.IOException;

@WebServlet("/login")
public class LoginServlet extends HttpServlet {

    protected void doPost(HttpServletRequest req, HttpServletResponse res) throws IOException {

        String username = req.getParameter("username");
        String password = req.getParameter("password");

        if ("admin".equals(username) && "admin123".equals(password)) {

            HttpSession session = req.getSession();
            session.setAttribute("user", username);

            res.sendRedirect(req.getContextPath() + "/dashboard.jsp");
        } else {
            res.sendRedirect("login.jsp?error=1");
        }
    }
}