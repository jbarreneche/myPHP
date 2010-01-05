class UsersController < InheritedResources::Base
  actions :create, :new

  def create
    create! { root_url }
    session[:authlogic_id] = @user.id if @user
  end

end

