var getLinks = function(){
    $.ajax({
	method: "GET",
	url: "/api/v1/links",
	dataType: "json",
	success: displayLinks
    })
}

var displayLink = function(link){
    if(link.read === true){
	$(".link-list").append("<div class='link link-read' data-title="+link.title+"><div>" + link.title + "</div><a href="+link.address+" target='_blank'> " + link.address + "</a><br /><button type='button' class='button-read' data-id=" + link.id + ">Mark as Unread</button><a href=" + "/links/" + link.id + " type='button' class='button-edit' data-id=" + link.id + ">Edit</a></div>")
    } else {
	$(".link-list").append("<div class='link link-unread' data-title="+link.title+"><div>" + link.title + "</div><a href="+link.address+" target='_blank'> " + link.address + "</a><br /><button type='button' class='button-unread' data-id=" + link.id + ">Mark as Read</button><a href=" + "/links/" + link.id + " type='button' class='button-edit' data-id=" + link.id + ">Edit</a></div>")
    }
};

var displayLinks = function(links){
    $(".link-list").empty();
    links.forEach(function(link){
	displayLink(link)
    })
}

var loadLinks = function(){
    $.ajax({
	method: "GET",
	url: "/api/v1/links",
	dataType: "json",
	success: displayLinks
    })
}

$(document).ready(function(){
    if (window.location.pathname === "/links") { loadLinks(); }
    alphabetize();
    filter();
    search();
    markRead();
    markUnread();
    saveLink();
});
