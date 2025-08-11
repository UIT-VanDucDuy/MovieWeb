<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Title</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <script src="https://kit.fontawesome.com/d3ee10eebc.js" crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
    <link rel="stylesheet" href="../css/home.css">
    <link rel="stylesheet" href="../css/admin.css">
    <script src="../jvs/admin.js"></script>
</head>
<body>
<nav class="navbar navbar-expand-lg navbar-dark bg-black fixed-top">
    <div class="container-fluid">
        <!-- Logo -->
        <a class="navbar-brand" href="#">
            <img src="image/Covencinema.png" alt="Spooky Movie" class="logo">
        </a>

        <!-- Toggle button cho mobile -->
        <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#mainNav">
            <span class="navbar-toggler-icon"></span>
        </button>
        <!-- Menu -->
        <div class="collapse navbar-collapse" id="mainNav">
            <ul class="navbar-nav me-auto mb-2 mb-lg-0">
                <li class="nav-item">
                    <a class="nav-link active" href="#">Home</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link" href="Search.html">TV Seris</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link" href="Search.html">Anime</a>
                </li>
                <li class="nav-item dropdown">
                    <a class="nav-link"  role="button" data-bs-toggle="dropdown" aria-expanded="false">
                        Genre
                    </a>
                    <div class="dropdown-menu row ">
                        <a class="dropdown-item nav-link" href="Search.html">Link 1</a>
                        <a class="dropdown-item nav-link" href="Search.html">Link 2</a>
                        <a class="dropdown-item nav-link" href="Search.html">Link 3</a>
                        <a class="dropdown-item nav-link" href="Search.html">Link 4</a>
                        <a class="dropdown-item nav-link" href="Search.html">Link 5</a>
                        <a class="dropdown-item nav-link" href="Search.html">Link 6</a>
                        <a class="dropdown-item nav-link" href="Search.html">Link 7</a>
                    </div>
                </li>
                <li class="nav-item">
                    <a class="nav-link" href="Admin.html">Admin</a>
                </li>
                <li class="nav-item search-container">
                    <a class="nav-link search-button" href="#">Search</a>
                    <form action="Search.html" method="GET" class="search-form">
                        <input type="text" name="q" class="search-input" placeholder="Search..." />
                    </form>
                </li>
            </ul>
        </div>
    </div>
</nav>
<div class="main mt-4 ">
    <h1 class="title">Quản lý trang web</h1>

    <div class="row">
        <div class="col-lg-3" >
            <ul class="list-group" id="menu">
                <li class="list-group-item active" data-table="table1">User</li>
                <li class="list-group-item" data-table="table2">Account</li>
                <li class="list-group-item" data-table="table3">Movie</li>
            </ul>
        </div>
        <div class="col-lg-9">
            <table id="table1" class="table  table-striped table-dark">
                <thead>
                <tr>
                    <th scope="col">User</th>
                    <th scope="col">Name</th>
                    <th scope="col">Age</th>
                    <th scope="col">Note</th>
                </tr>
                </thead>
                <tbody>
                <tr>
                    <th scope="row">1</th>
                    <td>Mark</td>
                    <td>Otto</td>
                    <td>@mdo</td>
                </tr>
                <tr>
                    <th scope="row">2</th>
                    <td>Jacob</td>
                    <td>Thornton</td>
                    <td>@fat</td>
                </tr>
                <tr>
                    <th scope="row">3</th>
                    <td>John</td>
                    <td>Doe</td>
                    <td>@social</td>
                </tr>
                </tbody>
            </table>
            <table id="table2" class="table table-striped table-dark d-none">
                <thead>
                <tr>
                    <th scope="col">Account</th>
                    <th scope="col">First</th>
                    <th scope="col">Last</th>
                    <th scope="col">Handle</th>
                </tr>
                </thead>
                <tbody>
                <tr>
                    <th scope="row">1</th>
                    <td>Mark</td>
                    <td>Otto</td>
                    <td>@mdo</td>
                </tr>
                <tr>
                    <th scope="row">2</th>
                    <td>Jacob</td>
                    <td>Thornton</td>
                    <td>@fat</td>
                </tr>
                <tr>
                    <th scope="row">3</th>
                    <td>John</td>
                    <td>Doe</td>
                    <td>@social</td>
                </tr>
                </tbody>
            </table>
            <table id="table3" class="table table-striped table-dark d-none">
                <thead>
                <tr>
                    <th scope="col">Movie</th>
                    <th scope="col">First</th>
                    <th scope="col">Last</th>
                    <th scope="col">Handle</th>
                </tr>
                </thead>
                <tbody>
                <tr>
                    <th scope="row">1</th>
                    <td>Mark</td>
                    <td>Otto</td>
                    <td>@mdo</td>
                </tr>
                <tr>
                    <th scope="row">2</th>
                    <td>Jacob</td>
                    <td>Thornton</td>
                    <td>@fat</td>
                </tr>
                <tr>
                    <th scope="row">3</th>
                    <td>John</td>
                    <td>Doe</td>
                    <td>@social</td>
                </tr>
                </tbody>
            </table>

        </div>
    </div>

</div>
</body>
</html>

