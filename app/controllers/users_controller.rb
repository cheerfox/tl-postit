class UsersController < ApplicationController
  before_action :require_user, only: [:show, :edit, :update]
  before_action :set_user, only: [:show, :edit, :update]
  before_action :requrie_same_user, only: [:edit, :update]

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

  def edit
  end

  def update
    if @user.update(user_param)
      flash[:notice] = "Update Profile Successfully!!"
      redirect_to user_path(@user)
    else
      render 'edit'
    end
  end

  def show
  end

  private

  def user_param
    params.require(:user).permit(:username, :password)
  end

  def set_user
    @user = User.find(params[:id])
  end

  def requrie_same_user
    if @user != current_user
      flash[:error] = "You can't do this"
      redirect_to root_path
    end
  end

end