<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html lang="vi">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>Trang Web Xem Phim</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <script src="https://kit.fontawesome.com/d3ee10eebc.js" crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
<%--    <link rel="stylesheet" href="/css/home.css">--%>
    <link rel="stylesheet" href="/css/memtype.css">
    <link rel="stylesheet" href="/css/navbar.css">
    <script src="jvs/home.js"></script>

</head>
<body>
<c:import url="/layout/navbar.jsp"></c:import>
<!-- Nội dung trang -->
<div class="container mt-4 main">
    <div id="movieCarousel" class="carousel slide" data-bs-ride="carousel">
        <div class="carousel-inner">
            <div class="carousel-item active">
                <a href="/Movie">
                    <img src="https://image.tmdb.org/t/p/original/h9q0ozwMWy7CK5U7FSZsMVtbsCQ.jpg" class="d-block w-100 carousel-img" alt="Phim 1">
                </a>

                <div class="carousel-caption custom-caption">
                    <div class="justify-content-center d-flex  ">
                        <img src="https://cdn.marvel.com/content/1x/avengersendgame_lob_log_01_1.png" class="title-movie">
                    </div>
                    <br>
                    <div class="justify-content-center d-flex gap-2 movie-info">
                        <p>2000</p>
                        <p>&bull;</p>
                        <p>T16</p>
                        <p>&bull;</p>
                        <p>1 giờ 50 phút</p>
                        <p>&bull;</p>
                        <p>American</p>
                    </div>
                    <div class="d-flex justify-content-center gap-3">
                        <button class="button-watch-now">
                            Watch Now
                            <div class="arrow-wrapper">
                                <div class="arrow"></div>
                            </div>
                        </button>

                        <button class="button-bookmark">
                            <i class="fa-regular fa-bookmark"></i>
                        </button>
                    </div>
                </div>

            </div>
            <div class="carousel-item">
                <a href="/Movie">
                    <img src="https://image.tmdb.org/t/p/original/b3JtLWrdiJFCN8r9zuftgty8ddD.jpg" class="d-block w-100 carousel-img" alt="Phim 1">
                </a>

                <div class="carousel-caption custom-caption">
                    <div class="justify-content-center d-flex  ">
                        <img src="https://image.tmdb.org/t/p/original/bxp4NhUZ1GxjdrGF8szOlsL4g0d.png" class="title-movie">
                    </div>
                    <br>
                    <div class="justify-content-center d-flex gap-2 movie-info">
                        <p>2000</p>
                        <p>&bull;</p>
                        <p>T16</p>
                        <p>&bull;</p>
                        <p>1 giờ 50 phút</p>
                        <p>&bull;</p>
                        <p>American</p>
                    </div>
                    <div class="d-flex justify-content-center gap-3  ">
                        <button class="button-watch-now">
                            Watch Now
                            <div class="arrow-wrapper">
                                <div class="arrow"></div>
                            </div>
                        </button>

                        <button class="button-bookmark">
                            <i class="fa-regular fa-bookmark"></i>
                        </button>
                    </div>
                </div>
            </div>
            <div class="carousel-item">
                <a href="/Movie">
                    <img src="https://image.tmdb.org/t/p/original/cgEhsQWCq16yxeoHP15Ay9VdU0s.jpg" class="d-block w-100 carousel-img" alt="Phim 1">
                </a>

                <div class="carousel-caption custom-caption">
                    <div class="justify-content-center d-flex ">
                        <img src="file/image/spider-man_no_way_home_lob_log_def_08.png" class="title-movie">
                    </div>
                    <br>
                    <div class="justify-content-center d-flex gap-2 movie-info">
                        <p>2000</p>
                        <p>&bull;</p>
                        <p>T16</p>
                        <p>&bull;</p>
                        <p>1 giờ 50 phút</p>
                        <p>&bull;</p>
                        <p>American</p>
                    </div>
                    <div class="d-flex justify-content-center gap-3  ">
                        <button class="button-watch-now">
                            Watch Now
                            <div class="arrow-wrapper">
                                <div class="arrow"></div>
                            </div>
                        </button>

                        <button class="button-bookmark">
                            <i class="fa-regular fa-bookmark"></i>
                        </button>
                    </div>
                </div>
            </div>
            <div class="carousel-item ">
                <a href="/Movie">
                    <img src="https://image.tmdb.org/t/p/original/yOCRqvrRrxbs5FYq2pX1KtLJwmR.jpg" class="d-block w-100 carousel-img" alt="Phim 1">
                </a>

                <div class="carousel-caption custom-caption">
                    <div class="justify-content-center d-flex ">
                        <img src="https://image.tmdb.org/t/p/original/8TsSMAK89DiOOg3vP9baQEt1DNi.png" class="title-movie">
                    </div>
                    <br>
                    <div class="justify-content-center d-flex gap-2 movie-info ">
                        <p>2000</p>
                        <p>&bull;</p>
                        <p>T16</p>
                        <p>&bull;</p>
                        <p>1 giờ 50 phút</p>
                        <p>&bull;</p>
                        <p>American</p>
                    </div>
                    <div class="d-flex justify-content-center gap-3  ">
                        <button class="button-watch-now">
                            Watch Now
                            <div class="arrow-wrapper">
                                <div class="arrow"></div>
                            </div>
                        </button>

                        <button class="button-bookmark">
                            <i class="fa-regular fa-bookmark"></i>
                        </button>
                    </div>
                </div>

            </div>
        </div>

        <button class="carousel-control-prev" type="button" data-bs-target="#movieCarousel" data-bs-slide="prev">
            <span class="carousel-control-prev-icon"></span>
        </button>
        <button class="carousel-control-next" type="button" data-bs-target="#movieCarousel" data-bs-slide="next">
            <span class="carousel-control-next-icon"></span>
        </button>

    </div>
    <div class="container-fluid bg-black text-white py-4">
        <h2 class="mb-4 fw-bold ps-5">Trending now</h2>

        <div class="slider-container position-relative" style="overflow-x: auto;">
            <div id="trending-now" class="slider-track d-flex transition gap-5">
                <c:forEach var="trendingMovie" items="${trendingMovieList}" varStatus="status">
                    <div class="slider-item position-relative">
                        <span class="number-overlay">${status.count}</span>
                        <a href="/Movie"><img src="${trendingMovie.getPosterPath()}" class="rounded" /> </a>
                    </div>
                </c:forEach>

            </div>
            <!-- Nút điều hướng -->
            <button class="carousel-control-prev scroll-prev" type="button" data-target="trending-now">
                <span class="carousel-control-prev-icon"></span>
            </button>
            <button class="carousel-control-next scroll-next" type="button" data-target="trending-now">
                <span class="carousel-control-next-icon"></span>
            </button>
        </div>


    </div>
    <br>
    <div class="container-fluid bg-black text-white py-4">
        <h2 class="mb-4 fw-bold ps-5">Genre</h2>

        <div class="slider-container position-relative" style="overflow-x: auto;">
            <div id="genre" class="slider-track d-flex transition">
                <c:forEach var="genre" items="${GenreList}" varStatus="status">
                    <c:url var="searchUrl" value="/Search">
                        <c:param name="Genre" value="${genre.genreName}" />
                    </c:url>
                    <div class="genre-div slider-item position-relative" >
                        <a href="${searchUrl}">
                            <img src="https://image.tmdb.org/t/p/original/9Ufx3qJHKEl83bVrHRjpuhocO3J.jpg" class="genre-img" />
                        </a>
                        <span class="genre-name">${genre.genreName}</span>
                    </div>
                </c:forEach>

            </div>
            <!-- Nút điều hướng -->
            <button class="carousel-control-prev scroll-prev" type="button" data-target="genre">
                <span class="carousel-control-prev-icon"></span>
            </button>
            <button class="carousel-control-next scroll-next" type="button" data-target="genre">
                <span class="carousel-control-next-icon"></span>
            </button>
        </div>
    </div>
    <br>
    <div class="container-fluid bg-black text-white py-4">
        <h2 class="mb-4 fw-bold ps-5">Romance Movie</h2>

        <div class="slider-container position-relative" style="overflow-x: auto;">
            <div id="romance-movie" class="slider-track d-flex transition gap-3">
                <c:forEach var="romanceMovie" items="${RomanceMovieList}" varStatus="status">
                    <div class="slider-item position-relative">
                        <span class="movie-type">${romanceMovie.getMemberType()}</span>
                        <a href="/Movie">
                            <img src="${romanceMovie.getPosterPath()}" class="rounded" />
                        </a>
                    </div>
                </c:forEach>
            </div>
            <!-- Nút điều hướng -->
            <button class="carousel-control-prev scroll-prev" type="button"  data-target="romance-movie">
                <span class="carousel-control-prev-icon"></span>
            </button>
            <button class="carousel-control-next scroll-next" type="button" data-target="romance-movie">
                <span class="carousel-control-next-icon"></span>
            </button>
        </div>


    </div>
    <br>
    <div class="container-fluid bg-black text-white py-4">
        <h2 class="mb-4 fw-bold ps-5">Action Movie</h2>

        <div class="slider-container position-relative" style="overflow-x: auto;">
            <div id="action-movie" class=" slider-track d-flex transition gap-3">
                <c:forEach var="actionMovie" items="${ActionMovieList}" varStatus="status">
                    <div class="slider-item position-relative">
                        <span class="movie-type">${actionMovie.getMemberType()}</span>
                        <div onclick="checkMemberType(${sessionScope.account.memberTypeId},${actionMovie.getMemberTypeId()})">
                            <img src="${actionMovie.getPosterPath()}" class="rounded" />
                        </div>
                    </div>
                </c:forEach>
            </div>
            <!-- Nút điều hướng -->
            <button class="carousel-control-prev scroll-prev" type="button" data-target="action-movie">
                <span class="carousel-control-prev-icon"></span>
            </button>
            <button class="carousel-control-next scroll-next" type="button" data-target="action-movie">
                <span class="carousel-control-next-icon"></span>
            </button>
        </div>


    </div>
    <br>
    <div class="container-fluid bg-black text-white py-4">
        <h2 class="mb-4 fw-bold ps-5">Coming Soon !</h2>

        <div class="slider-container position-relative" style="overflow-x: auto;">
            <div id="comingsoon-movie" class=" slider-track d-flex transition gap-3">
                <c:forEach var="actionMovie" items="${ActionMovieList}" varStatus="status">
                    <div class="slider-item position-relative">
                        <span class="movie-type">${actionMovie.getMemberType()}</span>
                        <a href="/Movie">
                            <img src="${actionMovie.getPosterPath()}" class="rounded" />
                        </a>
                    </div>
                </c:forEach>
            </div>
            <!-- Nút điều hướng -->
            <button class="carousel-control-prev scroll-prev" type="button" data-target="action-movie">
                <span class="carousel-control-prev-icon"></span>
            </button>
            <button class="carousel-control-next scroll-next" type="button" data-target="action-movie">
                <span class="carousel-control-next-icon"></span>
            </button>
        </div>


    </div>
    <br>
</div>

<c:import url="/layout/footer.jsp"></c:import>

</body>
</html>

<script>
    function checkMemberType(memberTypeId, movieTypeId) {
        // Nếu memberTypeId = 0 thì cho xem phim luôn
        if (memberTypeId === null || memberTypeId === undefined) {
            alert("Vui lòng đăng nhập để xem phim!");
            return;

        }

        if (memberTypeId === 0) {
            window.location.href = "/Movie";
            return;
        }

        // Nếu memberTypeId trùng movieTypeId thì cho xem phim
        if (memberTypeId === movieTypeId) {
            window.location.href = "/Movie";
        } else {
            alert("Vui lòng đăng nhập để xem phim!");
            return;

        }
    }
</script>
