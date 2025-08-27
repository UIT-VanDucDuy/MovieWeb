<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>

<c:set var="cpath" value="${pageContext.request.contextPath}" />
<c:set var="uri" value="${pageContext.request.requestURI}" />

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>User Management</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
    <link rel="stylesheet" href="${cpath}/css/home.css">
    <link rel="stylesheet" href="${cpath}/css/admin.css">
    <link rel="stylesheet" href="${cpath}/css/navbar.css">
    <script src="${cpath}/jvs/admin.js"></script>
</head>
<body>
<c:import url="/layout/navbar.jsp"></c:import>

<div class="main mt-4">
    <div class="mb-3 mt-2">
        <h1 class="title">User Management</h1>
    </div>

    <div class="row">
        <c:import url="admin.jsp"></c:import>

        <div class="col-lg-10">
            <div class="mb-3 text-end">
                <form action="/admin/users" method="get">
                    <input type="hidden" name="action" value="showAddForm">
                    <button type="submit" class="btn btn-primary btn-md" >
                        + Create User
                    </button>
                </form>
            </div>

            <table id="userAccountTable" class="table table-striped table-dark">
                <thead>
                <tr>
                    <th>No.</th>
                    <th>Name</th>
                    <th>User Name</th>
                    <th>Phone Number</th>
                    <th>Email</th>
                    <th>Action</th>
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
                                <form action="/admin/users" method="get">
                                    <input hidden="hidden" name="action" value="showEditForm">
                                    <input type="hidden" name="id" value="${user.id}">
                                    <button type="submit" class="btn btn-primary btn-sm">Edit</button>
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
        </div>
    </div>
</div>


<!-- addUserModal -->
<div class="modal fade" id="addUserModal" tabindex="-1" aria-labelledby="addUserModalLabel"
     aria-hidden="true">
    <div class="modal-dialog modal-lg">
        <div class="modal-content">
            <div class="modal-header">
                <h1 class="modal-title fs-5" id="addUserModalLabel">Add User</h1>
                <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
            </div>

            <form action="${pageContext.request.contextPath}/admin/users?action=addUser" method="post">
                <div class="modal-body">
                    <div class="row g-3">
                        <div class="col">
                            <div class="mb-3">
                                <label class="me-3 mb-1">Full Name: </label>
                                <input type="text" class="form-control" placeholder="Full name"
                                       aria-label="Full name" name="name">
                            </div>
                            <div class="mb-3">
                                <label class="me-3 mb-1">Address: </label>
                                <input type="text" class="form-control" placeholder="Address"
                                       aria-label="Address" name="address">
                            </div>
                            <div class="mb-3">
                                <label class="me-3 mb-1">Birthday: </label>
                                <input type="date" class="form-control" placeholder="Birthday"
                                       aria-label="Birthday" name="birthday">
                            </div>
                            <div class="mb-3">
                                <label class="me-3 mb-1">Username: </label>
                                <input type="text" class="form-control" placeholder="Username"
                                       aria-label="Username" name="username">
                            </div>
                        </div>
                        <div class="col">
                            <div class="mb-3">
                                <label class="me-3 mb-1">Phone Number: </label>
                                <input type="text" class="form-control" placeholder="Phone Number"
                                       aria-label="Phone Number" name="phoneNumber">
                            </div>
                            <div class="mb-3">
                                <label class="me-3 mb-1">Email: </label>
                                <input type="text" class="form-control" placeholder="Email"
                                       aria-label="Email" name="email">
                            </div>
                            <div class="mb-3">
                                <label class="me-3 mb-1">Gender: </label>
                                <select name="gender" id="addUserGender" class="form-select">
                                    <option value="true">Male</option>
                                    <option value="false">Female</option>
                                </select>
                            </div>
                            <div class="mb-3">
                                <label class="me-3 mb-1">Password: </label>
                                <input type="text" class="form-control" placeholder="Password"
                                       aria-label="Password" name="password">
                            </div>
                        </div>
                    </div>
                    <div class="mb-3">
                        <label class="me-3 mb-1">Member Type: </label>
                        <select id="addUserMemberType" name="memberTypeId" class="form-select">
                            <c:forEach var="type" items="${memberTypeList}">
                                <option value="${type.id}">
                                        ${type.name}
                                </option>
                            </c:forEach>
                        </select>
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


