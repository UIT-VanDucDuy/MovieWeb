package com.example.webmovie.controller;

import com.example.webmovie.dto.MovieDto;
import com.example.webmovie.entity.Account;
import com.example.webmovie.entity.Genre;
import com.example.webmovie.entity.Movie;
import com.example.webmovie.service.*;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

@WebServlet(name = "homeController", value = "/Home")
public class HomeController extends HttpServlet {
    private static IAccountService accountService = new AccountService();
    private static IGenreService genreService = new GenreService();
    private static IMovieService movieService= new MovieService();

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        loadPage(request, response);
        String errorLogin = request.getParameter("errorLogin");
        String noPermission = request.getParameter("noPermission");
        if ("1".equals(errorLogin)) {
            request.setAttribute("errorLogin", "You are not logged in");
        }
        if ("1".equals(noPermission)) {
            request.setAttribute("noPermission", "You don't have permission to watch this movie");
        }

            request.getRequestDispatcher("view/home.jsp").forward(request, response);
    }
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
       loadPage(request, response);
        String action = request.getParameter("action");
        if (action == null) {
            action = "";
        }
        switch (action) {
            case "login":
                String username = request.getParameter("username");
                String password = request.getParameter("password");
                if (accountService.login(username, password)!=null) {
                    HttpSession session = request.getSession(true);
                    Account account = accountService.login(username, password);
                    session.setAttribute("account", account);
                    response.sendRedirect(request.getContextPath() + "/Home");
                } else {
                    request.setAttribute("errorLogin", "Incorrect username or password!");
                    request.getRequestDispatcher("view/home.jsp").forward(request, response);
                }
                break;
            case "signUp":
                String usernameSignUp = request.getParameter("username");
                String passwordSignUp1 = request.getParameter("password1");
                String passwordSignUp2 = request.getParameter("password2");

                boolean success = accountService.signUp(usernameSignUp,
                        passwordSignUp1, passwordSignUp2, request);
                if (success) {
                    request.setAttribute("success", "Registration successful");
                    response.sendRedirect(request.getContextPath() + "view/home.jsp");
                } else {
                    request.getRequestDispatcher("view/home.jsp").forward(request, response);
                }
                break;
            case "subscribe":
                break;
            default:

        }
    }
    private static void loadPage(HttpServletRequest request, HttpServletResponse response){
        HttpSession session = request.getSession(false);
        Account account = (session != null) ? (Account) session.getAttribute("account") : null;

        List<Genre> genreList = genreService.getAll();
        request.setAttribute("GenreList", genreList);
        List<MovieDto> romanceMovie = movieService.getMoviesByGenre("Romance");
        request.setAttribute("RomanceMovieList", romanceMovie);
        List<MovieDto> actionMovie = movieService.getMoviesByGenre("Action");
        request.setAttribute("ActionMovieList", actionMovie);
        List<MovieDto> trendingMovie = movieService.getMoviesByGenre("");
        request.setAttribute("trendingMovieList", trendingMovie);
    }
}
