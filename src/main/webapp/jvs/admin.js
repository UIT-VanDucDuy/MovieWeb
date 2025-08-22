document.addEventListener("DOMContentLoaded", function () {
    const menuItems = document.querySelectorAll("#menu .list-group-item");
    const tables = document.querySelectorAll(".table");

    menuItems.forEach(item => {
        item.addEventListener("click", function () {
            // Ẩn tất cả các bảng
            tables.forEach(table => table.classList.add("d-none"));

            // Lấy id bảng từ thuộc tính data-table và hiển thị
            const tableId = this.getAttribute("data-table");
            document.getElementById(tableId).classList.remove("d-none");

            // Đánh dấu item đang chọn
            menuItems.forEach(i => i.classList.remove("active"));
            this.classList.add("active");
        });
    });
});

// private String name;
// private boolean gender;
// private Date birthday;
// private String address;
// private String phoneNumber;
// private int accountId;
// '${subscriber.name}', '${subscriber.gender}', '${subscriber.birthday}', '${subscriber.gender}', '${subscriber.phoneNumber}'

function updateSubscriber(id) {
    document.getElementById("inputSubscriberName").value = name;
    document.getElementById("inputSubscriberGender").value = gender;
    document.getElementById("inputSubscriberBirthday").value = birthday;
    document.getElementById("inputSubscriberAddress").value = address;
    document.getElementById("inputSubscriberPhoneNumber").value = phoneNumber;
}