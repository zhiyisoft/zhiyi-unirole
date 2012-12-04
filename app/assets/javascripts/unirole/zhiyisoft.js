$(function(){
    $("section input").bind("change",function(){
	ajax_update($(this))
    }).bind("click",function(){
	if ($(this).attr("readonly") == "readonly")
	{
	    $(this).removeAttr("readonly")
	}

    }).mouseout(function(){
	$(this).attr("readonly","readonly")
    })
})
function AjaxStart(obj){}
function AjaxEnd(obj){}