$(document).ready(function(){
    $("#alphabetize").click(function(){
	var $link = $(".link").toArray();

	var mapped = $link.map(function(link, i) {
	    return { index: i, value: link.dataset.title };
	})

	mapped.sort(function(a, b) {
	    return +(a.value > b.value) || +(a.value === b.value) - 1;
	});

	var alphabetical = mapped.map(function(el){
	    return $link[el.index];
	});

	$(".link").remove();
	$(".link-list").append(alphabetical);
    })
    
    $('input[type=radio][name=read]').change(function() {
        if (this.value == 'true') {
	    $(".link-list").children().show();
	    $(".link-list .link-unread").hide();
        }
        else if (this.value == 'false') {
	    $(".link-list").children().show();	    
	    $(".link-list .link-read").hide();
        }
	else if (this.value == "all"){
	    getLinks();
	}
    });
    
    $("#search").keyup(function(){
	var text = $(this).val();
	var results = $(".link:contains(" + text + ")");
	$(".link-list .link").hide();
	results.show();
    })

    $(".link-list").delegate(".button-read", "click", function(){
	console.log("clicked read")
	var link_id = this.dataset.id
	$.ajax({
	    type: "PATCH",
	    url: "/api/v1/links/" + link_id,
	    data: { link: { read: false } },
	    dataType: "json",
	    success: getLinks
	})    
	
    })

    $(".link-list").delegate(".button-unread", "click", function(){
	console.log("clicked unread")
	var link_id = this.dataset.id
	$.ajax({
	    type: "PATCH",
	    url: "/api/v1/links/" + link_id,
	    data: { link: { read: true } },
	    dataType: "json",
	    success: getLinks
	});
    })
    
    var displayLink = function(link){
	if(link.read === true){
	    $(".link-list").append("<div class='link link-read' data-title="+link.title+"><div>" + link.title + "</div> " + link.address + "<br /><button type='button' class='button-read' data-id=" + link.id + ">Mark as Unread</button><a href=" + "/links/" + link.id + " type='button' class='button-edit' data-id=" + link.id + ">Edit</a></div>")
	} else {
	    $(".link-list").append("<div class='link link-unread' data-title="+link.title+"><div>" + link.title + "</div> " + link.address + "<br /><button type='button' class='button-unread' data-id=" + link.id + ">Mark as Read</button><a href=" + "/links/" + link.id + " type='button' class='button-edit' data-id=" + link.id + ">Edit</a></div>")
	}
    };

    var displayLinks = function(links){
	$(".link-list").empty();
	links.forEach(function(link){
	    displayLink(link)
	})
    }

    var getLinks = function(){
	$.ajax({
	    method: "GET",
	    url: "/api/v1/links",
	    dataType: "json",
	    success: displayLinks
	})
    }
    
    $.ajax({
	method: "GET",
	url: "/api/v1/links",
	dataType: "json",
	success: displayLinks
    })
    

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

});
