<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>

<c:set var="cpath" value="${pageContext.request.contextPath}"/>
<c:set var="uri" value="${pageContext.request.requestURI}"/>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>User Management</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
    <link rel="stylesheet" href="${cpath}/css/home1.css">
    <link rel="stylesheet" href="${cpath}/css/admin.css">
    <link rel="stylesheet" href="${cpath}/css/navbar1.css">
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
                    <button type="submit" class="btn btn-primary btn-md">
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
                        <td class="description-col">${movie.description}</td>
                        <td>
                            <div class="d-flex gap-3 align-items-start">
                                <form action="/admin/movies" method="get">
                                    <input type="hidden" name="action" value="editMovieForm">
                                    <input type="hidden" name="id" value="${movie.id}">
                                    <button type="submit" class="btn btn-primary btn-sm">Edit</button>
                                </form>
                                <button type="button" onclick="deleteMovie(${movie.id})"
                                        class="btn btn-danger btn-sm">
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


<!-- addMovieModal -->
<div class="modal fade" id="addMovieModal" tabindex="-1" aria-labelledby="addMovieModalLabel"
     aria-hidden="true">
    <div class="modal-dialog modal-lg">
        <div class="modal-content">
            <div class="modal-header">
                <h1 class="modal-title fs-5" id="addMovieModalLabel">Add Movie</h1>
                <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
            </div>

            <form action="${pageContext.request.contextPath}/admin/movies?action=addMovie" method="post">
                <div class="modal-body">
                    <div class="row">
                        <div class="col gx-3">

                            <div class="mb-3">
                                <label class="me-3 mb-1">Movie Path: </label>
                                <input type="text" class="form-control" placeholder="Enter Movie Path"
                                       aria-label="Post Path" name="moviePath">
                            </div>
                            <div class="mb-3">
                                <label class="me-3 mb-1">Trailer Path: </label>
                                <input type="text" class="form-control" placeholder="Enter Trailer Path"
                                       aria-label="Post Path" name="trailerPath">
                            </div>
                            <div class="mb-3">
                                <label class="me-3 mb-1">Poster Path: </label>
                                <input type="text" class="form-control" placeholder="Enter Poster Path"
                                       aria-label="Poster Path" name="posterPath">
                            </div>
                            <div class="mb-3">
                                <label class="me-3 mb-1">Banner Path: </label>
                                <input type="text" class="form-control" placeholder="Enter Banner Path"
                                       aria-label="Post Path" name="bannerPath">
                            </div>
                            <div class="mb-3">
                                <label class="me-3 mb-1">Series: </label>
                                <select name="isSeries" class="form-select">
                                    <%--                                    <option value="true">Yes</option>--%>
                                    <option value="false" selected>No</option>
                                </select>
                            </div>
                            <div class="mb-3">
                                <label class="me-3 mb-1">Release Date: </label>
                                <input type="date" class="form-control" placeholder="Select Release Date"
                                       aria-label="Release Date" name="releaseDate">
                            </div>
                        </div>
                        <div class="col">
                            <div class="mb-3">
                                <label class="me-3 mb-1">Movie Name: </label>
                                <input type="text" class="form-control" placeholder="Enter Movie Name"
                                       aria-label="Movie name" name="name">
                            </div>
                            <div class="mb-3">
                                <label class="me-3 mb-1">Main Actor: </label>
                                <input type="text" class="form-control" placeholder="Enter Main Actor"
                                       aria-label="Main Actor" name="mainActor">
                            </div>
                            <div class="mb-3">
                                <label class="me-3 mb-1">Author: </label>
                                <input type="text" class="form-control" placeholder="Enter Author"
                                       aria-label="Author" name="author">
                            </div>
                            <div class="mb-3">
                                <label class="me-3 mb-1">Member Type: </label>
                                <select name="memberTypeId" id="memberTypeId" class="form-select">
                                    <c:forEach var="memberType" items="${memberTypeList}">
                                        <option value="${memberType.id}">${memberType.name}</option>
                                    </c:forEach>
                                </select>
                            </div>
                            <div class="mb-3">
                                <label class="me-3 mb-1">Duration: </label>
                                <input type="number" class="form-control" placeholder="Enter Duration" name="duration">
                            </div>
                            <div class="mb-3">
                                <label class="me-3 mb-1">Description: </label>
                                <input type="text" class="form-control" placeholder="Enter Description"
                                       name="description">
                            </div>
                        </div>
                    </div>
                </div>

                <div class="modal-footer">
                    <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Close</button>
                    <button type="submit" class="btn btn-primary">Save</button>
                </div>
            </form>

        </div>
    </div>
</div>

