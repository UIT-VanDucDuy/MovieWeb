package com.example.webmovie.entity;

import java.util.List;

public class MoviePage {
    private List<Movie> movies;
    private int currentPage;
    private int totalPages;

    public MoviePage(List<Movie> movies, int currentPage, int totalPages) {
        this.movies = movies;
        this.currentPage = currentPage;
        this.totalPages = totalPages;
    }

    public List<Movie> getMovies() {
        return movies;
    }

    public int getCurrentPage() {
        return currentPage;
    }

    public int getTotalPages() {
        return totalPages;
    }
}
