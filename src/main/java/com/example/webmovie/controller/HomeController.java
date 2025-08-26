package com.example.webmovie.controller;

import com.example.webmovie.dto.MovieDto;
import com.example.webmovie.dto.UserDTO;
import com.example.webmovie.entity.Account;
import com.example.webmovie.entity.Genre;
import com.example.webmovie.service.Account.AccountService;
import com.example.webmovie.service.Account.IAccountService;
import com.example.webmovie.service.Genre.GenreService;
import com.example.webmovie.service.Genre.IGenreService;
import com.example.webmovie.service.Movie.IMovieService;
import com.example.webmovie.service.Movie.MovieService;
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

@WebServlet(name = "homeController", value = "/Home")
public class HomeController extends HttpServlet {
    private static IAccountService accountService = new AccountService();
    private static IGenreService genreService = new GenreService();
    private static IMovieService movieService= new MovieService();
    private static IUserService userService = new UserService();

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        loadPage(request, response);
        String errorLogin = request.getParameter("errorLogin");
        String noPermission = request.getParameter("noPermission");
        if ("1".equals(errorLogin)) {
            request.setAttribute("errorLogin", "You are not logged in");
        }
        if ("1".equals(noPermission)) {
            request.setAttribute("noPermission", "Let's subscribe to watch this movie");
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
                String email = request.getParameter("email");
                String passwordSignUp1 = request.getParameter("password1");
                String passwordSignUp2 = request.getParameter("password2");

                boolean success = accountService.signUp(usernameSignUp,email,
                        passwordSignUp1, passwordSignUp2, request);
                if (success) {
                    request.setAttribute("success", "Registration successful");
                    request.getRequestDispatcher("view/home.jsp").forward(request, response);
                } else {
                    request.getRequestDispatcher("view/home.jsp").forward(request, response);
                }
                break;
            case "subscribe":
                int newMemberType = Integer.parseInt(request.getParameter("subscribe"));
                HttpSession session = request.getSession(false);
                Account account = (session != null) ? (Account) session.getAttribute("account") : null;
                boolean issuccess = accountService.subscribe(account, newMemberType,request);
                if (issuccess) {
                    request.setAttribute("subscribeSuccess", "Subscribe successful");
                    request.getRequestDispatcher("view/home.jsp").forward(request, response);
                } else {
                    request.setAttribute("subscribeFail", "Insufficient balance to subscribe to this plan");
                    request.getRequestDispatcher("view/home.jsp").forward(request, response);
                }
                break;
            default:

        }
    }
    private static void loadPage(HttpServletRequest request, HttpServletResponse response){
        HttpSession session = request.getSession(false);
        Account account = (session != null) ? (Account) session.getAttribute("account") : null;
        if(account != null){
            UserDTO UserDTO = userService.findUserByAccountId(account.getId());
            request.setAttribute("User", UserDTO);
        }
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
