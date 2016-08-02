function markUnread(){
    $(".link-list").delegate(".button-unread", "click", function(){
	var link_id = this.dataset.id
	$.ajax({
	    type: "PATCH",
	    url: "/api/v1/links/" + link_id,
	    data: { link: { read: true } },
	    dataType: "json",
	    success: getLinks
	});
    })
}
