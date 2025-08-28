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
    @Override
    public List<Genre> getAll() {
        List<Genre> genres = new ArrayList<Genre>();
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
}
