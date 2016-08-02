function markRead(){
    $(".link-list").delegate(".button-read", "click", function(){
	var link_id = this.dataset.id
	$.ajax({
	    type: "PATCH",
	    url: "/api/v1/links/" + link_id,
	    data: { link: { read: false } },
	    dataType: "json",
	    success: getLinks
	})    
	
    })
}
