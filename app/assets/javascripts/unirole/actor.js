function get_membership(){
    return $.getJSON("membership.json")
}
function edit_actor_for_membership(){
    membership = get_membership();
    for (var i=0;i++;i<membership.length ){    
	alert(membership[i])
    }
}