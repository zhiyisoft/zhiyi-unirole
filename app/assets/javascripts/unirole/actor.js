function save_actor_for_membership(obj){
    organ_id = obj.parent("span").attr("id").split("_edit")[0]
    obj.parent("span").children("input[type=checkbox]:checked").each(function(){
	$.post("actor.json",{membership_id: $(this).val(),organ_id: organ_id},function(result){

	})
    })


}

function edit_actor_for_membership(organ_id){
    $.getJSON("membership.json",function(result){
    var html=""
      if (result.length>0){	   
	  for( i in result){
	      html +="<input type='checkbox' name='membership' value='"+result[i]._id+"' />"+result[i].name;
	  }
	      html +="<input type='button' value='保存' onclick='save_actor_for_membership($(this))'/>"
	  
      }else{
	  html="获取身份列表失败，请重试！"
      }
      $("#"+organ_id+"_edit_actor_for_membership").html(html)
  })
}

function close_windown(){
    parent.closeWindown();
}
function edit_actor_for_user(actor_id){
    tipsWindown("jquery 弹出层","url:actor/add_user","400","250","true","","true","")
//   $.getJSON('user.json',function(){
	
  //  })
}