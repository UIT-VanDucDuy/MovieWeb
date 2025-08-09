package com.example.webmovie.controller;

import com.example.webmovie.entity.Movie;
import com.example.webmovie.service.IMovieService;
import com.example.webmovie.service.MovieService;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.List;

@WebServlet(name="searchController",value = "/Search")
public class SearchController extends HttpServlet {
    private IMovieService movieService= new MovieService();

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        int page = 1;
        try {
            if (request.getParameter("page") != null) {
                page = Integer.parseInt(request.getParameter("page"));
            }
        } catch (NumberFormatException e) {
            page = 1; // Nếu page không phải số thì quay về trang 1
        }

        int pageSize = 12;
        int totalMovies = movieService.getAll().size();
        int totalPages = (int) Math.ceil((double) totalMovies / pageSize);

        // Nếu không có phim thì set totalPages = 1 để tránh chia cho 0
        if (totalPages == 0) {
            totalPages = 1;
        }

        // Giới hạn giá trị page
        if (page < 1) {
            page = 1;
        } else if (page > totalPages) {
            page = totalPages;
        }

        // Lấy danh sách phim theo trang
        List<Movie> movieList = movieService.getAll(page, pageSize);

        // Gửi dữ liệu sang JSP
        request.setAttribute("movieList", movieList);
        request.setAttribute("currentPage", page);
        request.setAttribute("totalPages", totalPages);

        // Forward tới JSP
        request.getRequestDispatcher("view/search.jsp").forward(request, response);
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        int page = 1;
        try {
            if (request.getParameter("page") != null) {
                page = Integer.parseInt(request.getParameter("page"));
            }
        } catch (NumberFormatException e) {
            page = 1; // Nếu page không phải số thì quay về trang 1
        }

        int pageSize = 12;
        int totalMovies = movieService.getAll().size();
        int totalPages = (int) Math.ceil((double) totalMovies / pageSize);

        // Nếu không có phim thì set totalPages = 1 để tránh chia cho 0
        if (totalPages == 0) {
            totalPages = 1;
        }

        // Giới hạn giá trị page
        if (page < 1) {
            page = 1;
        } else if (page > totalPages) {
            page = totalPages;
        }

        // Lấy danh sách phim theo trang
        List<Movie> movieList = movieService.getAll(page, pageSize);

        // Gửi dữ liệu sang JSP
        request.setAttribute("movieList", movieList);
        request.setAttribute("currentPage", page);
        request.setAttribute("totalPages", totalPages);

        // Forward tới JSP
        request.getRequestDispatcher("view/search.jsp").forward(request, response);
    }
}
