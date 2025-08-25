package com.example.webmovie.service;

import com.example.webmovie.dto.MovieDto;
import com.example.webmovie.dto.MoviePage;


import java.util.List;

public interface IMovieService {
    MoviePage getMovies(String title,String genre,int pageSize, int page);
    List<MovieDto> getMoviesByGenre(String genre);
}
