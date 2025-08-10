package com.example.webmovie.repo;

import com.example.webmovie.entity.Movie;

import java.util.ArrayList;
import java.util.List;

public class MovieRepo implements IMovieRepo {
    private static List<Movie> movieList = new ArrayList<>();
    static{
        movieList.add(new Movie(1,"Movie1","https://image.tmdb.org/t/p/original/zP96avPSR22s8Hhvj0qimQKKDMj.jpg"));
        movieList.add(new Movie(2,"Movie2","https://image.tmdb.org/t/p/original/zP96avPSR22s8Hhvj0qimQKKDMj.jpg"));
        movieList.add(new Movie(3,"Movie3","https://image.tmdb.org/t/p/original/zP96avPSR22s8Hhvj0qimQKKDMj.jpg"));
        movieList.add(new Movie(4,"Movie4","https://image.tmdb.org/t/p/original/zP96avPSR22s8Hhvj0qimQKKDMj.jpg"));
        movieList.add(new Movie(5,"Movie5","https://image.tmdb.org/t/p/original/zP96avPSR22s8Hhvj0qimQKKDMj.jpg"));
        movieList.add(new Movie(6,"Movie6","https://image.tmdb.org/t/p/original/zP96avPSR22s8Hhvj0qimQKKDMj.jpg"));
        movieList.add(new Movie(7,"Movie7","https://image.tmdb.org/t/p/original/zP96avPSR22s8Hhvj0qimQKKDMj.jpg"));
        movieList.add(new Movie(8,"Movie8","https://image.tmdb.org/t/p/original/zP96avPSR22s8Hhvj0qimQKKDMj.jpg"));
        movieList.add(new Movie(9,"Movie9","https://image.tmdb.org/t/p/original/zP96avPSR22s8Hhvj0qimQKKDMj.jpg"));
        movieList.add(new Movie(10,"Movie10","https://image.tmdb.org/t/p/original/zP96avPSR22s8Hhvj0qimQKKDMj.jpg"));
        movieList.add(new Movie(11,"Movie11","https://image.tmdb.org/t/p/original/zP96avPSR22s8Hhvj0qimQKKDMj.jpg"));
        movieList.add(new Movie(12,"Movie12","https://image.tmdb.org/t/p/original/zP96avPSR22s8Hhvj0qimQKKDMj.jpg"));
        movieList.add(new Movie(13,"Movie13","https://image.tmdb.org/t/p/original/zP96avPSR22s8Hhvj0qimQKKDMj.jpg"));
    }

    @Override
    public int countAll() {
        return movieList.size();
    }

    @Override
    public List<Movie> getAll() {
        return movieList;
    }

    @Override
    public List<Movie> getAll(int page,int pageSize) {
        int startIndex = (page - 1) * pageSize;
        if (startIndex >= movieList.size()) {
            return new ArrayList<>(); // Không có dữ liệu
        }

        int endIndex = Math.min(startIndex + pageSize, movieList.size());
        return movieList.subList(startIndex, endIndex);
    }

    @Override
    public int countByTitle(String title) {
        return movieList.size();
    }

    @Override
    public List<Movie> getByTitle(String title, int page,int pageSize) {
        return movieList;
    }


}
