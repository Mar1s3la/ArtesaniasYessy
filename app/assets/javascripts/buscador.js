/**
 * Created by Rodrigo on 30/06/2016.
 */
function doSearch() {
    var dataTable = document.getElementById('dataTable');
    var searchText = document.getElementById('searchTerm').value.toLowerCase();

    for (var i = 1; i < dataTable.rows.length; i++) {
        var cellsOfRow = dataTable.rows[i].getElementsByTagName('td');
        var found = false;

        for (var j = 0; j < cellsOfRow.length && !found; j++) {
            var compareWith = cellsOfRow[j].innerHTML.toLowerCase();

            if (searchText.length == 0 || (compareWith.indexOf(searchText) > -1)) {
                found = true;
            }
        }
        if (found) {
            dataTable.rows[i].style.display = '';
        } else {
            dataTable.rows[i].style.display = 'none';
        }
    }
}

$(document).ready(function() {
    setTimeout(function() {
        $(".notice").fadeOut(1500);
    },5000);
});

$(document).ready(function() {
    setTimeout(function() {
        $(".alert").fadeOut(1500);
    },5000);
});

$(function () {
    $('#slider div:gt(0)').hide();
    setInterval(function () {
        $('#slider div:first-child').fadeOut(1000)
            .next('div').fadeIn(1000)
            .end().appendTo('#slider');
    }, 4000);
});