package com.example.webmovie.entity;

public class Genre {
    private int id;
    private String genreName;
    public Genre(int id, String genre) {
        this.id = id;
        this.genreName = genre;
    }
    public int getId() {
        return id;
    }
    public void setId(int id) {
        this.id = id;
    }
    public String getGenreName() {
        return genreName;
    }
}
