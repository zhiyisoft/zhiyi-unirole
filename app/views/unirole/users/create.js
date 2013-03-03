$('<%= j render_cell "unirole/user", :show, user: @user %>').appendTo('#users').hide().fadeIn();
$("#working_area form")[0].reset();
