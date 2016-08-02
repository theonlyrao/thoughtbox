function alphabetize(){
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
}
