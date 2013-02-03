$("#<%= dom_id @user %>").replaceWith("<%= j render @user %>");
<% @user = Unirole::User.new %>
$("#new_user > form").replaceWith("<%= j render "form" %>")
$("#new_user > form")[0].reset();