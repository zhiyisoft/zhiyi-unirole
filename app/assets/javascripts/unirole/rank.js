$(function(){
    $(".data_list input").bind("change",function(){

	rank_ajax_update($(this))

    }).bind("click",function(){

	if ($(this).attr("readonly") == "readonly")
	{
	    $(this).removeAttr("readonly")
	}

    }).mouseout(function(){

	$(this).attr("readonly","readonly")

    })
})
function rank_ajax_update(obj){
    $.ajax({
	type: "put",
	url: "rank/"+obj.parent("td").parent("tr").attr("id"),
	data: {key: obj.attr("name"), value: obj.val()},
	dataType: "json",
	beforeSend: AjaxStart(obj),
	complete: AjaxEnd(obj),
	success:function(result){
		alert(result.desc)
	}
    })
}
function AjaxStart(obj){

}
function AjaxEnd(obj){

}