$(document).on('turbolinks:load', function () {
    $('.select2').select2({
        theme: 'bootstrap'
    });

    $(".data-table").dataTable({
        "pageLength": 50
    });
    $(".date-picker").nepaliDatePicker();

    $(".progress_bar").hide();

    $("form").on("submit", function () {
        $(".progress_bar").show();
    });

    $(".load-progress-bar").on("click", function () {
        $(".progress_bar").show();
    });

});