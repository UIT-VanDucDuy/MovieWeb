package com.example.webmovie.repo;

import com.example.webmovie.entity.Genre;

import java.util.List;

public interface IGenreRepo {
    List<Genre> getAll();
}
