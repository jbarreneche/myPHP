class SessionsController < ResourceController::Base
  #Create configuration    
  create.flash "Logged in successfully."
  create.failure.flash "Invalid login or password."
  create.wants.html { redirect_to_target_or_default(root_url) }
  create.after do
    session[:authlogic_id] = @user.id
  end

  
  def destroy
    session[:authlogic_id] = nil
    flash[:notice] = "You have been logged out."
    redirect_to root_url
  end
  
  private
  def object
    @user = User.authenticate(params[:login], params[:password])
  end

  def model_name
    'user_session'
  end
end
