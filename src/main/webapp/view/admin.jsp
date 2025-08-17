<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%--<c:if test="${sessionScope.account == null}">--%>
<%--    <c:redirect url="/Home"></c:redirect>--%>
<%--</c:if>--%>
<c:import url="/layout/navbar.jsp"></c:import>

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
<div class="main mt-4 ">
    <h1 class="title">Quản lý trang web</h1>

    <div class="row">
        <div class="col-lg-3" >
            <ul class="list-group" id="menu">
                <li class="list-group-item active" data-table="table1">Subscribers</li>
                <li class="list-group-item" data-table="table2">Accounts</li>
                <li class="list-group-item" data-table="table3">Movies</li>
                <li class="list-group-item" data-table="movieTypeTable">Movie Types</li>
            </ul>
        </div>
        <div class="col-lg-9">
            <table id="table1" class="table  table-striped table-dark">
                <thead>
                <tr>
                    <th scope="col">No.</th>
                    <th scope="col">Name</th>
                    <th scope="col">Birthday</th>
                    <th scope="col">Phone number</th>
                    <th scope="col">Address</th>
                    <th scope="col">Action</th>
                </tr>
                </thead>
                <tbody>
                <c:forEach var="subscriber" items="${subscriberList}" varStatus="loop">
                    <tr>
                        <td>${loop.count}</td>
                        <td>${subscriber.name}</td>
                        <td>${subscriber.birthday}</td>
                        <td>${subscriber.phoneNumber}</td>
                        <td>${subscriber.address}</td>
                        <td>
                            <button type="button" class="btn btn-primary btn-sm">Edit</button>
                            <button type="button" class="btn btn-danger btn-sm">Delete</button>
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

