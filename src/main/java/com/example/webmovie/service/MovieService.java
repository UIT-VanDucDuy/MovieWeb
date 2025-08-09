package com.example.webmovie.service;

import com.example.webmovie.entity.Movie;
import com.example.webmovie.repo.IMovieRepo;
import com.example.webmovie.repo.MovieRepo;

import java.util.List;

public class MovieService implements IMovieService {
    private IMovieRepo movieRepo= new MovieRepo();


    @Override
    public List<Movie> getAll() {
        return movieRepo.getAll();
    }

    @Override
    public List<Movie> getAll(int page,int pageSize) {
        return movieRepo.getAll(page,pageSize);
    }

    @Override
    public List<Movie> getByTitle(String title, int page,int pageSize) {
        return movieRepo.getByTitle(title, page, pageSize);
    }

    @Override
    public List<Movie> getByGenre(String genre, int page) {
        return movieRepo.getByGenre(genre, page);
    }

    public int countByTitle(String name){
        return 13;
    }
}
