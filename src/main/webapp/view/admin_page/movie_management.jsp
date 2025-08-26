<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>

<table id="movieManagementTable" class="table table-striped table-dark d-none">
    <thead>
    <tr>
        <th>No.</th>
        <th>Movie</th>
        <th>Author</th>
        <th>Main Actors</th>
        <th>Description</th>
        <th>Action</th>
    </tr>
    </thead>
    <tbody>
    <c:forEach var="movie" items="${movieList}" varStatus="loop">
        <tr>
            <td>${loop.count}</td>
            <td>${movie.name}</td>
            <td>${movie.author}</td>
            <td>${movie.mainActor}</td>
            <td>${movie.description}</td>
            <td>
                <div class="d-flex gap-3 align-items-start">
                    <form action="/Admin" method="get">
                        <input type="hidden" name="action" value="showEditMovieForm">
                        <input type="hidden" name="id" value="${movie.id}">
                        <button type="submit" class="btn btn-primary btn-sm">Edit</button>
                    </form>
                    <button onclick="deleteMovie(${movie.id})"
                            class="btn btn-danger btn-sm"
                            data-bs-toggle="modal"
                            data-bs-target="#deleteUserModal">
                        Delete
                    </button>
                </div>
            </td>
        </tr>
    </c:forEach>
    </tbody>
</table>
