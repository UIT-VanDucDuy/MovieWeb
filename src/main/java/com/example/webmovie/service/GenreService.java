package com.example.webmovie.service;

import com.example.webmovie.entity.Genre;
import com.example.webmovie.repo.GenreRepo;
import com.example.webmovie.repo.IGenreRepo;

import java.util.List;

public class GenreService implements IGenreService {
    private IGenreRepo genreRepo = new GenreRepo();
    @Override
    public List<Genre> getAll() {
        return genreRepo.getAll();
    }
}
