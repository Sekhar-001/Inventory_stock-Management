package com.inventory.servlet;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;

import java.io.IOException;

@WebServlet("/logout")
public class LogoutServlet extends HttpServlet {

    private static final long serialVersionUID = 1L;

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse res)
            throws ServletException, IOException {

        try {
            HttpSession session = req.getSession(false); // don't create new session

            if (session != null) {
                session.invalidate(); // destroy session
            }

            // Optional: prevent caching (security best practice)
            res.setHeader("Cache-Control", "no-cache, no-store, must-revalidate");
            res.setHeader("Pragma", "no-cache");
            res.setDateHeader("Expires", 0);

            // Redirect with logout message
            res.sendRedirect("login.jsp?logout=1");

        } catch (Exception e) {
            e.printStackTrace();
            res.sendRedirect("login.jsp?error=1");
        }
    }
}