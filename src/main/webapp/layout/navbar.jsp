<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<nav class="navbar navbar-expand-lg navbar-dark bg-black fixed-top">
    <div class="container-fluid">
        <!-- Logo -->
        <a class="navbar-brand" href="/Home">
            <img src="https://firebasestorage.googleapis.com/v0/b/nt208-28e2a.appspot.com/o/image%2FCovencinema1.png?alt=media&token=ea465101-0093-4d73-ac07-d8e4472e6f2a" alt="Conven Cinema" class="logo">
        </a>

        <!-- Toggle button cho mobile -->
        <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#mainNav">
            <span class="navbar-toggler-icon"></span>
        </button>
        <!-- Menu -->
        <div class="collapse navbar-collapse" id="mainNav">
            <ul class="navbar-nav me-auto mb-2 mb-lg-0">
                <c:if test="${sessionScope.account == null}">
                    <li class="nav-item d-sm-none">
                        <a class="nav-link " data-bs-toggle="modal" data-bs-target="#loginModal">Login</a>
                    </li>
                </c:if>
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
                    <a class="nav-link" role="button" data-bs-toggle="dropdown" aria-expanded="false">
                        Genre
                    </a>

                    <div class="dropdown-menu row ">
                        <c:forEach var="genre" items="${GenreList}" varStatus="status">
                            <c:url var="searchUrl" value="/Search">
                                <c:param name="Genre" value="${genre.genreName}" />
                            </c:url>
                            <a class="dropdown-item nav-link" href="${searchUrl}">
                                    ${genre.genreName}
                            </a>
                        </c:forEach>
                    </div>
                </li>

                <c:if test="${sessionScope.account.memberTypeId == 0}">
                    <li class="nav-item">
                        <a class="nav-link" href="/admin/movies">Admin</a>
                    </li>
                </c:if>
                <c:if test="${sessionScope.account == null}">
                    <li class="nav-item d-sm-none">
                        <a class="nav-link " data-bs-toggle="modal" data-bs-target="#loginModal" >Login</a>
                    </li>
                </c:if>
                <c:if test="${sessionScope.account != null && sessionScope.account.memberTypeId != 0 }">
                    <li class="nav-item d-sm-none">
                        <a class="nav-link " data-bs-toggle="modal" data-bs-target="#subscribeModal" >Subcsribe</a>
                    </li>
                </c:if>

                <li class="nav-item search-container">
                    <a class="nav-link search-button" href="#">Search</a>
                    <form action="/Search" method="Post">
                        <input type="text" name="title" class="search-input" placeholder="Search..."/>
                    </form>
                </li>
            </ul>

            <c:choose>
                <c:when test="${sessionScope.account == null}">
                    <div class="d-flex d-none d-lg-flex">
                        <button class="btn btn-outline-light me-2" data-bs-toggle="modal" data-bs-target="#loginModal">
                            Login
                        </button>
                        <button class="btn btn-warning" data-bs-toggle="modal" data-bs-target="#signUpModal">Sign Up
                        </button>
                    </div>
                </c:when>
                <c:otherwise>
                    <c:if test="${sessionScope.account.memberTypeId != 0 }">
                        <div class="subscribe-btn d-none d-lg-flex">
                            <button class="btn btn-warning" data-bs-toggle="modal" data-bs-target="#subscribeModal">
                                <i class="fa-solid fa-wallet"></i>  Subscribe
                            </button>
                        </div>
                    </c:if>
                    <div class="account-info d-none d-lg-flex ">
                        <c:if test="${not empty User.name}">
                            <p> Hello,<a href="/User">${User.name}</a> </p>
                        </c:if>
                        <c:if test="${empty User.name && not empty sessionScope.account.username}">
                            <p> Hello, <a href="/User">${sessionScope.account.username}</a> </p>
                        </c:if>
                        <p> MemType: ${sessionScope.account.memberTypeId}</p>
                    </div>
                    <a href="/LogOut">
                        <button class="btn btn-warning">Log Out</button>
                    </a>
                </c:otherwise>
            </c:choose>
        </div>
    </div>
</nav>


<!-- Modal Login -->
<div class="modal fade" id="loginModal" tabindex="-1" aria-labelledby="loginModalLabel" aria-hidden="true">
    <div class="modal-dialog modal-dialog-centered modal-md">
        <div class="modal-content bg-dark text-white">
            <div class="modal-header">
                <h5 class="modal-title" id="loginModalLabel">Login</h5>
                <button type="button" class="btn-close btn-close-white" data-bs-dismiss="modal"
                        aria-label="Close"></button>
            </div>
            <div class="modal-body justify-content-center align-items-center d-flex  ">
                <form action="/Home?action=login" class="form" method="post">
                   <span class="input-span">
                        <label for="usernameLogin" class="label">Username</label>
                        <input type="text" name="username" id="usernameLogin"/>
                        <label for="passwordLogin" class="label">Password</label>
                        <input type="password" name="password" id="passwordLogin"/>
                    </span>
                    <br>
                    <p id="loginMessage"></p>
                    <span class="span"><a href="#">Forgot password?</a></span>
                    <input class="submit" type="submit" value="Log in"/>
                    <span class="span">Don't have an account?
                        <a href="" data-bs-toggle="modal" data-bs-target="#signUpModal">Sign up</a>
                    </span>
                </form>
            </div>
        </div>
    </div>
