package com.example.webmovie.controller;

import com.example.webmovie.entity.Account;
import com.example.webmovie.entity.User;
import com.example.webmovie.repo.IUserRepository;
import com.example.webmovie.repo.UserRepository;
import com.example.webmovie.service.IUserService;
import com.example.webmovie.service.UserService;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.util.Arrays;
//import java.util.Date;
import java.util.List;
import java.sql.Date;

@WebServlet(name = "AdminController", value = "/Admin")
public class AdminController extends HttpServlet {
    IUserService userService = new UserService();

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        HttpSession session = request.getSession(false);
        Account account = (session != null) ? (Account) session.getAttribute("account") : null;
        List<User> subscriberList = userService.getAll(1, 10);
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
            case "showEditForm":
                req.setAttribute("subscriberInformation", userService.findById(Integer.parseInt(req.getParameter("id"))));
                List<User> subscriberList = userService.getAll(1, 10);
                req.setAttribute("subscriberList", subscriberList);
                req.setAttribute("openEditModal", true);
                List<String> genderList = Arrays.asList("Male", "Female");
                req.setAttribute("genderList", genderList);
                req.getRequestDispatcher("view/admin.jsp").forward(req, resp);
                break;
            case "updateSubscriber":
                int id = Integer.parseInt(req.getParameter("id"));
                String name = req.getParameter("name");
                boolean gender = Boolean.parseBoolean(req.getParameter("gender"));
                String birthdayStr = req.getParameter("birthday");
                Date birthday = null;

                try {
                    birthday = Date.valueOf(birthdayStr);
                } catch (IllegalArgumentException e) {
                    e.printStackTrace();
                }
                String phoneNumber = req.getParameter("phoneNumber");
                String address = req.getParameter("address");
                int accountId = Integer.parseInt(req.getParameter("accountId"));

                User subscriber = new User(id, name, gender, birthday, address, phoneNumber, accountId);
                boolean isUpdateSuccess = userService.updateUser(subscriber);
                subscriberList = userService.getAll(1, 10);
                req.setAttribute("subscriberList", subscriberList);

                if (isUpdateSuccess) {
                    req.setAttribute("toastMessage", "Update subscriber successfully!");
                    req.setAttribute("toastType", "success");
                } else {
                    req.setAttribute("toastMessage", "Update failed! Subscriber not found or invalid ID.");
                    req.setAttribute("toastType", "error");
                }
                req.getRequestDispatcher("view/admin.jsp").forward(req, resp);
                break;
            case "deleteSubscriber":
                String idStr = req.getParameter("id");
                boolean isDeleteSuccess = deleteSubscriber(idStr);
                subscriberList = userService.getAll(1, 10);
                req.setAttribute("subscriberList", subscriberList);

                if (isDeleteSuccess) {
                    req.setAttribute("toastMessage", "Delete subscriber successfully!");
                    req.setAttribute("toastType", "success");
                } else {
                    req.setAttribute("toastMessage", "Delete failed! Subscriber not found or invalid ID.");
                    req.setAttribute("toastType", "error");
                }
                req.getRequestDispatcher("view/admin.jsp").forward(req, resp);
                break;
            default:
                resp.sendRedirect(req.getContextPath() + "/Admin");
                break;
        }
    }

    public boolean deleteSubscriber(String idStr) {
        if (idStr != null && !idStr.trim().isEmpty()) {
            int deleteId = Integer.parseInt(idStr);
            boolean isSuccess = userService.deleteUser(deleteId);
            if (isSuccess) {
                return true;
            }
        }
        return false;
    }

}
