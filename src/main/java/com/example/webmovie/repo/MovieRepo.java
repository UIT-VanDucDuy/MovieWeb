package com.example.webmovie.repo;

import com.example.webmovie.entity.Movie;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class MovieRepo implements IMovieRepo {
    private static List<Movie> movieList = new ArrayList<>();
    private final String FIND_BY_TITLE_AND_GENRE ="SELECT m.* FROM Movie m JOIN MovieGenre mg ON m.Id = mg.MovieId " +
            "JOIN Genre g ON g.Id = mg.GenreId "  +
            "WHERE g.GenreName LIKE ? " +
            "and m.Name Like ? " +
            "limit ? offset ? ";
    private final String COUNT_BY_TITLE_AND_GENRE ="SELECT COUNT(DISTINCT m.Id)" +
            "FROM Movie m " +
            "JOIN MovieGenre mg ON m.Id = mg.MovieId " +
            "JOIN Genre g ON g.Id = mg.GenreId " +
            "WHERE g.GenreName LIKE ? " +
            "AND m.Name LIKE ?; ";

    @Override
    public List<Movie> getByTitleAndGenre(String title, String genre, int pageSize,int page ) {
        List<Movie> movieList = new ArrayList<>();
        try (Connection connection = BaseRepository.getConnectDB();
             PreparedStatement ps = connection.prepareStatement(FIND_BY_TITLE_AND_GENRE)) {
            int offset = (page - 1) * pageSize;
            ps.setString(1,"%"+ genre +"%");
            ps.setString(2,"%"+ title +"%");
            ps.setInt(3, pageSize);
            ps.setInt(4, offset);
            ResultSet rs = ps.executeQuery();

            while (rs.next()) {
                int id =rs.getInt("Id");
                String name =rs.getString("Name");
                int memberTypeId = rs.getInt("MemberTypeId");
                String posterPath = rs.getString("PosterPath");
                String bannerPath = rs.getString("BannerPath");
                Movie movie = new Movie(id,name,memberTypeId,posterPath,bannerPath);
                movieList.add(movie);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return movieList;
    }
    @Override
    public int countByTitleAndGenre(String title, String genre) {
        int count = 0;
        try (Connection connection = BaseRepository.getConnectDB();) {
            PreparedStatement ps = connection.prepareStatement(COUNT_BY_TITLE_AND_GENRE);
            ps.setString(1,"%"+ genre +"%");
            ps.setString(2,"%"+ title +"%");
            ResultSet rs = ps.executeQuery();

            if (rs.next()) {
                count = rs.getInt(1);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return count;
    }
}
