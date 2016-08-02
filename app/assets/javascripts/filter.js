function filter(){
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
}