</div>
<!-- Modal Sign Up -->
<div class="modal fade" id="signUpModal" tabindex="-1" aria-labelledby="signUpModalLabel" aria-hidden="true">
    <div class="modal-dialog modal-dialog-centered modal-md">
        <div class="modal-content bg-dark text-white">
            <div class="modal-header">
                <h5 class="modal-title" id="signUpModalLabel">Sign Up</h5>
                <button type="button" class="btn-close btn-close-white" data-bs-dismiss="modal"
                        aria-label="Close"></button>
            </div>
            <div class="modal-body justify-content-center align-items-center d-flex  ">
                <form action="/Home?action=signUp" class="form" method="post" >
                    <span class="input-span">
                        <label for="usernameSignUp" class="label">Username</label>
                        <input type="text" name="username" id="usernameSignUp"/>
                        <label for="email" class="label">Email</label>
                        <input type="text" name="email" id="email"/>
                        <label for="password1" class="label">Password</label>
                        <input type="password" name="password1" id="password1"/>
                        <label for="password2" class="label">Confirm Password</label>
                        <input type="password" name="password2" id="password2"/>
                    </span>
                    <p id="signupMessage"></p>
                    <br>
                    <input class="submit" type="submit" value="Sign Up Now"/>
                    <span class="span">You already have an account!
                        <a href="#" data-bs-toggle="modal" data-bs-target="#loginModal">Login</a>
                    </span>
                </form>
            </div>
        </div>
    </div>
</div>
<!-- Modal Forgot password  -->
<div class="modal fade" id="forgotPWModal" tabindex="-1" aria-labelledby="forgotPWModalLabel" aria-hidden="true">
    <div class="modal-dialog modal-dialog-centered modal-md">
        <div class="modal-content bg-dark text-white">
            <div class="modal-header">
                <h5 class="modal-title" id="forgotPWModalLabel">Change Password</h5>
                <button type="button" class="btn-close btn-close-white" data-bs-dismiss="modal"
                        aria-label="Close"></button>
            </div>
            <div class="modal-body justify-content-center align-items-center d-flex  ">
                <form action="/Home?action=signUp" class="form" method="post" >
                    <span class="input-span">
                        <label for="usernameForgot" class="label">Username</label>
                        <input type="text" name="usernameForgot" id="usernameForgot"/>
                        <label for="emailForgot" class="label">Email</label>
                        <input type="text" name="emailForgot" id="emailForgot"/>
                        <label for="passwordForgot1" class="label">Password</label>
                        <input type="password" name="passwordForgot1" id="passwordForgot1"/>
                        <label for="passwordForgot2" class="label">Confirm Password</label>
                        <input type="password" name="passwordForgot2" id="passwordForgot2"/>
                    </span>
                    <p id="forgotMessage"></p>
                    <br>
                    <input class="submit" type="submit" value="Sign Up Now"/>
                    <span class="span">You already have an account!
                        <a href="#" data-bs-toggle="modal" data-bs-target="#loginModal">Login</a>
                    </span>
                </form>
            </div>
        </div>
    </div>
</div>
<!-- Modal Subcsribe -->
<div class="modal fade" id="subscribeModal" tabindex="-1" aria-labelledby="subscribeModalLabel" aria-hidden="true">
    <div class="modal-dialog modal-dialog-centered modal-md">
        <div class="modal-content bg-dark text-white">
            <div class="modal-header">
                <h5 class="modal-title" id="subscribeModalLabel">Subscribe</h5>
                <button type="button" class="btn-close btn-close-white" data-bs-dismiss="modal" aria-label="Close"></button>
            </div>
            <div class="modal-body justify-content-center align-items-center d-flex  ">
                <form action="/Home?action=subscribe" class="form" method="post">
                    <p id="subscribeMessage"></p>
                    <nav class="subscribe-input row">
                        <div class="box">
                            <input type="radio" id="sliver" checked="" name="subscribe" value="2" >
                            <label for="sliver" class="subject">
                                <span>Sliver Member</span>
                                <span>100$/year</span>
                            </label>
                        </div>
                        <div class="box">
                            <input type="radio" id="gold" name="subscribe" value="3">
                            <label for="gold" class="subject">
                                <span>Gold Member</span>
                                <span>300$/year</span>
                            </label>
                        </div>
                    </nav>
                    <input class="submit" type="submit" value="Subscribe now!" />
                </form>
            </div>
        </div>
    </div>
