<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<nav class="navbar navbar-expand-lg navbar-dark bg-black fixed-top">
    <div class="container-fluid">
        <!-- Logo -->
        <a class="navbar-brand" href="home.jsp">
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
                <li class="nav-item">
                    <a class="nav-link" href="/Manage">Anime</a>
                </li>
                <li class="nav-item search-container">
                    <a class="nav-link search-button" href="#">Search</a>
                    <form action="/Search" method="Post" class="search-form">
                        <input type="text" name="q" class="search-input" placeholder="Search..." />
                    </form>
                </li>
            </ul>
            <!-- Nút login/signup -->
            <div class="d-flex d-none d-lg-flex">
                <button class="btn btn-outline-light me-2" data-bs-toggle="modal" data-bs-target="#loginModal">Login</button>
                <button class="btn btn-warning" data-bs-toggle="modal" data-bs-target="#signUpModal">Sign Up</button>
            </div>
        </div>
    </div>
</nav>

<!-- Modal Login -->
<div class="modal fade" id="loginModal" tabindex="-1" aria-labelledby="loginModalLabel" aria-hidden="true">
    <div class="modal-dialog modal-dialog-centered modal-md">
        <div class="modal-content bg-dark text-white">
            <div class="modal-header">
                <h5 class="modal-title" id="loginModalLabel">Login</h5>
                <button type="button" class="btn-close btn-close-white" data-bs-dismiss="modal" aria-label="Close"></button>
            </div>
            <div class="modal-body justify-content-center align-items-center d-flex  ">
                <form class="form">
                    <span class="input-span">
                        <label for="email" class="label">Email</label>
                        <input type="email" name="email" id="emailLogin"/></span>
                    <span class="input-span">
                        <label for="passwordLogin" class="label">Password</label>
                        <input type="password" name="password" id="passwordLogin"/>
                    </span>
                    <br>
                    <span class="span"><a href="#">Forgot password?</a></span>
                    <input class="submit" type="submit" value="Log in" />
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
                <button type="button" class="btn-close btn-close-white" data-bs-dismiss="modal" aria-label="Close"></button>
            </div>
            <div class="modal-body justify-content-center align-items-center d-flex  ">
                <form class="form">
                    <span class="input-span">
                        <label for="email" class="label">Email</label>
                        <input type="email" name="email" id="email" /></span>
                    <span class="input-span">
                        <label for="password1" class="label">Password</label>
                        <input type="password" name="password" id="password1"/>
                    </span>
                    <span class="input-span">
                        <label for="password2" class="label">Confirm Password</label>
                        <input type="password" name="password" id="password2"/>
                    </span>
                    <br>
                    <input class="submit" type="submit" value="Sign Up Now" />
                    <span class="span">You already have an account!
                        <a href="#" data-bs-toggle="modal" data-bs-target="#loginModal">Login</a>
                    </span>
                </form>
            </div>
        </div>
    </div>
</div>

