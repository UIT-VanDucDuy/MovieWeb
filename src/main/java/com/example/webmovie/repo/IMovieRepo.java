package com.example.webmovie.repo;

import com.example.webmovie.entity.Movie;

import java.util.List;

public interface IMovieRepo {

    int countByTitleAndGenre(String title, String genre);
    List<Movie> getByTitleAndGenre(String title, String genre, int pageSize, int page);
}
