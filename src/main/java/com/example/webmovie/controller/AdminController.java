package com.example.webmovie.controller;

import com.example.webmovie.entity.Account;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;

@WebServlet(name = "AdminController", value = "/Admin")
public class AdminController extends HttpServlet {
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        HttpSession session = request.getSession(false);
        Account account = (session != null) ? (Account) session.getAttribute("account") : null;
        request.getRequestDispatcher("view/admin.jsp").forward(request, response);
    }
}
