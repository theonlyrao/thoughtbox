$(document).ready(function(){
    $(".button").click(function(){
	var title = $("#title").val();
	var address = $("#address").val();

	let displayLink = function(link){
	    $(".link-list").prepend("<div>" + link.title + ", " + link.address + "</div>")
	};
	
	$.ajax({
	    type: "POST",
	    url: "/api/v1/links",
	    data: { link: { title: title, address: address } },
	    dataType: "json",
	    success: displayLink
	})    
    });
});
