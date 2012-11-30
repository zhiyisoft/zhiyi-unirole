function get_parent(id){
    $.getJSON("organs/get_parent",{id: id},function(result){
	var html=""
	html +="<option value=''>无</option>"
	$("select[name=organ\\[parent_id\\]]").html(html)
	if (result.length > 0){
	    for( i in result ){
		html+="<option value="+result[i]._id+">"+result[i].name+"</option>"
	    }
	    $("select[name=organ\\[parent_id\\]]").html(html)
	}
  })
}