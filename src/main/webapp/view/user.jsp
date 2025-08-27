<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>Trang Web Xem Phim</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <script src="https://kit.fontawesome.com/d3ee10eebc.js" crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
    <script src="jvs/home.js"></script>
    <link rel="stylesheet" href="/css/home1.css">
    <link rel="stylesheet" href="../css/navbar1.css">
    <link rel="stylesheet" href="../css/user.css">
</head>
<body>
<c:import url="/layout/navbar.jsp"></c:import>
<div class="row container mt-4 main ">
    <div class="d-flex justify-content-center">
        <!-- Left Column -->
        <div class="profile col-md-3 d-flex flex-column align-items-center">
            <div class="profile-img mb-3">
                <c:if test="${User.isGender() == true}">
                    <img src="file/image/profile_male.png" alt="Profile">
                </c:if>
                <c:if test="${User.isGender() == false}">
                    <img src="file/image/profile_male.png" alt="Profile">
                </c:if>
            </div>

        </div>

        <!-- Right Column -->
        <div class="col-md-6">
            <div class="d-flex justify-content-between align-items-start">
                <div>
                    <h4 class="text-white">${User.getName()}</h4>
                    <p class="text-white">Member Type: ${User.getMemberTypeId()}</p>
                </div>
                <button class="btn btn-outline-warning btn-sm">Edit Profile</button>
            </div>

            <!-- Tabs -->
            <ul class="nav nav-tabs mt-3" id="profileTab" role="tablist">
                <li class="nav-item text-waring">
                    <a class="nav-link text-warning active" id="about-tab" data-bs-toggle="tab" href="#about" role="tab">About</a>
                </li>
                <li class="nav-item text-waring">
                    <a class="nav-link text-warning" id="Wưallet-tab" data-bs-toggle="tab" href="#wallet" role="tab">Wallet</a>
                </li>
            </ul>

            <!-- Tab Content -->
            <div class="tab-content p-3 " id="profileTabContent">
                <div class="tab-pane fade show active" id="about" role="tabpanel">
                    <div class="row mb-2">
                        <div class="col-sm-3 fw-bold text-white">User Id</div>
                        <div class="col-sm-9 text-warning">${User.getId()}</div>
                    </div>
                    <div class="row mb-2">
                        <div class="col-sm-3 fw-bold text-white">Name</div>
                        <div class="col-sm-9 text-warning">${User.getName()}</div>
                    </div>
                    <div class="row mb-2">
                        <div class="col-sm-3 fw-bold text-white">Birthday</div>
                        <div class="col-sm-9 text-warning">${User.getBirthday()}</div>
                    </div>
                    <div class="row mb-2">
                        <div class="col-sm-3 fw-bold text-white">Email</div>
                        <div class="col-sm-9 text-warning">${User.getEmail()}</div>
                    </div>
                    <div class="row mb-2">
                        <div class="col-sm-3 fw-bold text-white">Phone</div>
                        <div class="col-sm-9 text-warning">${User.getPhoneNumber()}</div>
                    </div>
                    <div class="row mb-2">
                        <div class="col-sm-3 fw-bold text-white">Address</div>
                        <div class="col-sm-9 text-warning">${User.getAddress()}</div>
                    </div>
                </div>
                <div class="tab-pane fade" id="wallet" role="tabpanel">
                    <div class="row mb-2">
                        <div class="col-sm-3 fw-bold text-white">Wallet balance</div>
                        <div class="col-sm-9 text-warning">${User.getMoney()} $</div>
                    </div>
                </div>
            </div>
        </div>

        <div  class="col-md-3 ms-5">
            <div>
                <h4 class="text-white">Watch List</h4>
            </div>
            <br>
            <div class="movie-item">
                <img class="movie-img">
                <div>
                    <p class="movie-title">Lemon Tree</p>
                    <p class="movie-author">Fools Garden</p>
                </div>
            </div>
            <div class="movie-item">
                <img class="movie-img">
                <div>
                    <p class="movie-title">Lemon Tree</p>
                    <p class="movie-author">Fools Garden</p>
                </div>
            </div>
            <div class="movie-item">
                <img class="movie-img">
                <div>
                    <p class="movie-title">Lemon Tree</p>
                    <p class="movie-author">Fools Garden</p>
                </div>
            </div>
            <div class="movie-item">
                <img class="movie-img">
                <div>
                    <p class="movie-title">Lemon Tree</p>
                    <p class="movie-author">Fools Garden</p>
                </div>
            </div>

        </div>
    </div>
</div>

<c:import url="/layout/footer.jsp"></c:import>

</body>
</html>
