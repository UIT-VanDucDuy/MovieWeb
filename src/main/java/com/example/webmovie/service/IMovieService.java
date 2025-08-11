package com.example.webmovie.service;

import com.example.webmovie.entity.Movie;
import com.example.webmovie.entity.MoviePage;

import java.util.List;

public interface IMovieService {
    MoviePage getMovies(String title,String genre,int page, int pageSize);
}
