$(function () {
    $(".preeti").on("change", function () {
        var text = $(this).val();
        $(this).val(convert(text, all_rules['preeti']));
    });

    $(".pcs-nepali").on("change", function () {
        var text = $(this).val();
        $(this).val(convert(text, all_rules['pcs nepali']));
    });

    $(".preeti").on("focusout", function () {
        var text = $(this).val();
        $(this).val(convert(text, all_rules['preeti']));
    });

   $('.select2').select2({
       theme: 'bootstrap'
   });


});