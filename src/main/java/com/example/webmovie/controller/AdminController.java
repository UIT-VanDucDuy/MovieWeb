package com.example.webmovie.controller;

import com.example.webmovie.entity.Account;
import com.example.webmovie.entity.User;
import com.example.webmovie.repo.IUserRepository;
import com.example.webmovie.repo.UserRepository;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.util.List;

@WebServlet(name = "AdminController", value = "/Admin")
public class AdminController extends HttpServlet {
    IUserRepository userRepository =  new UserRepository();

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        HttpSession session = request.getSession(false);
        Account account = (session != null) ? (Account) session.getAttribute("account") : null;
        List<User> subscriberList = userRepository.getAll(1, 10);
        request.setAttribute("subscriberList", subscriberList);
        request.getRequestDispatcher("view/admin.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String action = req.getParameter("action");
        if (action == null) {
            action = "";
        }
        switch (action) {
            case "editSubscriber":
                req.setAttribute("subscriberInformation",userRepository.findById(Integer.parseInt(req.getParameter("id"))));
                req.getRequestDispatcher("view/admin.jsp").forward(req, resp);
            default:
        }
    }

}
