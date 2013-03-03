$("#<%= dom_id @user %> .actors").replaceWith("<%= j render_cell 'unirole/actor', :display_with_delete, user: @user %>");
