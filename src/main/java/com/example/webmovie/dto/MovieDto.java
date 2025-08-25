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

    public MovieDto(int id, String name,int memberTypeId,String memberType,String posterPath,String bannerPath) {
        this.id = id;
        this.name = name;
        this.memberTypeId = memberTypeId;
        this.memberType = memberType;
        this.posterPath = posterPath;
        this.bannerPath = bannerPath;

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
}
