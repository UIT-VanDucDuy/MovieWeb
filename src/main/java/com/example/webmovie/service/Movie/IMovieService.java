package com.example.webmovie.service.Movie;

import com.example.webmovie.dto.MovieDto;
import com.example.webmovie.dto.MoviePage;
import com.example.webmovie.entity.Movie;


import java.util.List;

public interface IMovieService {
    MoviePage getMovies(String title,String genre,int pageSize, int page);
    List<MovieDto> getMoviesByGenre(String genre);
    List<Movie> getAll();
}
