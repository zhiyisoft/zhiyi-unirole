$('<%= j render @user %>').appendTo('#users').hide().fadeIn();
$("#new_user form")[0].reset();