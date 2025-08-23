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
<%--<c:if test="${sessionScope.account.memberTypeId != 0}">--%>
<%--    <c:redirect url="/Home"></c:redirect>--%>
<%--</c:if>--%>
<c:import url="/layout/navbar.jsp"></c:import>
<div class="main mt-4 ">
    <h1 class="title">Quản lý trang web</h1>

    <div class="row">
        <div class="col-lg-3">
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
                            <div class="d-flex gap-3 align-items-start">
                                <form action="/Admin?action=showEditForm" method="post">
                                    <input type="hidden" name="id" value="${subscriber.id}">
                                    <button type="submit" class="btn btn-primary btn-sm">
                                        Edit
                                    </button>
                                </form>
                                <button onclick="deleteSubscriber(${subscriber.id})" type="button"
                                        class="btn btn-danger btn-sm" data-bs-toggle="modal"
                                        data-bs-target="#deleteSubscriberModal">
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

<!-- editSubscriberModal -->
<div class="modal fade" id="editSubscriberModal" tabindex="-1" aria-labelledby="editSubscriberModalLabel"
     aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <h1 class="modal-title fs-5" id="editSubscriberModalLabel">Update Subscriber</h1>
                <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
            </div>

            <form action="/Admin?action=updateSubscriber" method="post">
                <div class="modal-body">
                    <div class="mb-3">
                        <input hidden="hidden" name="id" id="inputSubscriberId">
                        <input hidden="hidden" name="accountId" id="inputSubscriberAccountId">
                        <label class="form-label">Full Name</label>
                        <input type="text" class="form-control" id="inputSubscriberName" name="name">
                    </div>
                    <div class="mb-3">
                        <label class="form-label">Gender</label>
                        <select id="inputSubscriberGender" name="gender" class="form-select">
                            <c:forEach var="g" items="${genderList}">
                                <option value="${g}"
                                        <c:if test="${(subscriberInformation.gender and g == 'Nam') or (not subscriberInformation.gender and g == 'Nữ')}">
                                            selected
                                        </c:if>>
                                        ${g}
                                </option>
                            </c:forEach>
                        </select>
                    </div>
                    <div class="mb-3">
                        <label class="form-label">Birthday</label>
                        <input type="date" class="form-control" id="inputSubscriberBirthday" name="birthday">
                    </div>
                    <div class="mb-3">
                        <label class="form-label">Phone Number</label>
                        <input type="text" class="form-control" id="inputSubscriberPhoneNumber" name="phoneNumber">
                    </div>
                    <div class="mb-3">
                        <label class="form-label">Address</label>
                        <input type="text" class="form-control" id="inputSubscriberAddress" name="address">
                    </div>
                </div>

                <div class="modal-footer">
                    <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Close</button>
                    <button type="submit" class="btn btn-primary">Save changes</button>
                </div>
            </form>

        </div>
    </div>
</div>

<!-- deleteSubscriberModal -->
<div class="modal fade" id="deleteSubscriberModal" tabindex="-1" aria-labelledby="deleteSubscriberModalLabel"
     aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <h1 class="modal-title fs-5" id="deleteSubscriberModalLabel">Delete Subscriber</h1>
                <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
            </div>
            <form action="/Admin?action=deleteSubscriber" method="post">
                <div class="modal-body">
                    <p>Are you sure you want to delete this subscriber?</p>
                    <input type="hidden" name="id" id="idSubscriberDelete">
                </div>

                <div class="modal-footer">
                    <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Cancel</button>
                    <button type="submit" class="btn btn-danger">Confirm</button>
                </div>
            </form>
        </div>
    </div>
</div>

<%--Bật modal edit khi có openEditModal == true--%>
<c:if test="${not empty openEditModal}">
    <script>
        document.getElementById("inputSubscriberId").value = "${subscriberInformation.id}";
        document.getElementById("inputSubscriberAccountId").value = "${subscriberInformation.accountId}";
        document.getElementById("inputSubscriberName").value = "${subscriberInformation.name}";
        document.getElementById("inputSubscriberBirthday").value = "${subscriberInformation.birthday}";
        document.getElementById("inputSubscriberAddress").value = "${subscriberInformation.address}";
        document.getElementById("inputSubscriberPhoneNumber").value = "${subscriberInformation.phoneNumber}";

        <c:choose>
        <c:when test="${subscriberInformation.gender}">
        document.getElementById("inputSubscriberGender").value = "Male";
        </c:when>
        <c:otherwise>
        document.getElementById("inputSubscriberGender").value = "Female";
        </c:otherwise>
        </c:choose>

        var myModal = new bootstrap.Modal(document.getElementById('editSubscriberModal'));
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

