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
<!-- addUserModal -->
<div class="modal fade" id="addUserModal" tabindex="-1" aria-labelledby="addUserModalLabel"
     aria-hidden="true">
    <div class="modal-dialog modal-lg">
        <div class="modal-content">
            <div class="modal-header">
                <h1 class="modal-title fs-5" id="addUserModalLabel">Add User</h1>
                <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
            </div>
            <form action="/Admin?action=addUser" method="post">
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

            <form action="/Admin/?action=updateUser" method="post">
                <div class="modal-body">
                    <div class="row g-3">
                        <div class="col">
                            <div class="mb-3">
                                <input hidden="hidden" name="id" id="editUserId">
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
                        <select id="editUserMemberType" name="memberTypeId" class="form-select" >
                            <c:forEach var="type" items="${memberTypeList}">
                                <option value="${type.id}"
                                 ${not empty userInformation and not empty userInformation.memberTypeId
                                    and type.id == userInformation.memberTypeId ? 'selected' : ''}>
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
            <form action="/Admin?action=deleteUser" method="post">
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
            var toast = new bootstrap.Toast(toastEl, {delay: 3000}); // 3s
            toast.show();
        });
    </script>
</c:if>


</body>
</html>

