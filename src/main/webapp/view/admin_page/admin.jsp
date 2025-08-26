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
    <link rel="stylesheet" href="../../css/home.css">
    <link rel="stylesheet" href="../../css/admin.css">
    <link rel="stylesheet" href="../../css/navbar.css">
    <script src="../../jvs/admin.js"></script>
</head>
<body>
<%--<c:if test="${sessionScope.account.memberTypeId != 0}">--%>
<%--    <c:redirect url="/Home"></c:redirect>--%>
<%--</c:if>--%>
<c:import url="/layout/navbar.jsp"></c:import>

<div class="main mt-4 ">
    <div class="mb-3 mt-2">
        <h1 class="title">User Management</h1>
    </div>


    <div class="row">
        <div class="col-lg-2">
            <ul class="list-group pt-5" id="menu">
                <li class="list-group-item active" data-table="userAccountTable">User Account</li>
                <li class="list-group-item" data-table="movieManagementTable">Movies</li>
                <li class="list-group-item" data-table="movieTypeTable">Movie Types</li>
            </ul>
        </div>
        <div class="col-lg-10">
            <c:import url="/view/admin_page/user_account.jsp"></c:import>
            <c:import url="/view/admin_page/movie_management.jsp"></c:import>
            <%--            <c:import url="/view/admin_page/movie_type.jsp"></c:import>--%>
        </div>
    </div>
</div>


<%--<c:import url="/layout/footer.jsp"></c:import>--%>
</body>
</html>

