<%--<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>--%>
<%--<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>--%>

<%--<table id="movieManagementTable" class="table table-striped table-dark d-none">--%>
<%--    <thead>--%>
<%--    <tr>--%>
<%--        <th>No.</th>--%>
<%--        <th>Movie</th>--%>
<%--        <th>Author</th>--%>
<%--        <th>Main Actors</th>--%>
<%--        <th>Description</th>--%>
<%--        <th>Action</th>--%>
<%--    </tr>--%>
<%--    </thead>--%>
<%--    <tbody>--%>
<%--    <c:forEach var="movie" items="${movieList}" varStatus="loop">--%>
<%--        <tr>--%>
<%--            <td>${loop.count}</td>--%>
<%--            <td>${movie.name}</td>--%>
<%--            <td>${movie.author}</td>--%>
<%--            <td>${movie.mainActor}</td>--%>
<%--            <td>${movie.description}</td>--%>
<%--            <td>--%>
<%--                <div class="d-flex gap-3 align-items-start">--%>
<%--                    <form action="/Admin" method="get">--%>
<%--                        <input type="hidden" name="action" value="showEditMovieForm">--%>
<%--                        <input type="hidden" name="id" value="${movie.id}">--%>
<%--                        <button type="submit" class="btn btn-primary btn-sm">Edit</button>--%>
<%--                    </form>--%>
<%--                    <button onclick="deleteMovie(${movie.id})"--%>
<%--                            class="btn btn-danger btn-sm"--%>
<%--                            data-bs-toggle="modal"--%>
<%--                            data-bs-target="#deleteUserModal">--%>
<%--                        Delete--%>
<%--                    </button>--%>
<%--                </div>--%>
<%--            </td>--%>
<%--        </tr>--%>
<%--    </c:forEach>--%>
<%--    </tbody>--%>
<%--</table>--%>


<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>

<c:set var="cpath" value="${pageContext.request.contextPath}" />
<c:set var="uri" value="${pageContext.request.requestURI}" />

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>User Management</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
    <link rel="stylesheet" href="${cpath}/css/home.css">
    <link rel="stylesheet" href="${cpath}/css/admin.css">
    <link rel="stylesheet" href="${cpath}/css/navbar.css">
    <script src="${cpath}/jvs/admin.js"></script>
</head>
<body>
<c:import url="/layout/navbar.jsp"></c:import>

<div class="main mt-4">
    <div class="mb-3 mt-2">
        <h1 class="title">User Management</h1>
    </div>

    <div class="row">
        <c:import url="admin.jsp"></c:import>

        <div class="col-lg-10">
            <div class="mb-3 text-end">
                <form action="/admin/movies" method="get">
                    <input type="hidden" name="action" value="showAddForm">
                    <button type="submit" class="btn btn-primary btn-md" >
                        + Create Movie
                    </button>
                </form>
            </div>

            <table id="movieManagementTable" class="table table-striped table-dark">
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
        </div>
    </div>
</div>

</body>
</html>