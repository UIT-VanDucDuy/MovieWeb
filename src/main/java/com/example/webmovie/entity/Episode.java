package com.example.webmovie.entity;

public class Episode {
    private int id;
    private int movieId;
    private int episodeNumber;
    private String episodeTitle;
    private int Duration;
    private String releaseDate;
    private String trailerPath;
    private String moviePath;


    public Episode(int id, int duration, String moviePath) {
        this.id = id;
        Duration = duration;
        this.moviePath = moviePath;
    }
}
