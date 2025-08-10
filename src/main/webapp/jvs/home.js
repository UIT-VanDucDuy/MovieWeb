document.addEventListener("DOMContentLoaded", function () {
    const scrollAmount = 260;

    document.querySelectorAll(".scroll-next").forEach(button => {
        button.addEventListener("click", () => {
            const targetId = button.getAttribute("data-target");
            const container = document.querySelector(`#${targetId}`);
            if (container) {
                // Nếu đang ở cuối -> quay về đầu
                if (container.scrollLeft + container.clientWidth >= container.scrollWidth - 5) {
                    container.scrollLeft = 0;
                } else {
                    container.scrollLeft += scrollAmount;
                }
            }
        });
    });

    document.querySelectorAll(".scroll-prev").forEach(button => {
        button.addEventListener("click", () => {
            const targetId = button.getAttribute("data-target");
            const container = document.querySelector(`#${targetId}`);
            if (container) container.scrollLeft -= scrollAmount;
        });
    });
});