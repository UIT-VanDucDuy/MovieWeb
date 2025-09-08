package com.example.webmovie.controller;

import com.example.webmovie.dto.UserDTO;
import com.example.webmovie.entity.Account;
import com.example.webmovie.entity.Genre;
import com.example.webmovie.entity.User;
import com.example.webmovie.service.Account.AccountService;
import com.example.webmovie.service.Account.IAccountService;
import com.example.webmovie.service.Genre.GenreService;
import com.example.webmovie.service.Genre.IGenreService;
import com.example.webmovie.service.User.IUserService;
import com.example.webmovie.service.User.UserService;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.util.List;
import java.sql.Date;

@WebServlet(name = "UserController", value = "/User")
public class UserController extends HttpServlet {
    private IGenreService genreService = new GenreService();
    private IUserService userService = new UserService();
    private IAccountService accountService = new AccountService();
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        HttpSession session = request.getSession(false);
        Account account = (session != null) ? (Account) session.getAttribute("account") : null;
        List<Genre> genreList = genreService.getAll();
        UserDTO userDTO = userService.findUserByAccountId(account.getId());
        request.setAttribute("GenreList",genreList);
        request.setAttribute("User",userDTO);
        request.getRequestDispatcher("view/user.jsp").forward(request, response);
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        HttpSession session = request.getSession(false);
        Account account = (session != null) ? (Account) session.getAttribute("account") : null;
        List<Genre> genreList = genreService.getAll();
        UserDTO userDTO = userService.findUserByAccountId(account.getId());
        request.setAttribute("GenreList",genreList);
        request.setAttribute("User",userDTO);

        String action = request.getParameter("action");
        if (action == null) {
            action = "";
        }
        switch (action){
            case "changePassword":
                String oldPassword = request.getParameter("oldPassword");
                String newPassword1 = request.getParameter("newPassword1");
                String newPassword2 = request.getParameter("newPassword2");
                boolean result = accountService.changePassword(account,oldPassword,newPassword1,newPassword2,request);
                if (result) {
                    request.setAttribute("alertMessage", "Password changed successfully!");
                }
                request.getRequestDispatcher("view/user.jsp").forward(request, response);
                break;
            case "changeInfo":
                String name = request.getParameter("name");
                String phoneNumber = request.getParameter("phoneNumber");
                String address = request.getParameter("address");
                String birthday = request.getParameter("birthday");
                Date sqlDate = Date.valueOf(birthday);
                System.out.println(sqlDate);
                boolean gender = Boolean.parseBoolean(request.getParameter("gender"));
                User user = new User(name,gender,sqlDate,address,phoneNumber,account.getId());
                boolean isSuccess =userService.updateUserByAccountId(user);
                if(isSuccess){
                    request.setAttribute("alertMessage", "Information updated successfully");
                }else {
                    request.setAttribute("alertMessage", "Failed to update information");
                }
                request.getRequestDispatcher("view/user.jsp").forward(request, response);
                break;
        }
    }
}
