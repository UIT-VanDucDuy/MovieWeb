package com.example.webmovie.controller;

import com.example.webmovie.dto.UserDTO;
import com.example.webmovie.entity.Account;
import com.example.webmovie.entity.Genre;
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

@WebServlet(name = "UserController", value = "/User")
public class UserController extends HttpServlet {
    private IGenreService genreService = new GenreService();
    private IUserService userService = new UserService();
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        HttpSession session = request.getSession(false);
        Account account = (session != null) ? (Account) session.getAttribute("account") : null;
        List<Genre> genreList = genreService.getAll();
        UserDTO userDTO = userService.findUserByAccountId(account.getId());
        request.setAttribute("GenreList",genreList);
        request.setAttribute("User",userDTO);
        request.getRequestDispatcher("view/user.jsp").forward(request, response);
    }
}
