package com.codeup.adlister.controllers;
import com.codeup.adlister.dao.DaoFactory;
import com.codeup.adlister.models.User;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.util.Objects;

@WebServlet(name = "controllers.RegisterServlet", urlPatterns = "/register")
public class RegisterServlet extends HttpServlet {

    private boolean validateRegistry(HttpServletRequest request) {
        HttpSession session = request.getSession();
        boolean isValid = true;
        String username = request.getParameter("username");
        String password = request.getParameter("password");
        String email = request.getParameter("email");
        String confirmPass = request.getParameter("confirm_password");

        User existingUser = DaoFactory.getUsersDao().findByUsername(username);
        if (existingUser != null && existingUser.getUsername().equalsIgnoreCase(username)) {
            session.setAttribute("dupeUsername", "A user already exists by this name.");
            isValid = false;
        } else {
            session.removeAttribute("dupeUsername");
        }

        User userWithEmail = DaoFactory.getUsersDao().findByEmail(email);
        if (userWithEmail != null && Objects.requireNonNull(userWithEmail).getEmail().equalsIgnoreCase(email)) {
            session.setAttribute("dupeEmail", "A user already exists with this email.");
            isValid = false;
        } else {
            session.removeAttribute("dupeEmail");
        }

        if (username.isEmpty()) {
            session.setAttribute("missingUsername", "Please fill in your username");
            isValid = false;
        } else {
            session.removeAttribute("missingUsername");
        }
        if (email.isEmpty()) {
            session.setAttribute("missingEmail", "Please fill in your email");
            isValid = false;
        } else {
            session.removeAttribute("missingEmail");
        }

        if (password.isEmpty()) {
            session.setAttribute("missingPassword", "Please fill in your password");
            isValid = false;
        } else {
            session.removeAttribute("missingPassword");
        }

        if (!password.equals(confirmPass)) {
            session.setAttribute("passwordsDontMatch", "Password and Confirm Password fields do not match");
            isValid = false;
        }

        return isValid;
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.getRequestDispatcher("/WEB-INF/register.jsp").forward(request, response);
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws IOException {
        HttpSession session = request.getSession();
        String username = request.getParameter("username");
        String email = request.getParameter("email");
        String password = request.getParameter("password");
        boolean isValid = validateRegistry(request);
        session.setAttribute("username", username);
        session.setAttribute("email", email);

        // validate input and create new user if valid
        if (isValid) {
            session.removeAttribute("dupeUsername");
            session.removeAttribute("dupeEmail");
            session.removeAttribute("missingUsername");
            session.removeAttribute("missingEmail");
            session.removeAttribute("missingPassword");
            session.removeAttribute("passwordsDontMatch");
            session.removeAttribute("username");
            session.removeAttribute("email");
            User user = new User(username, email, password);
            DaoFactory.getUsersDao().insert(user);
            response.sendRedirect("/login");
        } else {
            response.sendRedirect("/register");
        }
    }
}
