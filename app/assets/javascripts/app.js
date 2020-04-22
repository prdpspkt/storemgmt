$(document).on('turbolinks:load', function () {
    $('.select2').select2({
        theme: 'bootstrap'
    });

    $(".data-table").dataTable();
    $(".date-picker").nepaliDatePicker();
    $(".data-table-no-sort").dataTable({
        ordering: false
    });

});