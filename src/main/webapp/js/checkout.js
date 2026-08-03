(function () {
    var form = document.getElementById("checkoutForm");
    if (!form) {
        return;
    }

    var deliveryType = document.getElementById("deliveryType");
    var addressFields = document.getElementById("addressFields");
    var addressInputs = addressFields ? addressFields.querySelectorAll("input") : [];

    function updateAddressFields() {
        var isPickup = deliveryType && deliveryType.value === "pickup";

        if (addressFields) {
            addressFields.hidden = isPickup;
        }

        for (var i = 0; i < addressInputs.length; i += 1) {
            addressInputs[i].required = !isPickup;
            addressInputs[i].disabled = isPickup;
        }
    }

    if (deliveryType) {
        deliveryType.addEventListener("change", updateAddressFields);
        updateAddressFields();
    }

    form.addEventListener("submit", function (event) {
        if (deliveryType && deliveryType.value === "pickup") {
            return;
        }

        var postalCode = document.getElementById("postalCode");
        var value = postalCode ? postalCode.value.trim() : "";

        if (!/^\d{5}$/.test(value)) {
            event.preventDefault();
            alert("Bitte eine gültige fünfstellige PLZ eingeben.");
        }
    });
})();
