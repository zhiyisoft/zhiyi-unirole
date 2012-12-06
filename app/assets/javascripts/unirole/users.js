function ajax_update(obj){
    $.ajax({
	type: "put",
	url: "users/"+obj.parent("td").parent("tr").attr("id"),
	data: {key: obj.attr("name"), value: obj.val()},
	dataType: "json",
	beforeSend: AjaxStart(obj),
	complete: AjaxEnd(obj),
	success:function(result){
		alert(result.desc)
	}
    })
}



