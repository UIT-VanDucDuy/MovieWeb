package com.example.webmovie.repo;

import com.example.webmovie.entity.Movie;

import java.util.List;

public interface IMovieRepo {
    int countAll();
    int countByTitle(String title);
    int countByGenre(String genre);
    int countByTitleAndGenre(String title, String genre);
    List<Movie> getAll(int page,int pageSize);
    List<Movie> getByTitle(String title, int page, int pageSize);
    List<Movie> getByGenre(String genre, int page, int pageSize);
    List<Movie> getByTitleAndGenre(String title, String genre, int page, int pageSize);
}
