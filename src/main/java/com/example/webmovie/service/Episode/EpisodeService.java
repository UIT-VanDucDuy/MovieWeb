package com.example.webmovie.service.Episode;

import com.example.webmovie.dto.MovieDto;
import com.example.webmovie.repo.Episode.EpisodeRepo;
import com.example.webmovie.repo.Episode.IEpisodeRepo;

public class EpisodeService implements IEpisodeService {
    private IEpisodeRepo episodeRepo = new EpisodeRepo();
    @Override
    public MovieDto getEpisode(int movieId) {
        return episodeRepo.getEpisodeByMovieId(movieId);
    }
}
