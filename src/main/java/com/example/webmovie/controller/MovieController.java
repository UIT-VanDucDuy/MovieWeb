package com.example.webmovie.controller;

import com.example.webmovie.entity.Account;
import com.example.webmovie.entity.Genre;
import com.example.webmovie.service.Genre.GenreService;
import com.example.webmovie.service.Genre.IGenreService;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.util.List;

@WebServlet(name="movieController",value ="/Movie")
public class MovieController extends HttpServlet {
    private IGenreService genreService = new GenreService();
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        HttpSession session = request.getSession(false);
        Account account = (session != null) ? (Account) session.getAttribute("account") : null;
        List<Genre> genreList = genreService.getAll();
        request.setAttribute("GenreList",genreList);
        // Không redirect nữa mà forward thẳng
        request.getRequestDispatcher("view/movie.jsp").forward(request, response);
    }
}
