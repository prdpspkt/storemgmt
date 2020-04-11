$(function () {
    $(".preeti").on("change", function () {
        var text = $(this).val();
        $(this).val(convert(text, all_rules['preeti']));
    });

    $(".pcs-nepali").on("change", function () {
        var text = $(this).val();
        $(this).val(convert(text, all_rules['pcs nepali']));
    });

    $(".preeti").on("blur", function () {
        var text = $(this).val();
        $(this).val(convert(text, all_rules['preeti']));
    });

   $('select').select2({
       theme: 'bootstrap'
   });


});