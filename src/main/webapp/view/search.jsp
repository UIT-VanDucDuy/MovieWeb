<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html lang="vi">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>Trang Web Xem Phim</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <script src="https://kit.fontawesome.com/d3ee10eebc.js" crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
    <script src="jvs/home.js"></script>
    <link rel="stylesheet" href="../css/home.css">
    <link rel="stylesheet" href="../css/search.css">
    <link rel="stylesheet" href="../css/navbar.css">

</head>

<body>
<c:if test="${sessionScope.account == null}">
    <c:redirect url="/Home"></c:redirect>
</c:if>
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
</div>
<div class="content">
    <div class="row">
        <div class="col-lg-3">
            <ul class="list-group">
                <li class="list-group-item">An item</li>
                <li class="list-group-item">A second item</li>
                <li class="list-group-item">A third item</li>
                <li class="list-group-item">A fourth item</li>
                <li class="list-group-item">And a fifth one</li>
            </ul>
        </div>
        <div class="col-lg-9">
            <div class="search-list  d-flex">
                <c:forEach var="movie" items="${movieList}" varStatus="status">
                    <div class="card">
                        <a href="/Movie">
                            <img src="${movie.getPosterPath()}" class="card-img-top" alt="...">
                        </a>
                        <div class="card-body">
                            <h5 class="card-title">${movie.getName()}</h5>
                        </div>
                    </div>
                </c:forEach>

            </div>
            <div>
                <nav aria-label="Page navigation example">
                    <ul class="pagination justify-content-center">
                        <!-- Nút Prev -->
                        <li class="page-item ${currentPage == 1 ? 'disabled' : ''}">
                            <a class="page-link"  href="?name=${param.name}&page=${currentPage - 1}">Prev</a>
                        </li>

                        <!-- Danh sách số trang -->
                        <c:forEach begin="1" end="${totalPages}" var="i">
                            <li class="page-item ${i == currentPage ? 'active' : ''}">
                                <a class="page-link" href="?name=${param.name}&page=${i}">${i}</a>
                            </li>
                        </c:forEach>

                        <!-- Nút Next -->
                        <li class="page-item ${currentPage == totalPages ? 'disabled' : ''}">
                            <a class="page-link"
                               href="?name=${param.name}&page=${currentPage + 1}">Next</a>
                        </li>
                    </ul>
                </nav>
            </div>
        </div>
    </div>
</div>

<c:import url="/layout/footer.jsp"></c:import>
</body>
</html>