<!-- editUserModal -->
<div class="modal fade" id="editUserModal" tabindex="-1" aria-labelledby="editUserModalLabel"
     aria-hidden="true">
    <div class="modal-dialog modal-lg">
        <div class="modal-content">
            <div class="modal-header">
                <h1 class="modal-title fs-5" id="editUserModalLabel">Edit User</h1>
                <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
            </div>

            <form action="${pageContext.request.contextPath}/admin/users?action=updateUser" method="post">
                <div class="modal-body">
                    <div class="row g-3">
                        <div class="col">
                            <div class="mb-3">
                                <input hidden="hidden" name="id" id="editUserId">
                                <input hidden="hidden" name="accountId" id="editAccountId">
                                <input hidden="hidden" name="action" value="updateUser">
                                <label class="me-3 mb-1">Full Name: </label>
                                <input type="text" class="form-control" placeholder="Full name"
                                       aria-label="Full name" name="name" id="editUserFullName">
                            </div>
                            <div class="mb-3">
                                <label class="me-3 mb-1">Address: </label>
                                <input type="text" class="form-control" placeholder="Address"
                                       aria-label="Address" name="address" id="editUserAddress">
                            </div>
                            <div class="mb-3">
                                <label class="me-3 mb-1">Birthday: </label>
                                <input type="date" class="form-control" placeholder="Birthday"
                                       aria-label="Birthday" name="birthday" id="editUserBirthday">
                            </div>
                            <div class="mb-3">
                                <label class="me-3 mb-1">Username: </label>
                                <input type="text" class="form-control" placeholder="Username"
                                       aria-label="Username" name="username" id="editUserUsername">
                            </div>
                        </div>
                        <div class="col">
                            <div class="mb-3">
                                <label class="me-3 mb-1">Phone Number: </label>
                                <input type="text" class="form-control" placeholder="Phone Number"
                                       aria-label="Phone Number" name="phoneNumber" id="editUserPhoneNumber">
                            </div>
                            <div class="mb-3">
                                <label class="me-3 mb-1">Email: </label>
                                <input type="text" class="form-control" placeholder="Email"
                                       aria-label="Email" name="email" id="editUserEmail">
                            </div>
                            <div class="mb-3">
                                <label class="me-3 mb-1">Gender: </label>
                                <select name="gender" id="editUserGender" class="form-select">
                                    <option value="true" ${userInformation.gender ? "selected" : ""}>Male</option>
                                    <option value="false" ${!userInformation.gender ? "selected" : ""}>Female</option>
                                </select>
                            </div>
                            <div class="mb-3">
                                <label class="me-3 mb-1">Password: </label>
                                <input type="text" class="form-control" placeholder="Password"
                                       aria-label="Password" name="password" id="editUserPassword">
                            </div>
                        </div>
                    </div>
                    <div class="mb-3">
                        <label class="me-3 mb-1">Member Type: </label>
                        <select id="editUserMemberType" name="memberTypeId" class="form-select">
                            <c:forEach var="type" items="${memberTypeList}">
                                <option value="${type.id}"
                                        <c:if test="${type.id eq userInformation.memberTypeId}">
                                            selected
                                        </c:if>>
                                        ${type.name}
                                </option>
                            </c:forEach>

                        </select>
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


<!-- deleteUserModal -->
<div class="modal fade" id="deleteUserModal" tabindex="-1" aria-labelledby="deleteUserModalLabel"
     aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <h1 class="modal-title fs-5" id="deleteUserModalLabel">Delete User</h1>
                <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
            </div>
            <form action="${pageContext.request.contextPath}/admin/users?action=deleteUser" method="post">
                <div class="modal-body">
                    <p>Are you sure you want to delete this user?</p>
                    <input type="hidden" name="id" id="idUserDelete">
                </div>

                <div class="modal-footer">
                    <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Cancel</button>
                    <button type="submit" class="btn btn-danger">Confirm</button>
                </div>
            </form>
        </div>
    </div>
</div>

<c:if test="${not empty openAddSubscriberModal}">
    <script>
        // Gender dropdown
        var genderSelect = document.getElementById("addUserGender");
        genderSelect.value = "${userInformation.gender ? 'Male' : 'Female'}";

        // MemberType dropdown
        var memberTypeSelect = document.getElementById("addUserMemberType");
        memberTypeSelect.value = "${userInformation.memberTypeId}";

        // Mở modal
        var myModal = new bootstrap.Modal(document.getElementById('addUserModal'));
        myModal.show();
    </script>
</c:if>

<%--Bật modal edit khi có openEditModal == true--%>
<c:if test="${not empty openEditModal}">
    <script>
        document.getElementById("editUserId").value = "${userInformation.id}";
        document.getElementById("editUserFullName").value = "${userInformation.name}";
        document.getElementById("editUserEmail").value = "${userInformation.email}";
        document.getElementById("editUserBirthday").value = "${userInformation.birthday}";
        document.getElementById("editUserUsername").value = "${userInformation.username}";
        document.getElementById("editUserPhoneNumber").value = "${userInformation.phoneNumber}";
        document.getElementById("editUserAddress").value = "${userInformation.address}";
        document.getElementById("editUserPassword").value = "${userInformation.password}";
        document.getElementById("editAccountId").value = "${userInformation.accountId}";
        <%--document.getElementById("editUserMemberType").value = "${userInformation.memberTypeId}";--%>

        <c:choose>
        <c:when test="${userInformation.gender}">
        document.getElementById("editUserGender").value = "true";
        </c:when>
        <c:otherwise>
        document.getElementById("editUserGender").value = "false";
        </c:otherwise>
        </c:choose>

        var myModal = new bootstrap.Modal(document.getElementById('editUserModal'));
        myModal.show();
    </script>
</c:if>


<c:if test="${not empty toastMessage}">
    <div class="toast-container position-fixed top-0 end-0 p-3">
        <div id="liveToast" class="toast align-items-center text-bg-${toastType} border-0 show" role="alert">
            <div class="d-flex">
                <div class="toast-body">
                        ${toastMessage}
                </div>
                <button type="button" class="btn-close btn-close-white me-2 m-auto" data-bs-dismiss="toast"></button>
            </div>
        </div>
    </div>

    <script>
        document.addEventListener('DOMContentLoaded', function () {
            var toastEl = document.getElementById('liveToast');
            var toast = new bootstrap.Toast(toastEl, {delay: 3000});
            toast.show();
        });
    </script>
</c:if>
</body>
</html>