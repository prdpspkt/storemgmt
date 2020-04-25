$(document).on('page:load', function () {
    $('.select2').select2({
        theme: 'bootstrap'
    });

    $(".data-table").dataTable();
    $(".date-picker").nepaliDatePicker();
    $(".data-table-no-sort").dataTable({
        ordering: false
    });
    $(".progress_bar").hide();

    $("form").on("submit", function(){
        $(".progress_bar").show();
    });

});