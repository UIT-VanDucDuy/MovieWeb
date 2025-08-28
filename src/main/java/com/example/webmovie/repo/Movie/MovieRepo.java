package com.example.webmovie.repo.Movie;

import com.example.webmovie.dto.MovieDto;
import com.example.webmovie.entity.Movie;
import com.example.webmovie.repo.BaseRepository;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class MovieRepo implements IMovieRepo {
    private final String FIND_BY_TITLE_AND_GENRE ="SELECT DISTINCT m.*,mt.MemberTypeName FROM Movie m " +
            "JOIN MovieGenre mg ON m.Id = mg.MovieId " +
            "JOIN Genre g ON g.Id = mg.GenreId " +
            "Join membertype mt on mt.Id = m.MemberTypeId "  +
            "WHERE g.GenreName LIKE ? " +
            "and m.Name Like ? " +
            "limit ? offset ? ";
    private final String COUNT_BY_TITLE_AND_GENRE ="SELECT COUNT(DISTINCT m.Id)" +
            "FROM Movie m " +
            "JOIN MovieGenre mg ON m.Id = mg.MovieId " +
            "JOIN Genre g ON g.Id = mg.GenreId " +
            "WHERE g.GenreName LIKE ? " +
            "AND m.Name LIKE ?; ";
    private final String SELECT_ALL = "SELECT * FROM Movie";


    @Override
    public List<MovieDto> getByTitleAndGenre(String title, String genre, int pageSize,int page ) {
        List<MovieDto> movieList = new ArrayList<>();
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
                String memberTypeName = rs.getString("MemberTypeName");
                String posterPath = rs.getString("PosterPath");
                String bannerPath = rs.getString("BannerPath");
                MovieDto movie = new MovieDto(id,name,memberTypeId,memberTypeName,posterPath,bannerPath);movieList.add(movie);
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
    @Override
    public List<Movie> getAll() {
        List<Movie> movies = new ArrayList<>();
        try (Connection connection = BaseRepository.getConnectDB();
             PreparedStatement preparedStatement = connection.prepareStatement(SELECT_ALL)) {

            ResultSet rs = preparedStatement.executeQuery();
            while (rs.next()) {

                int id = rs.getInt("Id");
                String name = rs.getString("Name");
                String mainActor = rs.getString("MainActor");
                String author = rs.getString("Author");
                String description = rs.getString("Description");
                String releaseDate = rs.getString("ReleaseDate");
                boolean isSeries = rs.getBoolean("IsSeries");
                int memberTypeId = rs.getInt("MemberTypeId");
                String posterPath = rs.getString("PosterPath");
                String bannerPath = rs.getString("BannerPath");

                Movie movie = new Movie(id, name, mainActor, author,description,releaseDate,isSeries, memberTypeId, posterPath, bannerPath);
                movies.add(movie);
            }

        } catch (SQLException e) {
            e.printStackTrace();
            System.out.println("Lỗi query");
        }
        return movies;
    }
}
