package com.example.webmovie.controller;

import com.example.webmovie.entity.Account;
import com.example.webmovie.entity.Genre;
import com.example.webmovie.entity.Movie;
import com.example.webmovie.entity.MoviePage;
import com.example.webmovie.service.GenreService;
import com.example.webmovie.service.IGenreService;
import com.example.webmovie.service.IMovieService;
import com.example.webmovie.service.MovieService;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.util.List;

@WebServlet(name="searchController",value = "/Search")
public class SearchController extends HttpServlet {
    //hello
    private IMovieService movieService= new MovieService();
    private IGenreService genreService= new GenreService();

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        HttpSession session = request.getSession(false);
        Account account = (session != null) ? (Account) session.getAttribute("account") : null;
        List<Genre> genreList = genreService.getAll();
        request.setAttribute("GenreList",genreList);
        int page = 1;
        try {
            if (request.getParameter("page") != null) {
                page = Integer.parseInt(request.getParameter("page"));
            }
        } catch (NumberFormatException e) {
            page = 1;
        }

        int pageSize = 12;
        MoviePage moviePage = movieService.getMovies(null,null,pageSize,page );

        request.setAttribute("movieList", moviePage.getMovies());
        request.setAttribute("currentPage", moviePage.getCurrentPage());
        request.setAttribute("totalPages", moviePage.getTotalPages());

        request.getRequestDispatcher("view/search.jsp").forward(request, response);
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        HttpSession session = request.getSession(false);
        Account account = (session != null) ? (Account) session.getAttribute("account") : null;
        List<Genre> genreList = genreService.getAll();
        request.setAttribute("GenreList",genreList);

        int page = 1;
        try {
            if (request.getParameter("page") != null) {
                page = Integer.parseInt(request.getParameter("page"));
            }
        } catch (NumberFormatException e) {
            page = 1;
        }

        int pageSize = 12;
        MoviePage moviePage = movieService.getMovies(
                request.getParameter("title"),request.getParameter("genre"),pageSize,page );

        request.setAttribute("movieList", moviePage.getMovies());
        request.setAttribute("currentPage", moviePage.getCurrentPage());
        request.setAttribute("totalPages", moviePage.getTotalPages());

        request.getRequestDispatcher("view/search.jsp").forward(request, response);
    }
}
