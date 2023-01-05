let courses_delete_form = document.getElementById('courses-delete-form');
courses_delete_form.addEventListener('submit', function (event) {
    if (!confirm("Are you sure you would like to delete the selected record(s)?")) {
        event.preventDefault();
    }
});
