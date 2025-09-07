package com.example.webmovie.dto;

public class MovieDto {
    private int id;
    private String name;
    private String mainActor;
    private String author;
    private String description;
    private String releaseDate;
    private boolean isSeries;
    private int memberTypeId;
    private String memberType;
    private String posterPath;
    private String bannerPath;
    private String trailerPath;
    private String moviePath;
    private double duration;

    public MovieDto(int id, String name,int memberTypeId,String memberType,String posterPath,String bannerPath,String trailerPath) {
        this.id = id;
        this.name = name;
        this.memberTypeId = memberTypeId;
        this.memberType = memberType;
        this.posterPath = posterPath;
        this.bannerPath = bannerPath;
        this.trailerPath = trailerPath;
    }

    public MovieDto(int id, String name, String mainActor, String author, String description,
                    String releaseDate, String trailerPath, String moviePath, double duration) {
        this.id = id;
        this.name = name;
        this.mainActor = mainActor;
        this.author = author;
        this.description = description;
        this.releaseDate = releaseDate;
        this.trailerPath = trailerPath;
        this.moviePath = moviePath;
        this.duration = duration;
    }

    public String getPosterPath() {
        return posterPath;
    }

    public String getName() {
        return name;
    }
    public String getMemberType() {
        return memberType;
    }
    public int getMemberTypeId() {
        return memberTypeId;
    }

    public int getId() {
        return id;
    }

    public String getMainActor() {
        return mainActor;
    }

    public String getAuthor() {
        return author;
    }

    public String getDescription() {
        return description;
    }

    public String getReleaseDate() {
        return releaseDate;
    }

    public boolean isSeries() {
        return isSeries;
    }

    public String getBannerPath() {
        return bannerPath;
    }

    public String getTrailerPath() {
        return trailerPath;
    }

    public String getMoviePath() {
        return moviePath;
    }

    public double getDuration() {
        return duration;
    }
}
