class SessionsController < ApplicationController

  def new
    @user = User.new
  end

  def create
    user = User.find_by_email(params[:email])
    if user && user.authenticate(params[:password])
      session[:user_id] = user.id
      redirect_to root_path, flash[:notice] = "Welcome back"
    else
      flash[:notice] = "Invalid email or password"
      render 'new'
    end
  end

  def destroy
    @_current_user = session[:user_id] = nil
    flash[:notice] = "Come back soon"
    redirect_to questions_path
  end


end
