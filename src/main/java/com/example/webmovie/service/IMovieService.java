package com.example.webmovie.service;

import com.example.webmovie.dto.MoviePage;
import com.example.webmovie.entity.Movie;

import java.util.List;

public interface IMovieService {
    MoviePage getMovies(String title,String genre,int pageSize, int page);
    List<Movie> getMoviesByGenre(String genre);
    List<Movie> getAll();
}
