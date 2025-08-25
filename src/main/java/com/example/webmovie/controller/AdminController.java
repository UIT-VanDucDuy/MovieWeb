package com.example.webmovie.controller;

import com.example.webmovie.entity.Account;
import com.example.webmovie.dto.UserDTO;
import com.example.webmovie.entity.MemberType;
import com.example.webmovie.entity.User;
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
        String action = request.getParameter("action");
        List<String> genderList = Arrays.asList("Male", "Female");
        List<MemberType> memberTypeList = userService.getAllMemberType();
        List<UserDTO> userList;

        if (action == null) {
            action = "";
        }

        switch (action) {
            case "showAddForm":
                request.setAttribute("memberTypeList", memberTypeList);
                request.setAttribute("genderList", genderList);
                request.setAttribute("openAddSubscriberModal", true);
                break;
            case "showEditForm":
                UserDTO userDTO = userService.findById(Integer.parseInt(request.getParameter("id")));
                request.setAttribute("userInformation", userDTO);
                request.setAttribute("memberTypeList", memberTypeList);
                request.setAttribute("openEditModal", true);
                request.setAttribute("genderList", genderList);

                break;
        }
        userList = userService.getAll(1, 10);
        request.setAttribute("userList", userList);
        request.getRequestDispatcher("view/admin.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String action = req.getParameter("action");
        List<UserDTO> userList;
        if (action == null) {
            action = "";
        }
        switch (action) {
            case "updateUser":
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

                User user = new User(id, name, gender, birthday, address, phoneNumber, accountId);
                boolean isUpdateSuccess = userService.updateUser(user);
                userList = userService.getAll(1, 10);
                req.setAttribute("userList", userList);

                if (isUpdateSuccess) {
                    req.setAttribute("toastMessage", "Update user successfully!");
                    req.setAttribute("toastType", "success");
                } else {
                    req.setAttribute("toastMessage", "Update failed! User not found or invalid ID.");
                    req.setAttribute("toastType", "error");
                }
                req.getRequestDispatcher("view/admin.jsp").forward(req, resp);
                break;
            case "deleteUser":
                String idStr = req.getParameter("id");
                boolean isDeleteSuccess = deleteUser(idStr);
                userList = userService.getAll(1, 10);
                req.setAttribute("userList", userList);

                if (isDeleteSuccess) {
                    req.setAttribute("toastMessage", "Delete user successfully!");
                    req.setAttribute("toastType", "success");
                } else {
                    req.setAttribute("toastMessage", "Delete failed! User not found or invalid ID.");
                    req.setAttribute("toastType", "error");
                }
                req.getRequestDispatcher("view/admin.jsp").forward(req, resp);
                break;
            case "addUser":
                boolean isAddSuccess = addUser(req, resp);
                List<UserDTO> newUserList = userService.getAll(1, 10);
                req.setAttribute("userList", newUserList);
                if (isAddSuccess) {
                    req.setAttribute("toastMessage", "Added user successfully!");
                    req.setAttribute("toastType", "success");
                } else {
                    req.setAttribute("toastMessage", "Added failed! User not found or invalid ID.");
                    req.setAttribute("toastType", "error");
                }
                req.getRequestDispatcher("view/admin.jsp").forward(req, resp);
                break;
            default:
                resp.sendRedirect(req.getContextPath() + "/Admin");
                break;
        }
    }

    public boolean deleteUser(String idStr) {
        if (idStr != null && !idStr.trim().isEmpty()) {
            int deleteId = Integer.parseInt(idStr);
            boolean isSuccess = userService.deleteUser(deleteId);
            if (isSuccess) {
                return true;
            }
        }
        return false;
    }

    public boolean addUser(HttpServletRequest req, HttpServletResponse resp) {

        String userName = req.getParameter("name");
        String userEmail = req.getParameter("email");
        String userBirthdayStr = req.getParameter("birthday");
        Date userBirthday = null;

        try {
            userBirthday = Date.valueOf(userBirthdayStr);
        } catch (IllegalArgumentException e) {
            e.printStackTrace();
        }
        String userPhoneNumber = req.getParameter("phoneNumber");
        String userAddress = req.getParameter("address");
        boolean userGender = Boolean.parseBoolean(req.getParameter("gender"));
        String userUsername = req.getParameter("username");
        String userPassword = req.getParameter("password");
        int userMemberTypeId = Integer.parseInt(req.getParameter("memberTypeId"));
        UserDTO userDTO = new UserDTO(userName, userEmail, userBirthday, userPhoneNumber, userAddress, userGender, userUsername, userPassword, userMemberTypeId);
        return userService.addUser(userDTO);
    }

}
