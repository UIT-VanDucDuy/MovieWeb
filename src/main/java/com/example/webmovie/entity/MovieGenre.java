package com.example.webmovie.entity;

public class MovieGenre {
    private int movieId;
    private int genreId;
    public MovieGenre(int movieId, int genreId) {
        this.movieId = movieId;
        this.genreId = genreId;
    }
    public int getMovieId() {
        return movieId;
    }

    public int getGenreId() {
        return genreId;
    }
}
