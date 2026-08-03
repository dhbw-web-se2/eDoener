(function () {
    var checkboxes = document.querySelectorAll('input[name="allergen"]');
    var cards = document.querySelectorAll('.menu-card');
    var categories = document.querySelectorAll('.menu-category');
    var clearButton = document.getElementById('clearAllergenFilter');
    var result = document.getElementById('filterResult');
    var noResults = document.getElementById('noMenuResults');

    function selectedAllergens() {
        var selected = [];

        for (var i = 0; i < checkboxes.length; i += 1) {
            if (checkboxes[i].checked) {
                selected.push(checkboxes[i].value.toLowerCase());
            }
        }

        return selected;
    }

    function applyFilter() {
        var selected = selectedAllergens();
        var visibleCards = 0;

        for (var i = 0; i < cards.length; i += 1) {
            var allergens = (cards[i].getAttribute('data-allergens') || '').toLowerCase();
            var hideCard = false;

            for (var j = 0; j < selected.length; j += 1) {
                if (allergens.indexOf(selected[j]) !== -1) {
                    hideCard = true;
                    break;
                }
            }

            cards[i].classList.toggle('is-filtered', hideCard);
            if (!hideCard) {
                visibleCards += 1;
            }
        }

        for (var categoryIndex = 0; categoryIndex < categories.length; categoryIndex += 1) {
            var visibleInCategory = categories[categoryIndex].querySelector('.menu-card:not(.is-filtered)');
            categories[categoryIndex].classList.toggle('is-empty', !visibleInCategory);
        }

        if (result) {
            result.textContent = selected.length === 0
                    ? cards.length + ' Produkte sichtbar'
                    : visibleCards + ' passende Produkte';
        }

        if (noResults) {
            noResults.hidden = visibleCards !== 0;
        }
    }

    for (var i = 0; i < checkboxes.length; i += 1) {
        checkboxes[i].addEventListener('change', applyFilter);
    }

    if (clearButton) {
        clearButton.addEventListener('click', function () {
            for (var i = 0; i < checkboxes.length; i += 1) {
                checkboxes[i].checked = false;
            }
            applyFilter();
        });
    }

    applyFilter();
})();
