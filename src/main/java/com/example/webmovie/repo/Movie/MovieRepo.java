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
    private final String FIND_BY_TITLE_AND_GENRE ="SELECT DISTINCT m.*,mt.MemberTypeName,ep.TrailerPath FROM Movie m " +
            "            JOIN MovieGenre mg ON m.Id = mg.MovieId " +
            "            JOIN Genre g ON g.Id = mg.GenreId " +
            "            Join membertype mt on mt.Id = m.MemberTypeId " +
            "            join episode ep on m.Id = ep.MovieId" +
            "            WHERE g.GenreName LIKE ? " +
            "            and m.Name Like ? " +
            " limit ? offset ? ";

    private final String COUNT_BY_TITLE_AND_GENRE ="SELECT COUNT(DISTINCT m.Id)" +
            "FROM Movie m " +
            "JOIN MovieGenre mg ON m.Id = mg.MovieId " +
            "JOIN Genre g ON g.Id = mg.GenreId " +
            "WHERE g.GenreName LIKE ? " +
            "AND m.Name LIKE ?; ";
    private final String SELECT_ALL = "SELECT * FROM Movie";
    private final String FIND_SAME_MOVIE = "SELECT m.*,mt.MemberTypeName, COUNT(*) AS CommonGenres " +
            "FROM MovieGenre mg1 " +
            "JOIN MovieGenre mg2 " +
            "    ON mg1.GenreId = mg2.GenreId " +
            "   AND mg2.MovieId <> 1 " +
            "JOIN Movie m " +
            "    ON mg2.MovieId = m.Id " +
            "Join membertype mt on mt.Id = m.MemberTypeId " +
            "WHERE mg1.MovieId = ? " +
            "  AND mg2.MovieId <> ? " +
            "GROUP BY mg2.MovieId, m.Name " +
            "HAVING COUNT(*) >= 2 " +
            "limit 5;";

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
                String trailerPath = rs.getString("TrailerPath");
                MovieDto movie = new MovieDto(id,name,memberTypeId,memberTypeName,posterPath,bannerPath,trailerPath);movieList.add(movie);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return movieList;
    }

    @Override
    public List<MovieDto> getSameMovie(int idMovie) {
        List<MovieDto> movieList = new ArrayList<>();
        try (Connection connection = BaseRepository.getConnectDB();
             PreparedStatement ps = connection.prepareStatement(FIND_SAME_MOVIE)) {
            ps.setInt(1,idMovie );
            ps.setInt(2,idMovie );
            ResultSet rs = ps.executeQuery();

            while (rs.next()) {
                int id =rs.getInt("Id");
                String name =rs.getString("Name");
                int memberTypeId = rs.getInt("MemberTypeId");
                String memberTypeName = rs.getString("MemberTypeName");
                String posterPath = rs.getString("PosterPath");
                String bannerPath = rs.getString("BannerPath");
                String trailerPath = rs.getString("TrailerPath");
                MovieDto movie = new MovieDto(id,name,memberTypeId,memberTypeName,posterPath,bannerPath,trailerPath);movieList.add(movie);
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
