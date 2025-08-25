package com.example.webmovie.controller;
import com.example.webmovie.entity.Account;

import javax.servlet.*;
import javax.servlet.annotation.WebFilter;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;





@WebFilter(value = "/Admin")
public class AccessControl implements Filter {
    @Override
    public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain) throws IOException, ServletException {
        request.setCharacterEncoding("UTF-8");

        HttpServletRequest httpRequest = (HttpServletRequest) request;
        HttpServletResponse httpResponse = (HttpServletResponse) response;

        HttpSession session = httpRequest.getSession(false);
        Account account = (session != null) ? (Account) session.getAttribute("account") : null;
        if (account == null) {
            httpResponse.sendRedirect(httpRequest.getContextPath() + "/Home");
            return;
        }

        if (account.getMemberTypeId() == 0) {
            chain.doFilter(request, response);
        } else {
            httpResponse.sendRedirect(httpRequest.getContextPath() + "/Home");
        }
    }

}
