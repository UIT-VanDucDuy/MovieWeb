<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Title</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
    <script src="https://kit.fontawesome.com/d3ee10eebc.js" crossorigin="anonymous"></script>
    <link rel="stylesheet" href="../css/home.css">
    <link rel="stylesheet" href="../css/movie.css">
</head>
<body>
<nav class="navbar navbar-expand-lg navbar-dark bg-black fixed-top">
    <div class="container-fluid">
        <!-- Logo -->
        <a class="navbar-brand" href="#">
            <img src="file/image/Covencinema.png" alt="Spooky Movie" class="logo">
        </a>

        <!-- Toggle button cho mobile -->
        <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#mainNav">
            <span class="navbar-toggler-icon"></span>
        </button>
        <!-- Menu -->
        <div class="collapse navbar-collapse" id="mainNav">
            <ul class="navbar-nav me-auto mb-2 mb-lg-0">
                <li class="nav-item">
                    <a class="nav-link active" href="/Home">Home</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link" href="/Search">TV Seris</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link" href="/Search">Anime</a>
                </li>
                <li class="nav-item dropdown">
                    <a class="nav-link"  role="button" data-bs-toggle="dropdown" aria-expanded="false">
                        Genre
                    </a>
                    <div class="dropdown-menu row ">
                        <a class="dropdown-item nav-link" href="/Search">Link 1</a>
                        <a class="dropdown-item nav-link" href="/Search">Link 2</a>
                        <a class="dropdown-item nav-link" href="/Search">Link 3</a>
                        <a class="dropdown-item nav-link" href="/Search">Link 4</a>
                        <a class="dropdown-item nav-link" href="/Search">Link 5</a>
                        <a class="dropdown-item nav-link" href="/Search">Link 6</a>
                        <a class="dropdown-item nav-link" href="/Search">Link 7</a>
                    </div>
                </li>
                <li class="nav-item search-container">
                    <a class="nav-link search-button" href="#">Search</a>
                    <form action="/Search" method="GET" class="search-form">
                        <input type="text" name="q" class="search-input" placeholder="Search..." />
                    </form>
                </li>
            </ul>
        </div>
    </div>
</nav>

<div class="container mt-4 main">
    <video class="video" controls>
        <source src="https://firebasestorage.googleapis.com/v0/b/nt208-28e2a.appspot.com/o/28%20N%C4%83m%20Sau-%20H%E1%BA%ADu%20T%E1%BA%ADn%20Th%E1%BA%BF%20HD%20Vietsub%20-%20T%E1%BA%ADp%20full%20-%20PhimMoiChill.mp4?alt=media&token=90acbf0f-2cbd-4c2d-bd72-3e7fb002722d" type="video/mp4">
        Trình duyệt của bạn không hỗ trợ thẻ video.
    </video></div>
