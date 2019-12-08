$(function(){
	$(".preeti").on("change", function(){
		var text = $(this).val();
		$(this).val(convert(text, all_rules['preeti']));
	});

    $(".pcs-nepali").on("change", function(){
        var text = $(this).val();
        $(this).val(convert(text, all_rules['pcs nepali']));
    });
    $("#office_purchase_entry_item_item_classification_no").on("change", function () {
        if($(this).val() == 47){
            $("#oneirt-items").show();
        }
        else{
            $("#oneirt-items").hide();
        }
    });

});