package com.example.webmovie.controller.admin_page;

import com.example.webmovie.entity.Genre;
import com.example.webmovie.entity.Movie;
import com.example.webmovie.service.Genre.GenreService;
import com.example.webmovie.service.Genre.IGenreService;
import com.example.webmovie.service.Movie.IMovieService;
import com.example.webmovie.service.Movie.MovieService;


import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

@WebServlet(name="movieAdminController",value ="/admin/movies")
public class MovieAdminController extends HttpServlet {
    private IMovieService movieService = new MovieService();
    private IGenreService genreService = new GenreService();

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String action = req.getParameter("action");
        List<Movie> movieList = movieService.getAll();
        List<Genre> genres = genreService.getAll();

        if (action == null) {
            action = "";
        }

        switch (action) {
            case "showAddForm":
                req.setAttribute("genres", genres);
                req.setAttribute("openAddMovieModal", true);
                break;
        }
        req.setAttribute("movieList", movieList);
        req.getRequestDispatcher("/view/admin_page/movie_management.jsp").forward(req, resp);
    }
}
