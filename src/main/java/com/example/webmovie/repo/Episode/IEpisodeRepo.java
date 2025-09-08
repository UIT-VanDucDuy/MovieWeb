package com.example.webmovie.repo.Episode;

import com.example.webmovie.dto.MovieDto;

public interface IEpisodeRepo {
    MovieDto getEpisodeByMovieId(int moiveId);
}
