package com.codeup.adlister.controllers;

import com.codeup.adlister.dao.DaoFactory;
import com.codeup.adlister.models.User;
import com.codeup.adlister.util.Password;


import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;

@WebServlet(name = "controllers.LoginServlet", urlPatterns = "/login")
public class LoginServlet extends HttpServlet {

    private boolean validateLogin(HttpServletRequest request) {
        HttpSession session = request.getSession();
        boolean isValid = true;
        String username = request.getParameter("username");
        String password = request.getParameter("password");
        User user = DaoFactory.getUsersDao().findByUsername(username);

        if (username.isEmpty()) {
            session.setAttribute("missingUsername", "Please fill in your username.");
            isValid = false;
        } else {
            session.removeAttribute("missingUsername");
        }

        if (password.isEmpty()) {
            session.setAttribute("missingPassword", "Please fill in your password.");
            isValid = false;
        } else {
            session.removeAttribute("missingPassword");
        }

        if (user == null) {
            session.setAttribute("wrongUsername", "Username not found.");
            isValid = false;
        } else {
            session.removeAttribute("wrongUsername");
            if (!Password.check(password, user.getPassword())) {
                session.setAttribute("wrongPassword", "Your password is incorrect.");
                isValid = false;
            } else {
                session.removeAttribute("wrongPassword");
            }
        }
        return isValid;
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        if (request.getSession().getAttribute("user") != null) {
            response.sendRedirect("/profile");
            return;
        }
        request.getRequestDispatcher("/WEB-INF/login.jsp").forward(request, response);
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws IOException {
        HttpSession session = request.getSession();
        String username = request.getParameter("username");
        String password = request.getParameter("password");
        User user = DaoFactory.getUsersDao().findByUsername(username);
        boolean isValid = validateLogin(request);
        session.setAttribute("username", username);

        if (isValid) {
            session.removeAttribute("wrongUsername");
            session.removeAttribute("missingUsername");
            session.removeAttribute("missingPassword");
            session.removeAttribute("wrongPassword");
            session.removeAttribute("username");
            request.getSession().setAttribute("user", user);
            if (request.getSession().getAttribute("url")!= null){
                response.sendRedirect((String) request.getSession().getAttribute("url"));
            } else {
                response.sendRedirect("/profile");
            }
        } else {
            response.sendRedirect("/login?error");
        }
    }
}