<!-- editMovieModal -->
<div class="modal fade" id="editMovieModal" tabindex="-1" aria-labelledby="editMovieModalLabel"
     aria-hidden="true">
    <div class="modal-dialog modal-lg">
        <div class="modal-content">
            <div class="modal-header">
                <h1 class="modal-title fs-5" id="editMovieModalLabel">Edit Movie</h1>
                <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
            </div>

            <form action="${pageContext.request.contextPath}/admin/movies?action=editMovie" method="post">
                <div class="modal-body">
                    <div class="row">
                        <div class="col gx-3">

                            <div class="mb-3">
                                <label class="me-3 mb-1">Movie Path: </label>
                                <input type="text" class="form-control" placeholder="Enter Movie Path"
                                       aria-label="Post Path" name="moviePath" id="editMoviePath">
                            </div>
                            <div class="mb-3">
                                <label class="me-3 mb-1">Trailer Path: </label>
                                <input type="text" class="form-control" placeholder="Enter Trailer Path"
                                       aria-label="Post Path" name="trailerPath" id="editTrailerPath">
                            </div>
                            <div class="mb-3">
                                <label class="me-3 mb-1">Poster Path: </label>
                                <input type="text" class="form-control" placeholder="Enter Poster Path"
                                       aria-label="Poster Path" name="posterPath" id="editPosterPath">
                            </div>
                            <div class="mb-3">
                                <label class="me-3 mb-1">Banner Path: </label>
                                <input type="text" class="form-control" placeholder="Enter Banner Path"
                                       aria-label="Post Path" name="bannerPath" id="editBannerPath">
                            </div>
                            <div class="mb-3">
                                <label class="me-3 mb-1">Series: </label>
                                <select name="isSeries" class="form-select" id="isSeries">
                                    <%--                                    <option value="true">Yes</option>--%>
                                    <option value="false" selected>No</option>
                                </select>
                            </div>
                            <div class="mb-3">
                                <label class="me-3 mb-1">Release Date: </label>
                                <input type="date" class="form-control" placeholder="Select Release Date"
                                       aria-label="Release Date" name="releaseDate" id="editReleaseDate">
                            </div>
                        </div>
                        <div class="col">
                            <div class="mb-3">
                                <label class="me-3 mb-1">Movie Name: </label>
                                <input type="text" class="form-control" placeholder="Enter Movie Name"
                                       aria-label="Movie name" name="name" id="editMovieName">
                            </div>
                            <div class="mb-3">
                                <label class="me-3 mb-1">Main Actor: </label>
                                <input type="text" class="form-control" placeholder="Enter Main Actor"
                                       aria-label="Main Actor" name="mainActor" id="editMainActor">
                            </div>
                            <div class="mb-3">
                                <label class="me-3 mb-1">Author: </label>
                                <input type="text" class="form-control" placeholder="Enter Author"
                                       aria-label="Author" name="author" id="editMovieAuthor">
                            </div>
                            <div class="mb-3">
                                <label class="me-3 mb-1">Member Type: </label>
                                <select name="memberTypeId" id="editMemberTypeId" class="form-select">
                                    <c:forEach var="memberType" items="${memberTypeList}">
                                        <option value="${memberType.id}">${memberType.name}</option>
                                    </c:forEach>
                                </select>
                            </div>
                            <div class="mb-3">
                                <label class="me-3 mb-1">Duration: </label>
                                <input type="number" class="form-control" placeholder="Enter Duration" name="duration"
                                       id="editDuration">
                            </div>
                            <div class="mb-3">
                                <label class="me-3 mb-1">Description: </label>
                                <input type="text" class="form-control" placeholder="Enter Description"
                                       name="description" id="editDescription">
                            </div>
                        </div>
                    </div>
                </div>

                <div class="modal-footer">
                    <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Close</button>
                    <button type="submit" class="btn btn-primary">Save</button>
                </div>
            </form>

        </div>
    </div>
</div>

<!-- deleteMovieModal -->
<div class="modal fade" id="deleteMovieModal" tabindex="-1" aria-labelledby="deleteMovieModalLabel"
     aria-hidden="true">
    <div class="modal-dialog modal-lg">
        <div class="modal-content">
            <div class="modal-header">
                <h1 class="modal-title fs-5" id="deleteMovieModalLabel">Delete Movie</h1>
                <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
            </div>

            <form action="${pageContext.request.contextPath}/admin/movies?action=deleteMovie" method="post">
                <div class="modal-body">
                    <div class="row">
                        <input type="hidden" name="deleteMovieId" id="deleteMovieId">
                        <p>Are you sure that you want to delete that movie?</p>
                    </div>
                </div>

                <div class="modal-footer">
                    <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Close</button>
                    <button type="submit" class="btn btn-primary">Confirm</button>
                </div>
            </form>

        </div>
    </div>
</div>

<c:if test="${not empty openAddMovieModal}">
    <script>
        var myModal = new bootstrap.Modal(document.getElementById('addMovieModal'));
        myModal.show();
    </script>
</c:if>

<c:if test="${not empty openEditMovieModal}">
    <script>
        document.getElementById("editMoviePath").value = "${movie.moviePath}";
        document.getElementById("editTrailerPath").value = "${movie.trailerPath}";
        document.getElementById("editPosterPath").value = "${movie.posterPath}";
        document.getElementById("editBannerPath").value = "${movie.bannerPath}";
        document.getElementById("isSeries").value = "${movie.isSeries}";
        document.getElementById("editReleaseDate").value = "${movie.releaseDate}";
        document.getElementById("editMovieName").value = "${movie.name}";
        document.getElementById("editMovieAuthor").value = "${movie.author}";
        document.getElementById("editMemberTypeId").value = "${movie.memberTypeId}";
        document.getElementById("editDuration").value = "${movie.duration}";
        document.getElementById("editDescription").value = "${movie.description}";

        var myModal = new bootstrap.Modal(document.getElementById('editMovieModal'));
        myModal.show();
    </script>
</c:if>

<c:if test="${not empty toastMessage}">
    <div class="toast-container position-fixed top-0 end-0 p-3">
        <div id="liveToast" class="toast align-items-center text-bg-${toastType} border-0 show" role="alert">
            <div class="d-flex">
                <div class="toast-body">
                        ${toastMessage}
                </div>
                <button type="button" class="btn-close btn-close-white me-2 m-auto" data-bs-dismiss="toast"></button>
            </div>
        </div>
    </div>

    <script>
        document.addEventListener('DOMContentLoaded', function () {
            var toastEl = document.getElementById('liveToast');
            var toast = new bootstrap.Toast(toastEl, {delay: 3000});
            toast.show();
        });
    </script>
</c:if>
</body>
<script src="${cpath}/jvs/admin.js"></script>
</html>