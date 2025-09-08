package com.example.webmovie.repo.Episode;

import com.example.webmovie.dto.MovieDto;
import com.example.webmovie.dto.UserDTO;
import com.example.webmovie.entity.Episode;
import com.example.webmovie.entity.Genre;
import com.example.webmovie.repo.BaseRepository;
import com.example.webmovie.repo.Genre.GenreRepo;
import com.example.webmovie.repo.Genre.IGenreRepo;
import com.sun.tools.javac.jvm.Gen;

import java.sql.*;
import java.util.List;

public class EpisodeRepo implements IEpisodeRepo {
    private IGenreRepo genreRepo = new GenreRepo();
    private final String GET_EPISODE_BY_MOVIEID = "select m.*, e.TrailerPath,e.MoviePath,e.Duration " +
            "from movie m " +
            "join episode e on e.MovieId = m.Id " +
            "where m.Id = ?;";

    @Override
    public MovieDto getEpisodeByMovieId(int moiveId) {
        try (Connection connection = BaseRepository.getConnectDB();
             PreparedStatement preparedStatement = connection.prepareStatement(GET_EPISODE_BY_MOVIEID)) {
            preparedStatement.setInt(1, moiveId);
            ResultSet rs = preparedStatement.executeQuery();
            while (rs.next()) {
                int id = rs.getInt("Id");
                String name= rs.getString("Name");
                List<Genre> genres = genreRepo.getGenreByMovieId(moiveId);
                String mainActor = rs.getString("MainActor");
                String author= rs.getString("Author");
                String description= rs.getString("Description");
                String releaseDate= rs.getString("ReleaseDate");
                String trailerPath= rs.getString("TrailerPath");
                String bannerPath= rs.getString("BannerPath");
                String moviePath= rs.getString("MoviePath");
                double duration= rs.getDouble("Duration");
                MovieDto movieDto = new MovieDto(id,name,genres,mainActor,author,description,releaseDate,bannerPath,trailerPath,moviePath,duration);
                return movieDto;
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return null;
    }
}
