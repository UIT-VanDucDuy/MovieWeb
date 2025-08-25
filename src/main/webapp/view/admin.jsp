<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>


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
    <link rel="stylesheet" href="../css/navbar.css">
    <script src="../jvs/admin.js"></script>
</head>
<body>
<c:import url="/layout/navbar.jsp"></c:import>
<c:import url="/view/admin_page/user_account.jsp"></c:import>
<div class="main mt-4 ">
    <div class="d-flex justify-content-between align-items-center mb-3 mt-2">
        <div>
            <h1 class="title">Management Page</h1>
        </div>
        <div>
            <form action="/Admin" method="get">
                <input type="hidden" name="action" value="showAddForm">
                <button type="submit" class="btn btn-primary btn-md" data-bs-toggle="modal"
                        data-bs-target="#addUserModal">
                    + Create
                </button>
            </form>
        </div>
    </div>

    <div class="row">
        <div class="col-lg-2">
            <ul class="list-group" id="menu">
                <li class="list-group-item active" data-table="table1">User Account</li>
                <li class="list-group-item" data-table="table3">Movies</li>
                <li class="list-group-item" data-table="movieTypeTable">Movie Types</li>
            </ul>
        </div>
        <div class="col-lg-10">
            <table id="table1" class="table  table-striped table-dark">
                <thead>
                <tr>
                    <th scope="col">No.</th>
                    <th scope="col">Name</th>
                    <th scope="col">User Name</th>
                    <th scope="col">Phone Number</th>
                    <th scope="col">Email</th>
                    <th scope="col">Action</th>
                </tr>
                </thead>
                <tbody>
                <c:forEach var="user" items="${userList}" varStatus="loop">
                    <tr>
                        <td>${loop.count}</td>
                        <td>${user.name}</td>
                        <td>${user.username}</td>
                        <td>${user.phoneNumber}</td>
                        <td>${user.email}</td>
                        <td>
                            <div class="d-flex gap-3 align-items-start">
                                <form action="/Admin" method="get">
                                    <input hidden="hidden" name="action" value="showEditForm">
                                    <input type="hidden" name="id" value="${user.id}">
                                    <button type="submit" class="btn btn-primary btn-sm">
                                        Edit
                                    </button>
                                </form>
                                <button onclick="deleteUser(${user.id})" type="button"
                                        class="btn btn-danger btn-sm" data-bs-toggle="modal"
                                        data-bs-target="#deleteUserModal">
                                    Delete
                                </button>
                            </div>
                        </td>
                    </tr>
                </c:forEach>
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
            <table id="movieTypeTable" class="table  table-striped table-dark d-none">
                <thead>
                <tr>
                    <th scope="col">No.</th>
                    <th scope="col">Movie Types</th>
                </tr>
                </thead>
                <tbody>
                <tr>
                    <th scope="row">1</th>
                    <td>Action Film</td>

                </tr>
                <tr>
                    <th scope="row">2</th>
                    <td>Adventure</td>
                </tr>
                <tr>
                    <th scope="row">3</th>
                    <td>Comedy</td>
                </tr>
                </tbody>
            </table>
        </div>
    </div>
</div>


</body>
</html>

