<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>


<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Title</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
    <script src="https://kit.fontawesome.com/d3ee10eebc.js" crossorigin="anonymous"></script>
    <link rel="stylesheet" href="/css/home4.css">
    <link rel="stylesheet" href="../css/navbar.css">
    <link rel="stylesheet" href="../css/movie3.css">


</head>
<body>
<c:if test="${sessionScope.account == null}">
    <c:redirect url="/Home"></c:redirect>
</c:if>
<c:import url="/layout/navbar.jsp"></c:import>

<div class="container mt-4 main d-flex justify-content-center">
    <c:choose>
        <c:when test="${not empty movie.moviePath}">
            <video class="video" controls>
                <source src="${movie.getMoviePath()}" type="video/mp4">
                Trình duyệt của bạn không hỗ trợ thẻ video.
            </video>
        </c:when>
        <c:otherwise>
            <iframe src="${movie.trailerPath}" title="YouTube video player" id="trailerFrame" class="video"
                    allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture; web-share"
                    referrerpolicy="strict-origin-when-cross-origin" allowfullscreen>
            </iframe>
        </c:otherwise>
    </c:choose>
</div>
<div class="container py-4 text-white">
    <!-- Thông tin phim -->
    <div class="row">
        <div class="col-lg-7">
            <h2 class="fw-bold">${movie.getName()}</h2>
            <div class="d-flex align-items-center gap-3">
                <span class="badge bg-warning text-dark"><i class="bi bi-star-fill"></i>4.2</span>
                <span>
                    <fmt:parseDate value="${movie.releaseDate}" pattern="yyyy-MM-dd" var="parsedDate" />
                    <fmt:formatDate value="${parsedDate}" pattern="dd/MM/yyyy" />
                </span>
                <span>
                    <fmt:formatNumber value="${movie.getDuration()}" type="number" maxFractionDigits="0"/>m
                </span>
            </div>
            <br>
            <p class="desc">${movie.getDescription()}
            </p>
            <div>
                <h4 class="mt-5">Trailer</h4>
                <div class="row g-3">
                    <!-- Tập 1 -->
                    <div class="col-12 col-sm-6 col-lg-4">
                        <div class="bg-dark rounded p-2 position-relative">
                            <a class="" data-trailer="${movie.getTrailerPath()}"
                               data-bs-toggle="modal" data-bs-target="#trailerModal">
                                <img src="${movie.bannerPath}" class="img-same-movie rounded img-fluid" />
                            </a>
                            <h6 class="mt-2">Trailer</h6>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <div class="col-lg-1"></div>
        <div class="col-lg-4">
            <ul class="list-unstyled small">
                <li><strong>Diễn viên:</strong> ${movie.getMainActor()}</li>
                <li><strong>Đạo diễn:</strong> ${movie.getAuthor()}</li>
                <li>
                    <strong>Thể loại:</strong>
                    <c:forEach var="genre" items="${movie.getGenres()}">
                        ${genre.getGenreName()},
                    </c:forEach>
                </li>
            </ul>
        </div>
        <div>
            <div class="same-movie">
                <h4 class="text-white mb-3">Nội dung liên quan</h4>
                <div class="d-flex overflow-auto gap-3 mb-5">
                    <c:forEach var="sameMovie" items="${sameMoviesList}">
                        <div class="col-12 col-sm-6 col-lg-3">
                            <div class="bg-dark rounded p-2">
                                <div class="position-relative justify-content-center d-flex">
                                    <c:url var="movieUrl" value="/Movie">
                                        <c:param name="movieTypeId" value="${sameMovie.memberTypeId}" />
                                        <c:param name="movieId" value="${sameMovie.id}" />
                                    </c:url>
                                    <a href="${movieUrl}">
                                        <img src="${sameMovie.bannerPath}" class="img-same-movie rounded img-fluid" />
                                    </a>
                                    <span class="position-absolute top-0 start-0 badge bg-danger m-2">
                                            ${sameMovie.memberType}
                                    </span>
                                </div>
                                <div class="row">
                                    <h6 class="mt-2 col-md-10">${sameMovie.name}</h6>
                                    <button title="Watch Trailer" class="round-button col-md-2"
                                            data-trailer="${sameMovie.getTrailerPath()}"
                                            data-bs-toggle="modal" data-bs-target="#trailerModal">
                                        <i class="fa-solid fa-play"></i>
                                    </button>
                                </div>
                            </div>
                        </div>
                    </c:forEach>
                </div>
            </div>
