function saveLink(){
    $(".button").click(function(){
	var title = $("#title").val();
	var address = $("#address").val();

	
	if(( address.substring(0, 11) === "http://www." || address.substring(0, 12) === "https://www." ) && (address.substring(address.length - 4 ) === ".com" || address.substring(address.length - 3) === ".io")){
	    $.ajax({
		type: "POST",
		url: "/api/v1/links",
		data: { link: { title: title, address: address } },
		dataType: "json",
		success: displayLink
	    })    
	} else {
	    $(".warning").replaceWith("Submit complete url, including http://www...")
	}
    });
}
