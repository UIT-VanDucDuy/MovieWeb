<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<nav class="navbar navbar-expand-lg navbar-dark bg-black fixed-top">
    <div class="container-fluid">
        <!-- Logo -->
        <a class="navbar-brand" href="/Home">
            <img src="file/image/Covencinema.png" alt="Spooky Movie" class="logo">
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
                        <a class="dropdown-item nav-link" href="/Search">Link 1</a>
                        <a class="dropdown-item nav-link" href="/Search">Link 2</a>
                        <a class="dropdown-item nav-link" href="/Search">Link 3</a>
                        <a class="dropdown-item nav-link" href="/Search">Link 4</a>
                        <a class="dropdown-item nav-link" href="/Search">Link 5</a>
                        <a class="dropdown-item nav-link" href="/Search">Link 6</a>
                        <a class="dropdown-item nav-link" href="/Search">Link 7</a>
                    </div>
                </li>
                <li class="nav-item">
                    <a class="nav-link" href="/Admin">Admin</a>
                </li>
                <c:if test="${sessionScope.account == null}">
                    <li class="nav-item d-sm-none">
                        <a class="nav-link " data-bs-toggle="modal" data-bs-target="#loginModal" >Subcsribe</a>
                    </li>
                </c:if>
                <c:if test="${sessionScope.account != null}">
                    <li class="nav-item d-sm-none">
                        <a class="nav-link " data-bs-toggle="modal" data-bs-target="#subscribeModal" >Subcsribe</a>
                    </li>
                </c:if>

                <li class="nav-item search-container">
                    <a class="nav-link search-button" href="#">Search</a>
                    <form action="/Search" method="Post" class="search-form">
                        <input type="text" name="q" class="search-input" placeholder="Search..."/>
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
                    <div class="subscribe-btn d-none d-lg-flex">
                        <button class="btn btn-warning" data-bs-toggle="modal" data-bs-target="#subscribeModal">
                            <i class="fa-solid fa-wallet"></i>  Subscribe
                        </button>
                    </div>
                    <div class="account-info d-none d-lg-flex ">
                        <p> Hello, ${sessionScope.account.username}</p>
                        <p> MemType: ${sessionScope.account.memberTypeId}</p>
                    </div>
                    <div class="d-none d-lg-flex">
                        <button class="btn btn-warning">Log Out</button>
                    </div>
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
                        <label for="usernameSignUp" class="label">Email</label>
                        <input type="text" name="username" id="usernameSignUp"/>
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
                    <img src="image/momo-qr.jpg" class="qr"/>
                    <div class="radio-input">
                        <label class="label">
                            <input type="radio" id="value-2" checked="" name="value-radio" value="value-2" />
                            <p class="text">Silver Member</p>
                        </label>
                        <label class="label">
                            <input type="radio" id="value-3" name="value-radio" value="value-3" />
                            <p class="text">Gold Member</p>
                        </label>
                    </div>
                    <input class="submit" type="submit" value="Subscribe now!" />
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


