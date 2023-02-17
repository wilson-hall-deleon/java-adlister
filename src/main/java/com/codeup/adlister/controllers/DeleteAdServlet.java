package com.codeup.adlister.controllers;

import com.codeup.adlister.dao.DaoFactory;
import com.codeup.adlister.models.User;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet(name = "DeleteAdServlet", urlPatterns = "/ads/delete")
public class DeleteAdServlet extends HttpServlet {
    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        long id = Long.parseLong(req.getParameter("id"));
        long userId = ((User) req.getSession().getAttribute("user")).getId();
        long adUserId = DaoFactory.getAdsDao().getAdId(id).getUserId();

        if (userId != adUserId) {
            System.out.println("cant delete ad #" + id + " because user id " + userId + " does not match the ad creator of user id " + adUserId);
            req.setAttribute("errorMessage", "You are not authorized to delete this ad");
            req.getRequestDispatcher("/WEB-INF/ads/show.jsp").forward(req, resp);
            return;
        }

        boolean deleteSuccess = DaoFactory.getAdsDao().deleteAd(id);
        if (deleteSuccess) {
            resp.sendRedirect("/profile");
        } else {
            req.setAttribute("errorMessage", "Could not delete ad");
            req.getRequestDispatcher("/WEB-INF/ads/show.jsp").forward(req, resp);
        }
    }
}
