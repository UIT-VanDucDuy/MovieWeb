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


    public MovieDto(int id, String name,int memberTypeId,String memberType,String posterPath,String bannerPath) {
        this.id = id;
        this.name = name;
        this.memberTypeId = memberTypeId;
        this.memberType = memberType;
        this.posterPath = posterPath;
        this.bannerPath = bannerPath;
    }

    public MovieDto(String name, String mainActor, String author, String description, String releaseDate, boolean isSeries, int memberTypeId, String posterPath, String bannerPath, String trailerPath, String moviePath, double duration) {
        this.name = name;
        this.mainActor = mainActor;
        this.author = author;
        this.description = description;
        this.releaseDate = releaseDate;
        this.isSeries = isSeries;
        this.memberTypeId = memberTypeId;
        this.posterPath = posterPath;
        this.bannerPath = bannerPath;
        this.trailerPath = trailerPath;
        this.moviePath = moviePath;
        this.duration = duration;
    }

    public int getId() {
        return id;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getMainActor() {
        return mainActor;
    }

    public void setMainActor(String mainActor) {
        this.mainActor = mainActor;
    }

    public String getAuthor() {
        return author;
    }

    public void setAuthor(String author) {
        this.author = author;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    public String getReleaseDate() {
        return releaseDate;
    }

    public void setReleaseDate(String releaseDate) {
        this.releaseDate = releaseDate;
    }

    public boolean isSeries() {
        return isSeries;
    }

    public void setSeries(boolean series) {
        isSeries = series;
    }

    public int getMemberTypeId() {
        return memberTypeId;
    }

    public void setMemberTypeId(int memberTypeId) {
        this.memberTypeId = memberTypeId;
    }

    public String getMemberType() {
        return memberType;
    }

    public void setMemberType(String memberType) {
        this.memberType = memberType;
    }

    public String getPosterPath() {
        return posterPath;
    }

    public void setPosterPath(String posterPath) {
        this.posterPath = posterPath;
    }

    public String getBannerPath() {
        return bannerPath;
    }

    public void setBannerPath(String bannerPath) {
        this.bannerPath = bannerPath;
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

    public double getDuration() {
        return duration;
    }

    public void setDuration(double duration) {
        this.duration = duration;
    }
}
