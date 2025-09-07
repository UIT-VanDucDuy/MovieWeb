package com.example.webmovie.controller.admin_page;

import com.example.webmovie.dto.MovieDto;
import com.example.webmovie.entity.Genre;
import com.example.webmovie.entity.MemberType;
import com.example.webmovie.entity.Movie;
import com.example.webmovie.repo.MemberType.IMemberTypeRepo;
import com.example.webmovie.service.Genre.GenreService;
import com.example.webmovie.service.Genre.IGenreService;
import com.example.webmovie.service.Membertype.IMemberTypeService;
import com.example.webmovie.service.Membertype.MemberTypeService;
import com.example.webmovie.service.Movie.IMovieService;
import com.example.webmovie.service.Movie.MovieService;


import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

@WebServlet(name = "movieAdminController", value = "/admin/movies")
public class MovieAdminController extends HttpServlet {
    private IMovieService movieService = new MovieService();
    private IGenreService genreService = new GenreService();
    private IMemberTypeService memberTypeService = new MemberTypeService();

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String action = req.getParameter("action");
        List<Movie> movieList = movieService.getAll();
        List<Genre> genres = genreService.getAll();
        List<MemberType> memberTypeList = memberTypeService.getMemberType();

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
        req.setAttribute("memberTypeList", memberTypeList);
        req.getRequestDispatcher("/view/admin_page/movie_management.jsp").forward(req, resp);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String action = req.getParameter("action");

        if (action == null) {
            action = "";
        }

        switch (action) {
            case "addMovie":
                addMovie(req, resp);
                break;
            case "deleteMovie":
                deleteMovie(req, resp);
                break;
        }
    }

    public void addMovie(HttpServletRequest req, HttpServletResponse resp) {
        String name = req.getParameter("name");
        String mainActor = req.getParameter("mainActor");
        String author = req.getParameter("author");
        String description = req.getParameter("description");
        String releaseDate = req.getParameter("releaseDate");
        boolean isSeries = Boolean.parseBoolean(req.getParameter("isSeries"));
        int memberTypeId = Integer.parseInt(req.getParameter("memberTypeId"));
        String posterPath = req.getParameter("posterPath");
        String bannerPath = req.getParameter("bannerPath");
        String trailerPath = req.getParameter("trailerPath");
        String moviePath = req.getParameter("moviePath");
        double duration = req.getParameter("duration") == null ? 0 : Double.parseDouble(req.getParameter("duration"));

        MovieDto movieDto = new MovieDto(name, mainActor, author, description, releaseDate, isSeries, memberTypeId, posterPath, bannerPath, trailerPath, moviePath, duration);
        boolean isSuccess = movieService.addMovie(movieDto);

        if (isSuccess) {
            req.setAttribute("toastMessage", "Add movie successful");
            req.setAttribute("toastType", "success");
        } else {
            req.setAttribute("toastMessage", "Add movie failed");
            req.setAttribute("toastType", "danger");
        }
        req.setAttribute("movieList", movieService.getAll());

        try {
            req.getRequestDispatcher("/view/admin_page/movie_management.jsp").forward(req, resp);
        } catch (Exception e) {
            req.setAttribute("toastMessage", "Add movie failed");
            req.setAttribute("toastType", "danger");
        }
    }

    public void deleteMovie(HttpServletRequest req, HttpServletResponse resp) {

        int id = Integer.parseInt(req.getParameter("deleteMovieId"));
        boolean isSuccess = movieService.deleteMovie(id);
        if (isSuccess) {
            req.setAttribute("toastMessage", "Add movie successful");
            req.setAttribute("toastType", "success");
        } else {
            req.setAttribute("toastMessage", "Add movie failed");
            req.setAttribute("toastType", "danger");
        }
        req.setAttribute("movieList", movieService.getAll());

        try {
            req.getRequestDispatcher("/view/admin_page/movie_management.jsp").forward(req, resp);
        } catch (Exception e) {
            req.setAttribute("toastMessage", "Add movie failed");
            req.setAttribute("toastType", "danger");
        }
    }

}
