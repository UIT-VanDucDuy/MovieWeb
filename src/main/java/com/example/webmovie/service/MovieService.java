package com.example.webmovie.service;

import com.example.webmovie.entity.Movie;
import com.example.webmovie.entity.MoviePage;
import com.example.webmovie.repo.IMovieRepo;
import com.example.webmovie.repo.MovieRepo;

import javax.servlet.http.HttpServletRequest;
import java.util.List;

public class MovieService implements IMovieService {
    private IMovieRepo movieRepo= new MovieRepo();

    @Override
    public MoviePage getMovies(String title, String genre, int page, int pageSize) {
        int totalMovies = movieRepo.countAll();
        int totalPages = (int) Math.ceil((double) totalMovies / pageSize);
        if (totalPages == 0) totalPages = 1;

        if (page < 1) {
            page = 1;
        } else if (page > totalPages) {
            page = totalPages;
        }

        List<Movie> movieList = movieRepo.getAll(page, pageSize);
        return new MoviePage(movieList, page, totalPages);
    }
}
