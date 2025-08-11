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


    public Episode(int id, int movieId, int episodeNumber, String episodeTitle, int duration, String releaseDate,
                   String trailerPath, String moviePath) {
        this.id = id;
        this.movieId = movieId;
        this.episodeNumber = episodeNumber;
        this.episodeTitle = episodeTitle;
        Duration = duration;
        this.releaseDate = releaseDate;
        this.trailerPath = trailerPath;
        this.moviePath = moviePath;
    }
}
