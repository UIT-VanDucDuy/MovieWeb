package com.example.webmovie.repo.Movie;

import com.example.webmovie.dto.MovieDto;
import com.example.webmovie.entity.Movie;
import com.example.webmovie.repo.BaseRepository;

import java.sql.*;
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
    private final String SELECT_ALL = "SELECT * FROM Movie ORDER BY Id DESC";
    private final String ADD_MOVIE = "INSERT INTO movie (Name, MainActor, Author, Description, ReleaseDate, IsSeries, MemberTypeId, PosterPath, BannerPath) VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?);";
    private final String ADD_EPISODE = "INSERT INTO episode (MovieId, EpisodeNumber, EpisodeTitle, Duration, TrailerPath, MoviePath, ReleaseDate) VALUES (?, ?, ?, ?, ?, ?, ?);";
    private final String DELETE_MOVIE = "DELETE FROM movie WHERE Id = ?;";
    private final String FIND_BY_ID = "SELECT m.*, e.Duration, e.TrailerPath, e.MoviePath, mb.MemberTypeName FROM movie m LEFT JOIN episode e ON (m.Id = e.MovieId) LEFT JOIN membertype mb ON (m.MemberTypeId = mb.Id) WHERE m.Id = ?;";
    private final String FIND_SAME_MOVIE = "SELECT m.*,mt.*,ep.TrailerPath, COUNT(*) AS CommonGenres " +
            "FROM MovieGenre mg1 " +
            "JOIN MovieGenre mg2 " +
            "    ON mg1.GenreId = mg2.GenreId " +
            "   AND mg2.MovieId <> 1 " +
            "JOIN Movie m " +
            "    ON mg2.MovieId = m.Id " +
            "Join membertype mt on mt.Id = m.MemberTypeId " +
            "join episode ep on ep.MovieId = m.Id " +
            "WHERE mg1.MovieId = ? " +
            "  AND mg2.MovieId <> ? " +
            "GROUP BY mg2.MovieId, m.Name " +
            "HAVING COUNT(*) >= 2 " +
            "limit 5;";
    private final String GET_MOVIE_COMING_SOON ="SELECT DISTINCT m.*,mt.MemberTypeName,e.TrailerPath " +
            "FROM Movie m " +
            "JOIN Episode e ON m.Id = e.MovieId " +
            "Join membertype mt on mt.Id = m.MemberTypeId " +
            "WHERE e.TrailerPath IS NOT NULL " +
            "  AND (e.MoviePath IS NULL OR e.MoviePath = '') " +
            "  limit 10;";
    @Override
    public List<MovieDto> getByTitleAndGenre(String title, String genre, int pageSize, int page) {
        List<MovieDto> movieList = new ArrayList<>();
        try (Connection connection = BaseRepository.getConnectDB();
             PreparedStatement ps = connection.prepareStatement(FIND_BY_TITLE_AND_GENRE)) {
            int offset = (page - 1) * pageSize;
            ps.setString(1, "%" + genre + "%");
            ps.setString(2, "%" + title + "%");
            ps.setInt(3, pageSize);
            ps.setInt(4, offset);
            ResultSet rs = ps.executeQuery();

            while (rs.next()) {
                int id = rs.getInt("Id");
                String name = rs.getString("Name");
                int memberTypeId = rs.getInt("MemberTypeId");
                String memberTypeName = rs.getString("MemberTypeName");
                String posterPath = rs.getString("PosterPath");
                String bannerPath = rs.getString("BannerPath");
                String trailerPath = rs.getString("TrailerPath");
                MovieDto movie = new MovieDto(id,name,memberTypeId,memberTypeName,posterPath,bannerPath,trailerPath);
                movieList.add(movie);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return movieList;
    }

    @Override

    public boolean addMovie(MovieDto movie) {
        boolean success = false;

        try (Connection connection = BaseRepository.getConnectDB()) {
            connection.setAutoCommit(false);

            try (
                    PreparedStatement psMovie = connection.prepareStatement(
                            ADD_MOVIE, Statement.RETURN_GENERATED_KEYS);
                    PreparedStatement psEpisode = connection.prepareStatement(
                            ADD_EPISODE)
            ) {
                // 1. Insert Movie
                psMovie.setString(1, movie.getName());
                psMovie.setString(2, movie.getMainActor());
                psMovie.setString(3, movie.getAuthor());
                psMovie.setString(4, movie.getDescription());
                psMovie.setDate(5, java.sql.Date.valueOf(movie.getReleaseDate())); // releaseDate "yyyy-MM-dd"
                psMovie.setBoolean(6, movie.isSeries());
                psMovie.setInt(7, movie.getMemberTypeId());
                psMovie.setString(8, movie.getPosterPath());
                psMovie.setString(9, movie.getBannerPath());

                int affectedRows = psMovie.executeUpdate();
                if (affectedRows == 0) {
                    throw new SQLException("Insert movie failed, no rows affected.");
                }

                // 2. Get MovieId
                int movieId;
                try (ResultSet generatedKeys = psMovie.getGeneratedKeys()) {
                    if (generatedKeys.next()) {
                        movieId = generatedKeys.getInt(1);
                    } else {
                        throw new SQLException("Insert movie failed, no ID obtained.");
                    }
                }


                psEpisode.setInt(1, movieId);
                psEpisode.setInt(2, 1);
                psEpisode.setString(3, movie.getName());
                psEpisode.setDouble(4, movie.getDuration());
                psEpisode.setString(5, movie.getTrailerPath());
                psEpisode.setString(6, movie.getMoviePath());
                psEpisode.setDate(7, java.sql.Date.valueOf(movie.getReleaseDate()));
                psEpisode.addBatch();

                connection.commit();
                success = true;

            } catch (Exception e) {
                connection.rollback();
                throw e;
            }
        } catch (Exception e) {
            e.printStackTrace();
        }

        return success;
    }


    @Override
    public boolean updateMovie(MovieDto movie) {
        return false;
    }

    @Override
    public boolean deleteMovie(int id) {
        boolean success = false;
        try (Connection connection = BaseRepository.getConnectDB()) {
            PreparedStatement ps = connection.prepareStatement(DELETE_MOVIE);
            ps.setInt(1, id);
            int affectedRows = ps.executeUpdate();
            if (affectedRows >= 1) {
                success = true;
                }
        } catch (SQLException e) {
            e.printStackTrace();
        }
         return success;
    }
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
                MovieDto movie = new MovieDto(id,name,memberTypeId,memberTypeName,posterPath,bannerPath,trailerPath);
                movieList.add(movie);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
       return movieList;
    }
@Override
    public MovieDto getById(int id) {
        MovieDto movie = null;
        try (Connection connection = BaseRepository.getConnectDB();
             PreparedStatement preparedStatement = connection.prepareStatement(FIND_BY_ID)) {
            preparedStatement.setInt(1, id);
            ResultSet rs = preparedStatement.executeQuery();

            if (rs.next()) {
                int movieId = rs.getInt("Id");
                String name = rs.getString("Name");
                String mainActor = rs.getString("MainActor");
                String author = rs.getString("Author");
                String description = rs.getString("Description");
                String releaseDate = rs.getString("ReleaseDate");
                boolean isSeries = rs.getBoolean("IsSeries");
                int memberTypeId = rs.getInt("MemberTypeId");
                String memberTypeName = rs.getString("MemberTypeName");
                String posterPath = rs.getString("PosterPath");
                String bannerPath = rs.getString("BannerPath");
                String trailerPath = rs.getString("TrailerPath");
                String moviePath = rs.getString("MoviePath");
                double duration = rs.getDouble("Duration");
                movie = new MovieDto(movieId, name, mainActor, author, description, releaseDate, isSeries, memberTypeId, memberTypeName, posterPath, bannerPath, trailerPath, moviePath, duration);
            }

        } catch (Exception e) {
            e.printStackTrace();
        }
        return movie;
    }
  
   @Override
    public List<MovieDto> getMovieComingSoon() {
        List<MovieDto> movieList = new ArrayList<>();
        try (Connection connection = BaseRepository.getConnectDB();
             PreparedStatement ps = connection.prepareStatement(GET_MOVIE_COMING_SOON)) {
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                int id =rs.getInt("Id");
                String name =rs.getString("Name");
                int memberTypeId = rs.getInt("MemberTypeId");
                String memberTypeName = rs.getString("MemberTypeName");
                String posterPath = rs.getString("PosterPath");
                String bannerPath = rs.getString("BannerPath");
                String trailerPath = rs.getString("TrailerPath");
                MovieDto movie = new MovieDto(id,name,memberTypeId,memberTypeName,posterPath,bannerPath,trailerPath);
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
            ps.setString(1, "%" + genre + "%");
            ps.setString(2, "%" + title + "%");
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

                Movie movie = new Movie(id, name, mainActor, author, description, releaseDate, isSeries, memberTypeId, posterPath, bannerPath);
                movies.add(movie);
            }

        } catch (SQLException e) {
            e.printStackTrace();
            System.out.println("Lỗi query");
        }
        return movies;
    }
}
