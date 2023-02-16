package com.codeup.adlister.controllers;

import com.codeup.adlister.dao.DaoFactory;

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
        boolean deleteSuccess = DaoFactory.getAdsDao().deleteAd(id);

        if (deleteSuccess) {
            resp.sendRedirect("/profile");
        } else {
            req.setAttribute("errorMessage", "Could not delete ad");
            req.getRequestDispatcher("/WEB-INF/ads/show.jsp").forward(req, resp);
        }
    }
}
