function search(){
    $("#search").keyup(function(){
	var text = $(this).val();
	var results = $(".link:contains(" + text + ")");
	$(".link-list .link").hide();
	results.show();
    })
}
