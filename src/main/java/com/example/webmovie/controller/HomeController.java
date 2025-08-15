package com.example.webmovie.controller;

import com.example.webmovie.entity.Account;
import com.example.webmovie.service.AccountService;
import com.example.webmovie.service.IAccountService;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import java.io.IOException;

@WebServlet(name = "homeController", value = "/Home")
public class HomeController extends HttpServlet {
    private IAccountService accountService = new AccountService();
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        HttpSession session = request.getSession(false);
        Account account = (session != null) ? (Account) session.getAttribute("account") : null;

        // Không redirect nữa mà forward thẳng
        request.getRequestDispatcher("view/home.jsp").forward(request, response);
    }
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String username = request.getParameter("username");
        String password = request.getParameter("password");

        boolean isValid = accountService.login(username, password);
        if (isValid) {
            HttpSession session = request.getSession(true);
            Account account = accountService.getAccount(username);
            session.setAttribute("account", account);

            response.sendRedirect(request.getContextPath() + "/Home");
        } else {
            request.setAttribute("error", "Tên đăng nhập hoặc mật khẩu sai!");
            request.getRequestDispatcher("view/home.jsp").forward(request, response);
        }
    }
}
