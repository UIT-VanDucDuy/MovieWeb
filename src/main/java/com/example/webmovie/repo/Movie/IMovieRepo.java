package com.example.webmovie.repo.Movie;

import com.example.webmovie.dto.MovieDto;
import com.example.webmovie.entity.Movie;

import java.util.List;

public interface IMovieRepo {
    List<Movie> getAll();
    int countByTitleAndGenre(String title, String genre);
    List<MovieDto> getByTitleAndGenre(String title, String genre, int pageSize, int page);
}
