class UsersController < ApplicationController
  def new
    @user = User.new
  end

  def create
    @user = User.new(user_param)
    if @user.save
      flash[:notice] = "Registration Success!!"
      redirect_to root_path
    else
      render 'new'
    end
  end

  private

  def user_param
    params.require(:user).permit(:username, :password)
  end

end