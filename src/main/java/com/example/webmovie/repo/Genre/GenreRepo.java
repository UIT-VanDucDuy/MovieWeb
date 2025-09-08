package com.example.webmovie.repo.Genre;

import com.example.webmovie.entity.Genre;
import com.example.webmovie.repo.BaseRepository;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class GenreRepo implements IGenreRepo {
    private final String GET_ALL_GENRE = "Select * From Genre";
    private final String GET_GENRE_BY_MOVIE_ID = "Select * From Genre g " +
            "Join moviegenre mg ON mg.GenreId = g.Id " +
            "Where  mg.MovieId = ?";
    @Override
    public List<Genre> getAll() {
        List<Genre> genres = new ArrayList<>();
        try (Connection connection = BaseRepository.getConnectDB();
             PreparedStatement ps = connection.prepareStatement(GET_ALL_GENRE)) {

            ResultSet rs = ps.executeQuery();

            while (rs.next()) {
                int id =rs.getInt("Id");
                String name =rs.getString("GenreName");
                genres.add(new Genre(id, name));
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return genres;
    }

    @Override
    public List<Genre> getGenreByMovieId(int movieId) {
        List<Genre> genres = new ArrayList<Genre>();
        try (Connection connection = BaseRepository.getConnectDB();
             PreparedStatement ps = connection.prepareStatement(GET_GENRE_BY_MOVIE_ID)) {
            ps.setInt(1, movieId);
            ResultSet rs = ps.executeQuery();

            while (rs.next()) {
                int id =rs.getInt("Id");
                String name =rs.getString("GenreName");
                genres.add(new Genre(id, name));
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return genres;
    }
}
