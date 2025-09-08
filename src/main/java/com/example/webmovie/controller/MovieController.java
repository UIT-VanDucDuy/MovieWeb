package com.example.webmovie.controller;

import com.example.webmovie.dto.MovieDto;
import com.example.webmovie.dto.UserDTO;
import com.example.webmovie.entity.Account;
import com.example.webmovie.entity.Genre;
import com.example.webmovie.service.Episode.EpisodeService;
import com.example.webmovie.service.Episode.IEpisodeService;
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

@WebServlet(name="movieController",value ="/Movie")
public class MovieController extends HttpServlet {
    private IGenreService genreService = new GenreService();
    private IEpisodeService episodeService = new EpisodeService();
    private IMovieService movieService = new MovieService();
    private IUserService userService = new UserService();
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        HttpSession session = request.getSession(false);
        Account account = (session != null) ? (Account) session.getAttribute("account") : null;
        if(account != null){
            UserDTO UserDTO = userService.findUserByAccountId(account.getId());
            request.setAttribute("User", UserDTO);
        }
        List<Genre> genreList = genreService.getAll();
        MovieDto movieDto = episodeService.getEpisode(Integer.parseInt(request.getParameter("movieId")));
        List<MovieDto> sameMovies = movieService.getSameMovie(movieDto.getId());
        request.setAttribute("GenreList",genreList);
        request.setAttribute("movie",movieDto);
        request.setAttribute("sameMoviesList",sameMovies);
        request.getRequestDispatcher("view/movie.jsp").forward(request, response);
    }
}
