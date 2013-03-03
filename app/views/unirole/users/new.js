$("#work-area").html("<%= j render_cell 'unirole/user', :new, user: @user %>");
$("#dialog").modal();
