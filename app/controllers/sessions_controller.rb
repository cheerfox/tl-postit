class SessionsController < ApplicationController
  def new
  end

  def create
    user = User.find_by(username: params[:username])
    if user && user.authenticate(params[:password])
      flash[:notice] = "login sueccessfully!!"
      session[:user_id] = user.id
      redirect_to root_path
    else
      flash[:error] = "Have some errors in your username or password"
      render 'new'
    end
  end

  def destroy
    session[:user_id] = nil
    flash[:notice] = 'Logout sueccessfully!!'
    redirect_to root_path
  end
end