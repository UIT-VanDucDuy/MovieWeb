package com.example.webmovie.AccessController;

import com.example.webmovie.entity.Account;

import javax.servlet.*;
import javax.servlet.annotation.WebFilter;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;

@WebFilter("/Movie")
public class MoviePage implements Filter {
    @Override
    public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain)
            throws IOException, ServletException {
        HttpServletRequest httpRequest = (HttpServletRequest) request;
        HttpServletResponse httpResponse = (HttpServletResponse) response;

        HttpSession session = httpRequest.getSession(false);
        Account account = (session != null) ? (Account) session.getAttribute("account") : null;

        // Nếu chưa login thì về trang login
        if (account == null) {
            httpResponse.sendRedirect(httpRequest.getContextPath() + "/Home?errorLogin=1");
            return;
        }

        int memberTypeId = account.getMemberTypeId();
        int movieTypeId;

        try {
            movieTypeId = Integer.parseInt(httpRequest.getParameter("movieTypeId"));
        } catch (NumberFormatException e) {
            httpResponse.sendRedirect(httpRequest.getContextPath() + "/Home");
            return;
        }

        // Quyền truy cập:
        // - memberTypeId == 0 => xem tất cả
        // - memberTypeId == movieTypeId => xem được
        if (memberTypeId == 0 || memberTypeId == movieTypeId) {
            chain.doFilter(request, response);
        } else {
            httpResponse.sendRedirect(httpRequest.getContextPath() + "/Home?noPermission=1");

        }
    }
}
