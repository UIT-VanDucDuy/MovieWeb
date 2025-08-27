package com.example.webmovie.entity;

public class Movie {
    private int id;
    private String name;
    private String mainActor;
    private String author;
    private String description;
    private String releaseDate;
    private boolean isSeries;
    private int memberTypeId;
    private String posterPath;
    private String bannerPath;

    public Movie(int id, String name, String mainActor, String author, String description, String releaseDate,
                 boolean isSeries, String posterPath, String bannerPath) {
        this.id = id;
        this.name = name;
        this.mainActor = mainActor;
        this.author = author;
        this.description = description;
        this.releaseDate = releaseDate;
        this.isSeries = isSeries;
        this.posterPath = posterPath;
        this.bannerPath = bannerPath;
    }
    public Movie(int id, String name,int memberTypeId,String posterPath,String bannerPath) {
        this.id = id;
        this.name = name;
        this.memberTypeId = memberTypeId;
        this.posterPath = posterPath;
        this.bannerPath = bannerPath;

    }

    public Movie(int id, String name, String mainActor, String author, String description, String releaseDate, boolean isSeries, int memberTypeId, String posterPath, String bannerPath) {
        this.id = id;
        this.name = name;
        this.mainActor = mainActor;
        this.author = author;
        this.description = description;
        this.releaseDate = releaseDate;
        this.isSeries = isSeries;
        this.memberTypeId = memberTypeId;
        this.posterPath = posterPath;
        this.bannerPath = bannerPath;
    }

    public String getPosterPath() {
        return posterPath;
    }

    public String getName() {
        return name;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
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

    public void setPosterPath(String posterPath) {
        this.posterPath = posterPath;
    }

    public String getBannerPath() {
        return bannerPath;
    }

    public void setBannerPath(String bannerPath) {
        this.bannerPath = bannerPath;
    }
}

