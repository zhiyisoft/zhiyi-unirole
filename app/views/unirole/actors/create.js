$("#<%= dom_id @user %> .actors").html("<%= j render_cell 'unirole/actor', :display, user: @user %>");
