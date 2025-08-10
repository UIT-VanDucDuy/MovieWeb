package com.example.webmovie.repo;

import com.example.webmovie.entity.Movie;

import java.util.List;

public interface IMovieRepo {
    int countAll();
    List<Movie> getAll();
    List<Movie> getAll(int page,int pageSize);
    int countByTitle(String title);
    List<Movie> getByTitle(String title, int page, int pageSize);
}
