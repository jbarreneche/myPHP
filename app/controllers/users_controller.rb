class UsersController < ResourceController::Base

  create.after  { session[:authlogic_id] = @user.id }
  create.flash "Thank you for signing up! You are now logged in."
  create.wants.html {redirect_to root_url}
end
