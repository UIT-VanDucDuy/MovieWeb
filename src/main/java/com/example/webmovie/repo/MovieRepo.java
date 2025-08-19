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
    private final String FIND_BY_TITLE = "SELECT * FROM Movie WHERE Name LIKE CONCAT('%', ?, '%') limit ? offset ?";
    private static final String FIND_BY_GENRE_SQL =
            "SELECT m.Id, m.Name, m.MainActor, m.Author, m.Description, m.ReleaseDate, m.IsSeries, m.MemberTypeId " +
                    "FROM Movie m " +
                    "JOIN MovieGenre mg ON m.Id = mg.MovieId " +
                    "JOIN Genre g ON g.Id = mg.GenreId " +
                    "WHERE g.Name LIKE ?" +
                    "LIMIT ? OFFSET ?";
    private final String FIND_All = "SELECT * FROM Movie limit ? offset ?";


    @Override
    public int countByTitleAndGenre(String title, String genre) {
        return movieList.size();
    }

    @Override
    public List<Movie> getAll(int pageSize,int page) {
        List<Movie> movieList = new ArrayList<>();
        try (Connection connection = BaseRepository.getConnectDB();
             PreparedStatement ps = connection.prepareStatement(FIND_All)) {
            int offset = (page - 1) * pageSize;

            ps.setInt(1, pageSize);
            ps.setInt(2, offset);
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
    public List<Movie> getByTitle(String title, int pageSize,int page) {
        return movieList;
    }
    @Override
    public List<Movie> getByGenre(String genre, int pageSize,int page ) {
        List<Movie> movieList = new ArrayList<>();
        try (Connection connection = BaseRepository.getConnectDB();
             PreparedStatement ps = connection.prepareStatement(FIND_BY_GENRE_SQL)) {

            ps.setString(1, genre);
            ps.setInt(2, pageSize);
            ps.setInt(3, page);
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
    public List<Movie> getByTitleAndGenre(String title, String genre, int pageSize, int page) {
        return movieList;
    }

    @Override
    public int countAll() {
        int count = 0;
        String sql = "SELECT COUNT(*) FROM Movie";
        try (Connection connection = BaseRepository.getConnectDB();
             PreparedStatement ps = connection.prepareStatement(sql);
             ResultSet rs = ps.executeQuery()) {

            if (rs.next()) {
                count = rs.getInt(1);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return count;
    }

    @Override
    public int countByTitle(String title) {
        return movieList.size();
    }

    @Override
    public int countByGenre(String genre) {
        return movieList.size();
    }

}
