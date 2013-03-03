$("#<%= dom_id @user %> .actors").html("<%= j render_cell 'unirole/actor', :display_with_delete, user: @user %>");
