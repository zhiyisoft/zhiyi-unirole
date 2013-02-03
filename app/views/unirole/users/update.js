$("#<%= dom_id @user %>").replaceWith("<%= j render @user %>");
<% @user = Unirole::User.new %>
$("#working_area > form").replaceWith("<%= j render "form" %>")
$("#working_area > form")[0].reset();