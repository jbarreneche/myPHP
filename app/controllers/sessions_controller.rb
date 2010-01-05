class SessionsController < InheritedResources::Base
  actions :create, :new
  defaults :resource_class => UserSession
  def create
    create! do |success, failure|
      success.html { redirect_to_target_or_default(root_url) }
    end
    session[:authlogic_id] = @user.id if @user
  end

  def destroy
    flash[:notice] = "You have been logged out."
    session[:authlogic_id] = nil
    redirect_to root_url
  end

  private
  def resource
    @user ||= User.authenticate(params[:login], params[:password])
  end

end

