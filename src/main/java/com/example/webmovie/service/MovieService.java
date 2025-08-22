package com.example.webmovie.service;

import com.example.webmovie.entity.Movie;
import com.example.webmovie.dto.MoviePage;
import com.example.webmovie.repo.IMovieRepo;
import com.example.webmovie.repo.MovieRepo;

import java.util.List;

public class MovieService implements IMovieService {
    private IMovieRepo movieRepo= new MovieRepo();

    @Override
    public MoviePage getMovies(String title, String genre, int pageSize, int page) {
        List<Movie> movieList;
        int totalMovies;

        totalMovies = movieRepo.countByTitleAndGenre(title, genre);
        movieList= movieRepo.getByTitleAndGenre(title,genre,pageSize, page);


        int totalPages = (int) Math.ceil((double) totalMovies / pageSize);
        if (totalPages == 0) totalPages = 1;

        if (page < 1) {
            page = 1;
        } else if (page > totalPages) {
            page = totalPages;
        }

        return new MoviePage(movieList, page, totalPages);
    }

    @Override
    public List<Movie> getMoviesByGenre(String genre) {
        return movieRepo.getByTitleAndGenre("",genre,10, 1);
    }
}