<%--            <div class="actor">--%>
<%--                <h4 class="text-white mb-3">Diễn viên</h4>--%>
<%--                <div class="d-flex gap-4 mb-5">--%>
<%--                    <div class="text-center">--%>
<%--                        <img src="https://image.tmdb.org/t/p/original/h9q0ozwMWy7CK5U7FSZsMVtbsCQ.jpg" class="rounded-circle border border-2" width="100" height="100" />--%>
<%--                        <p class="mt-2 text-white">Dương Dương</p>--%>
<%--                    </div>--%>
<%--                    <div class="text-center">--%>
<%--                        <img src="https://image.tmdb.org/t/p/original/h9q0ozwMWy7CK5U7FSZsMVtbsCQ.jpg" class="rounded-circle border border-2" width="100" height="100" />--%>
<%--                        <p class="mt-2 text-white">Kim Thần</p>--%>
<%--                    </div>--%>
<%--                    <div class="text-center">--%>
<%--                        <img src="https://image.tmdb.org/t/p/original/h9q0ozwMWy7CK5U7FSZsMVtbsCQ.jpg" class="rounded-circle border border-2" width="100" height="100" />--%>
<%--                        <p class="mt-2 text-white">Uông Đặc</p>--%>
<%--                    </div>--%>
<%--                </div>--%>
<%--            </div>--%>
            <div class="comment">
                <div class="text-white my-4">
                    <h4 class="mb-3">Bình luận (25)</h4>
                    <p class="text-light">
                        Vui lòng <a href="" data-bs-toggle="modal" data-bs-target="#ratingModal" class="text-warning fw-bold">Đánh giá</a> bộ phim và để lại Bình luận
                    </p>
                    <div class=" d-flex gap-5">
                        <div class="d-flex align-items-center">
                            <i class="avtar fa-solid fa-user"></i>
                        </div>
                        <div class="bg-dark rounded p-3 mb-3">
                            <div class=" d-flex align-items-center mb-2 gap-3">
                                <strong>Phim xem người</strong>
                                <span class="time-comment">· 5 tiếng</span>
                                <div>
                                    <i class="fa-solid fa-star"></i><i class="fa-solid fa-star"></i>
                                </div>
                            </div>
                            <div class="small text-light">Diễn viên k đẹp bằng web</div>
                        </div>
                    </div>

                    <!-- BÌNH LUẬN 3 -->
                    <div class=" d-flex gap-5">
                        <div class="d-flex align-items-center">
                            <i class="avtar fa-solid fa-user"></i>
                        </div>
                        <div class="bg-dark rounded p-3 mb-3">
                            <div class=" d-flex align-items-center mb-2 gap-3">
                                <strong>Người xem phim</strong>
                                <span class="time-comment"> 7 tiếng</span>
                                <div>
                                    <i class="fa-solid fa-star"></i>
                                    <i class="fa-solid fa-star"></i>
                                    <i class="fa-solid fa-star"></i>
                                </div>
                            </div>
                            <div class="small text-light">Web đẹp quá</div>
                        </div>
                    </div>
                    <div class=" d-flex gap-5">
                        <div class="d-flex align-items-center">
                            <i class=" avtar fa-solid fa-user"></i>
                        </div>

                        <div class="bg-dark rounded p-3 mb-3">
                            <div class=" d-flex align-items-center mb-2 gap-3">
                                <strong>Người xem người</strong>
                                <span class="time-comment">9 tiếng</span>
                                <div>
                                    <i class="fa-solid fa-star"></i>
                                    <i class="fa-solid fa-star"></i>
                                    <i class="fa-solid fa-star"></i>
                                </div>
                            </div>
                            <div class="small text-light">Phim tuyệt vời</div>
                        </div>
                    </div>
                    <div class=" d-flex gap-5">
                        <div class="d-flex align-items-center">
                            <i class=" avtar fa-solid fa-user"></i>
                        </div>

                        <div class="bg-dark rounded p-3 mb-3">
                            <div class=" d-flex align-items-center mb-2 gap-3">
                                <strong>Phim xem phim</strong>
                                <span class="time-comment">9 tiếng</span>
                                <div>
                                    <i class="fa-solid fa-star"></i>
                                    <i class="fa-solid fa-star"></i>
                                    <i class="fa-solid fa-star"></i>
                                </div>
                            </div>
                            <div class="small text-light">hay quá đi !!</div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>

<!-- Modal Rating -->
<div class="modal fade" id="ratingModal" tabindex="-1" aria-labelledby="ratingModalLabel" aria-hidden="true">
    <div class=" modal-rating modal-dialog modal-dialog-centered modal-md">
        <div class="modal-content bg-dark text-white">
            <div class="modal-body">
                <div class="d-flex ">
                    <h4>Rate your experience</h4>
                </div>
                <p>We highly value your feedback! Kindly take a moment to rate your experience and provide us with your valuable feedback.</p>

                <form class="rating d-flex justify-content-center align-items-center">
                    <div class="rating-star">
                        <input type="radio" id="star5" name="rate" value="5" />
                        <label for="star5" title="text"></label>
                        <input type="radio" id="star4" name="rate" value="4" />
                        <label for="star4" title="text"></label>
                        <input type="radio" id="star3" name="rate" value="3" />
                        <label for="star3" title="text"></label>
                        <input type="radio" id="star2" name="rate" value="2" />
                        <label for="star2" title="text"></label>
                        <input checked="" type="radio" id="star1" name="rate" value="1" />
                        <label for="star1" title="text"></label>
                    </div>
                    <div class="rating-comment">
                        <textarea class="feedback-area" rows="6" placeholder="Tell us about your experience!"></textarea>
                        <input class="submit" type="submit" value="Send Now!" />
                    </div>
                </form>
            </div>
        </div>
    </div>
</div>


<c:import url="/layout/footer.jsp"></c:import>

</body>

</html>