<div class="container py-4 text-white">
    <!-- Thông tin phim -->
    <div class="row">
        <div class="col-lg-7">
            <h2 class="fw-bold">Phàm Nhân Tu Tiên Truyện</h2>
            <p class="text-muted">The Immortal Ascension</p>
            <div class="d-flex align-items-center gap-3">
                <span class="badge bg-warning text-dark"><i class="bi bi-star-fill"></i> 4.2</span>
                <span>2025</span>
                <span>T13</span>
                <span>3/32 tập</span>
                <span>Trung Quốc</span>
            </div>
            <p class="mt-3">Bạo lực</p>
            <p class="desc">
                Phàm Nhân Tu Tiên Truyện là hành trình tu luyện khốc liệt của Hàn Lập, một thiếu niên nghèo có ước mơ trở thành tiên nhân. Với xuất thân bình thường, Hàn Lập gia nhập một môn phái nhỏ rồi dựa vào nỗ lực cùng mưu trí của bản thân để vượt qua vô số nghịch cảnh trên con đường tu tiên đầy hiểm nguy. Với tạo hình đẹp mắt, kỹ xảo ấn tượng cùng loạt cảnh chiến đấu mãn nhãn, đây là tác phẩm tiên hiệp hứa hẹn sẽ mang đến trải nghiệm thị giác vượt trội cho người xem.
            </p>
            <div>
                <h4 class="mt-5">Danh sách</h4>
                <div class="row g-3">
                    <!-- Tập 1 -->
                    <div class="col-12 col-sm-6 col-lg-4">
                        <div class="bg-dark rounded p-2">
                            <div class="position-relative">
                                <img src="https://image.tmdb.org/t/p/original/h9q0ozwMWy7CK5U7FSZsMVtbsCQ.jpg" class="img-fluid rounded" />
                                <span class="position-absolute top-0 start-0 badge bg-danger m-2">Vip</span>
                            </div>
                            <h6 class="mt-2">Tập 1</h6>
                        </div>
                    </div>
                    <div class="col-12 col-sm-6 col-lg-4">
                        <div class="bg-dark rounded p-2">
                            <div class="position-relative">
                                <img src="https://image.tmdb.org/t/p/original/h9q0ozwMWy7CK5U7FSZsMVtbsCQ.jpg" class="img-fluid rounded" />
                                <span class="position-absolute top-0 start-0 badge bg-danger m-2">Vip</span>
                            </div>
                            <h6 class="mt-2">Tập 1</h6>
                        </div>
                    </div>
                    <div class="col-12 col-sm-6 col-lg-4">
                        <div class="bg-dark rounded p-2">
                            <div class="position-relative">
                                <img src="https://image.tmdb.org/t/p/original/h9q0ozwMWy7CK5U7FSZsMVtbsCQ.jpg" class="img-fluid rounded" />
                                <span class="position-absolute top-0 start-0 badge bg-danger m-2">Vip</span>
                            </div>
                            <h6 class="mt-2">Tập 1</h6>
                        </div>
                    </div>
                </div>
            </div>
            <div>
                <h4 class="mt-5">Trailer</h4>
                <div class="row g-3">
                    <!-- Tập 1 -->
                    <div class="col-12 col-sm-6 col-lg-4">
                        <div class="bg-dark rounded p-2">
                            <div class="position-relative">
                                <img src="https://image.tmdb.org/t/p/original/h9q0ozwMWy7CK5U7FSZsMVtbsCQ.jpg" class="img-fluid rounded" />
                                <span class="position-absolute top-0 start-0 badge bg-danger m-2">Vip</span>
                            </div>
                            <h6 class="mt-2">Trailer 1</h6>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <div class="col-lg-1"></div>
        <div class="col-lg-4">
            <div class="d-flex gap-3 mb-3">
                <a href="#"><i class="bi bi-heart"></i> Theo dõi</a>
                <a href="#"><i class="bi bi-share"></i> Chia sẻ</a>
            </div>
            <ul class="list-unstyled small">
                <li><strong>Diễn viên:</strong> Dương Dương, Kim Thần, Uông Đặc</li>
                <li><strong>Đạo diễn:</strong> Dương Dương</li>
                <li><strong>Thể loại:</strong> Cổ trang, Hành động, Giả tưởng</li>
                <li><strong>Danh mục:</strong> <a href="#">Phim bộ</a> › <a href="#">Hoa ngữ</a></li>
            </ul>
        </div>
        <div>
            <div class="same-movie">
                <h4 class="text-white mb-3">Nội dung liên quan</h4>
                <div class="d-flex overflow-auto gap-3 mb-5">
                    <div class="col-12 col-sm-6 col-lg-3">
                        <div class="bg-dark rounded p-2">
                            <div class="position-relative">
                                <img src="https://image.tmdb.org/t/p/original/h9q0ozwMWy7CK5U7FSZsMVtbsCQ.jpg" class="img-fluid rounded" />
                                <span class="position-absolute top-0 start-0 badge bg-danger m-2">Vip</span>
                            </div>
                            <h6 class="mt-2">Trailer 1</h6>
                        </div>
                    </div>
                    <div class="col-12 col-sm-6 col-lg-3">
                        <div class="bg-dark rounded p-2">
                            <div class="position-relative">
                                <img src="https://image.tmdb.org/t/p/original/h9q0ozwMWy7CK5U7FSZsMVtbsCQ.jpg" class="img-fluid rounded" />
                                <span class="position-absolute top-0 start-0 badge bg-danger m-2">Vip</span>
                            </div>
                            <h6 class="mt-2">Trailer 1</h6>
                        </div>
                    </div>
                    <div class="col-12 col-sm-6 col-lg-3">
                        <div class="bg-dark rounded p-2">
                            <div class="position-relative">
                                <img src="https://image.tmdb.org/t/p/original/h9q0ozwMWy7CK5U7FSZsMVtbsCQ.jpg" class="img-fluid rounded" />
                                <span class="position-absolute top-0 start-0 badge bg-danger m-2">Vip</span>
                            </div>
                            <h6 class="mt-2">Trailer 1</h6>
                        </div>
                    </div>
                    <div class="col-12 col-sm-6 col-lg-3">
                        <div class="bg-dark rounded p-2">
                            <div class="position-relative">
                                <img src="https://image.tmdb.org/t/p/original/h9q0ozwMWy7CK5U7FSZsMVtbsCQ.jpg" class="img-fluid rounded" />
                                <span class="position-absolute top-0 start-0 badge bg-danger m-2">Vip</span>
                            </div>
                            <h6 class="mt-2">Trailer 1</h6>
                        </div>
                    </div>
                    <!-- Thêm các phim khác tương tự -->
                </div>
            </div>
            <div class="actor">
                <h4 class="text-white mb-3">Diễn viên</h4>
                <div class="d-flex gap-4 mb-5">
                    <div class="text-center">
                        <img src="https://image.tmdb.org/t/p/original/h9q0ozwMWy7CK5U7FSZsMVtbsCQ.jpg" class="rounded-circle border border-2" width="100" height="100" />
                        <p class="mt-2 text-white">Dương Dương</p>
                    </div>
                    <div class="text-center">
                        <img src="https://image.tmdb.org/t/p/original/h9q0ozwMWy7CK5U7FSZsMVtbsCQ.jpg" class="rounded-circle border border-2" width="100" height="100" />
                        <p class="mt-2 text-white">Kim Thần</p>
                    </div>
                    <div class="text-center">
                        <img src="https://image.tmdb.org/t/p/original/h9q0ozwMWy7CK5U7FSZsMVtbsCQ.jpg" class="rounded-circle border border-2" width="100" height="100" />
                        <p class="mt-2 text-white">Uông Đặc</p>
                    </div>
                </div>
            </div>
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