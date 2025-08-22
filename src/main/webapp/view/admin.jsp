<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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
    <link rel="stylesheet" href="/css/navbar.css">
    <script src="../jvs/admin.js"></script>
</head>
<body>
<c:if test="${sessionScope.account.memberTypeId != 0}">
    <c:redirect url="/Home"></c:redirect>
</c:if>
<c:import url="/layout/navbar.jsp"></c:import>
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

