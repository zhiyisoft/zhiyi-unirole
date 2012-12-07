//---身份管理-----------------------------
function add_membership(organ_id){
    $.getJSON("memberships.json",function(result){
    var html=""
      if (result.length>0){
	  for( i in result){
	      html +="<input type='checkbox' name='membership' value='"+result[i]._id+"' />"+result[i].name;
	  }
      html +="<input type='button' value='保存' onclick='save_membership($(this))' /> "
      }else{
	   html="get error!"
      }
      $("#"+organ_id+"_edit_membership").html(html)
  })
}
function save_membership(obj){
    organ_id = obj.parent("span").attr("id").split("_edit")[0]
    
    obj.parent("span").children("input[type=checkbox]:checked").each(function(){
      
      $.post("actors.json",{membership_id: $(this).val(),organ_id: organ_id},function(){})
    
    },{},location.reload())
}

//---用户管理-----------------------------

function edit_user(actor_id,actor){
    tipsWindown(actor,"iframe:actors/"+actor_id+"/add_user","400","250","true","","true","")
}
/*
function edit_actor_for_membership(organ_id){
    $.getJSON("memberships.json",function(result){
    var html=""
      if (result.length>0){	   
	  for( i in result){
	      html +="<input type='checkbox' name='membership' value='"+result[i]._id+"' />"+result[i].name;
	  }
	  
      }else{
	  html="获取身份列表失败，请重试！"
      }
      $("#"+organ_id+"_edit_actor_for_membership").html(html)
  })
}



function show_windown(uri,title){
    tipsWindown(title,uri,"400","250","true","","true","")
}
*/