class UsersController < ApplicationController
  def new
    @authlogic = User.new
  end
  
  def create
    @authlogic = User.new(params[:user])
    if @authlogic.save
      session[:authlogic_id] = @authlogic.id
      flash[:notice] = "Thank you for signing up! You are now logged in."
      redirect_to root_url
    else
      render :action => 'new'
    end
  end
end
