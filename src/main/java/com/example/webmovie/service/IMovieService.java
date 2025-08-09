package com.example.webmovie.service;

import com.example.webmovie.entity.Movie;

import java.util.List;

public interface IMovieService {
    List<Movie> getAll();
    List<Movie> getAll(int page,int pageSize);
    List<Movie> getByTitle(String title, int page, int pageSize);
    List<Movie> getByGenre(String genre, int page);

    int countByTitle(String name);
}
