package com.example.webmovie.controller;

import com.example.webmovie.entity.Movie;
import com.example.webmovie.entity.MoviePage;
import com.example.webmovie.service.IMovieService;
import com.example.webmovie.service.MovieService;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.List;

@WebServlet(name="searchController",value = "/Search")
public class SearchController extends HttpServlet {
    private IMovieService movieService= new MovieService();

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        int page = 1;
        try {
            if (request.getParameter("page") != null) {
                page = Integer.parseInt(request.getParameter("page"));
            }
        } catch (NumberFormatException e) {
            page = 1;
        }

        int pageSize = 12;
        MoviePage moviePage = movieService.getMovies(null,null,page, pageSize);

        request.setAttribute("movieList", moviePage.getMovies());
        request.setAttribute("currentPage", moviePage.getCurrentPage());
        request.setAttribute("totalPages", moviePage.getTotalPages());

        request.getRequestDispatcher("view/search.jsp").forward(request, response);
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        int page = 1;
        try {
            if (request.getParameter("page") != null) {
                page = Integer.parseInt(request.getParameter("page"));
            }
        } catch (NumberFormatException e) {
            page = 1;
        }

        int pageSize = 12;
        MoviePage moviePage = movieService.getMovies(null,null,page, pageSize);

        request.setAttribute("movieList", moviePage.getMovies());
        request.setAttribute("currentPage", moviePage.getCurrentPage());
        request.setAttribute("totalPages", moviePage.getTotalPages());

        request.getRequestDispatcher("view/search.jsp").forward(request, response);
    }
}
