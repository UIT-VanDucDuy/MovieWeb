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

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public int getMovieId() {
        return movieId;
    }

    public void setMovieId(int movieId) {
        this.movieId = movieId;
    }

    public int getEpisodeNumber() {
        return episodeNumber;
    }

    public void setEpisodeNumber(int episodeNumber) {
        this.episodeNumber = episodeNumber;
    }

    public String getEpisodeTitle() {
        return episodeTitle;
    }

    public void setEpisodeTitle(String episodeTitle) {
        this.episodeTitle = episodeTitle;
    }

    public int getDuration() {
        return Duration;
    }

    public void setDuration(int duration) {
        Duration = duration;
    }

    public String getReleaseDate() {
        return releaseDate;
    }

    public void setReleaseDate(String releaseDate) {
        this.releaseDate = releaseDate;
    }

    public String getTrailerPath() {
        return trailerPath;
    }

    public void setTrailerPath(String trailerPath) {
        this.trailerPath = trailerPath;
    }

    public String getMoviePath() {
        return moviePath;
    }

    public void setMoviePath(String moviePath) {
        this.moviePath = moviePath;
    }
}
