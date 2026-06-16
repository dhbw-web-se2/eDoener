(function () {
    var form = document.getElementById("checkoutForm");
    if (!form) {
        return;
    }

    form.addEventListener("submit", function (event) {
        var postalCode = document.getElementById("postalCode");
        var value = postalCode ? postalCode.value.trim() : "";

        if (!/^\d{5}$/.test(value)) {
            event.preventDefault();
            alert("Bitte eine gueltige 5-stellige PLZ eingeben.");
        }
    });
})();

