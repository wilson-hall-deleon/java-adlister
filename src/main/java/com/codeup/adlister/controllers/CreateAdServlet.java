package com.codeup.adlister.controllers;

import com.codeup.adlister.dao.DaoFactory;
import com.codeup.adlister.models.Ad;
import com.codeup.adlister.models.User;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;

@WebServlet(name = "controllers.CreateAdServlet", urlPatterns = "/ads/create")
public class CreateAdServlet extends HttpServlet {
    private boolean validateInput(HttpServletRequest request) {
        HttpSession session = request.getSession();
        boolean isValid = true;
        String title = request.getParameter("title");
        String description = request.getParameter("description");

        if (title.isEmpty()) {
            session.setAttribute("missingTitle", "Title required");
            isValid = false;
        } else {
            session.removeAttribute("missingTitle");
        }

        if (description.isEmpty()) {
            session.setAttribute("missingDescription", "Description required");
            isValid = false;
        } else {
            session.removeAttribute("missingDescription");
        }
        return isValid;
    }
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        if (request.getSession().getAttribute("user") == null) {
            request.getSession().setAttribute("url", request.getRequestURI());
            response.sendRedirect("/login");
            return;
        }
        request.getRequestDispatcher("/WEB-INF/ads/create.jsp")
            .forward(request, response);
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {
        HttpSession session = request.getSession();
        User user = (User) session.getAttribute("user");
        boolean isValid = validateInput(request);
        String title = request.getParameter("title");
        String description = request.getParameter("description");
        session.setAttribute("title", title);
        session.setAttribute("description", description);

        if (isValid) {
            session.removeAttribute("missingTitle");
            session.removeAttribute("missingDescription");
            session.removeAttribute("title");
            session.removeAttribute("description");
            Ad ad = new Ad(
                    user.getId(),
                    request.getParameter("title"),
                    request.getParameter("description")
            );
            DaoFactory.getAdsDao().insert(ad);
            response.sendRedirect("/ads");
        } else {
            response.sendRedirect("/ads/create?title=" + title + "&description=" + description);
        }
    }
}
