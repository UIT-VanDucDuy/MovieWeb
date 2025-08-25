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
}

