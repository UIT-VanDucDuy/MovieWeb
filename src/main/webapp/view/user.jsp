<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
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
    <link rel="stylesheet" href="/css/home4.css">
    <link rel="stylesheet" href="../css/navbar.css">
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
                <button class="btn btn-outline-warning btn-sm" data-bs-toggle="modal" data-bs-target="#editUserModal">Edit Profile</button>
            </div>

            <!-- Tabs -->
            <ul class="nav nav-tabs mt-3" id="profileTab" role="tablist">
                <li class="nav-item text-waring">
                    <a class="nav-link text-warning active" id="about-tab" data-bs-toggle="tab" href="#about" role="tab">About</a>
                </li>
                <li class="nav-item text-waring">
                    <a class="nav-link text-warning" id="Wallet-tab" data-bs-toggle="tab" href="#wallet" role="tab">Wallet</a>
                </li>
                <li class="nav-item text-waring">
                    <a class="nav-link text-warning" id="Account-tab" data-bs-toggle="tab" href="#account" role="tab">Account</a>
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
                <div class="tab-pane fade gap-4" id="account" role="tabpanel">
                    <div class="row mb-2">
                        <div class="col-sm-3 fw-bold text-white">User Name: </div>
                        <div class="col-sm-9 text-warning">${sessionScope.account.username}</div>
                        <div class="col-sm-3 fw-bold text-white">Password: </div>
                        <c:set var="pwd" value="${sessionScope.account.password}"/>
                        <div class="col-sm-9 text-warning">
                            <c:forEach begin="1" end="${fn:length(pwd)}">*</c:forEach>
                        </div>
                        <div class="col-sm-3"></div>
                        <div class="col-sm-9">
                            <button class="btn btn-outline-warning btn-sm" data-bs-toggle="modal" data-bs-target="#changePWModal">Change password</button>
                        </div>
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

<div class="modal fade" id="editUserModal" tabindex="-1" aria-labelledby="editUserModalLabel" aria-hidden="true">
    <div class="modal-dialog modal-lg modal-dialog-centered">
        <div class="modal-content">
            <div class="modal-header">
                <h1 class="modal-title fs-5" id="editUserModalLabel">Edit User</h1>
                <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
            </div>

            <form action="/User?action=changeInfo" method="post">
                <div class="modal-body">
                    <div class="row g-3">
                        <div class="col">
                            <div class="mb-3">
                                <label class="me-3 mb-1">Full Name: </label>
                                <input type="text" class="form-control" placeholder="Full name" value="${User.name}"
                                       aria-label="Full name" name="name" id="editUserFullName">
                            </div>
                            <div class="mb-3">
                                <label class="me-3 mb-1">Address: </label>
                                <input type="text" class="form-control" placeholder="Address" value="${User.address}"
                                       aria-label="Address" name="address" id="editUserAddress">
                            </div>
                            <div class="mb-3">
                                <label class="me-3 mb-1">Birthday: </label>
                                <input type="date" class="form-control" placeholder="Birthday" value="${User.birthday}"
                                       aria-label="Birthday" name="birthday" id="editUserBirthday">
                            </div>
                        </div>
                        <div class="col">
                            <div class="mb-3">
                                <label class="me-3 mb-1">Phone Number: </label>
                                <input type="text" class="form-control" placeholder="Phone Number" value="${User.phoneNumber}"
                                       aria-label="Phone Number" name="phoneNumber" id="editUserPhoneNumber">
                            </div>
                            <div class="mb-3">
                                <label class="me-3 mb-1">Gender: </label>
                                <select name="gender" id="editUserGender" class="form-select">
                                    <option value="true" ${User.gender ? "selected" : ""}>Male</option>
                                    <option value="false" ${!User.gender ? "selected" : ""}>Female</option>
                                </select>
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


<c:import url="/layout/footer.jsp"></c:import>

</body>
</html>