</div>
<!-- Modal Alert -->
<div class="modal" id="alertModal" tabindex="-1" aria-labelledby="alertModalLabel" aria-hidden="true">
    <div class="modal-dialog modal-dialog-center">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title">Notification</h5>
                <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
            </div>
            <div class="modal-body">
                <p id="alertMessage"></p>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Close</button>
            </div>
        </div>
    </div>
</div>
<!-- Modal Trailer -->
<div class="modal fade" id="trailerModal" tabindex="-1" aria-labelledby="trailerModalLabel" aria-hidden="true">
    <div class="modal-dialog modal-dialog-centered modal-xl">
        <div class="modal-content bg-black text-white">
            <div class="modal-header">
                <h5 class="modal-title" id="trailerModalLabel">trailer</h5>
                <button type="button" class="btn-close btn-close-white" data-bs-dismiss="modal"
                        aria-label="Close"></button>
            </div>
            <div class="modal-body justify-content-center align-items-center d-flex  ">
                <iframe src="" title="YouTube video player" id="trailerFrame"
                        allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture; web-share"
                        referrerpolicy="strict-origin-when-cross-origin" allowfullscreen></iframe>
            </div>
        </div>
    </div>
</div>
<!-- Modal Change Password -->
<div class="modal fade" id="changePWModal" tabindex="-1" aria-labelledby="changePWModalLabel" aria-hidden="true">
    <div class="modal-dialog modal-dialog-centered modal-md">
        <div class="modal-content bg-dark text-white">
            <div class="modal-header">
                <h5 class="modal-title" id="changePWModalLabel">Change Password</h5>
                <button type="button" class="btn-close btn-close-white" data-bs-dismiss="modal"
                        aria-label="Close"></button>
            </div>
            <div class="modal-body justify-content-center align-items-center d-flex  ">
                <form action="/User?action=changePassword" class="form" method="post" >
                    <span class="input-span">
                        <label for="oldPassword" class="label">Old Password</label>
                        <input type="password" name="oldPassword" id="oldPassword"/>
                        <label for="newPassword1" class="label">New Password</label>
                        <input type="password" name="newPassword1" id="newPassword1"/>
                        <label for="newPassword2" class="label">Confirm new Password</label>
                        <input type="password" name="newPassword2" id="newPassword2"/>
                    </span>
                    <p id="changeMessage"></p>
                    <br>
                    <input class="submit" type="submit" value="Change Now"/>
                    </span>
                </form>
            </div>
        </div>
    </div>
</div>

<c:if test="${not empty errorSignup}">
    <script>
        document.addEventListener("DOMContentLoaded", function() {
            document.getElementById("signupMessage").innerText = "${errorSignup}";
            new bootstrap.Modal(document.getElementById('signUpModal')).show();
        });
    </script>
</c:if>
<c:if test="${not empty errorLogin}">
    <script>
        document.addEventListener("DOMContentLoaded", function() {
            document.getElementById("loginMessage").innerText = "${errorLogin}";
            new bootstrap.Modal(document.getElementById('loginModal')).show();
        });
    </script>
</c:if>

<c:if test="${not empty success}">
    <script>
        document.addEventListener("DOMContentLoaded", function() {
            document.getElementById("loginMessage").innerText = "${success}";
            new bootstrap.Modal(document.getElementById('loginModal')).show();
        });
    </script>
</c:if>

<c:if test="${not empty noPermission}">
    <script>
        document.addEventListener("DOMContentLoaded", function() {
            document.getElementById("subscribeMessage").innerText = "${noPermission}";
            new bootstrap.Modal(document.getElementById('subscribeModal')).show();
        });
    </script>
</c:if>

<c:if test="${not empty subscribeFail}">
    <script>
        document.addEventListener("DOMContentLoaded", function() {
            document.getElementById("subscribeMessage").innerText = "${subscribeFail}";
            new bootstrap.Modal(document.getElementById('subscribeModal')).show();
        });
    </script>
</c:if>
<c:if test="${not empty alertMessage}">
    <script>
        document.addEventListener("DOMContentLoaded", function() {
            document.getElementById("alertMessage").innerText = "${alertMessage}";
            new bootstrap.Modal(document.getElementById('alertModal')).show();
        });
    </script>
</c:if>
<c:if test="${not empty errorChangePassword}">
    <script>
        document.addEventListener("DOMContentLoaded", function() {
            document.getElementById("changeMessage").innerText = "${errorChangePassword}";
            new bootstrap.Modal(document.getElementById('changePWModal')).show();
        });
    </script>
</c:if>


<script>
    const trailerModal = document.getElementById('trailerModal');
    const trailerFrame = document.getElementById('trailerFrame');

    // Khi mở modal -> gán src cho iframe
    trailerModal.addEventListener('show.bs.modal', function (event) {
        const button = event.relatedTarget; // button đã click
        const trailerPath = button.getAttribute('data-trailer');
        trailerFrame.src = trailerPath;
    });

    // Khi đóng modal -> xóa src để tắt video
    trailerModal.addEventListener('hidden.bs.modal', function () {
        trailerFrame.src = "";
    });
</script>