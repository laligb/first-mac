class UsersController < ApplicationController

  def index
    @user = User.all
  end
  def show
    @user = User.find(params[:id])
    # debugger
  end
  def new
    @user = User.new
  end
  def create
    @user = User.new(params[user_params])
    if @user.save
      reset_session
      log_in @user
      flash[:success] = 'Welcome to Sample App!'
      redirect_to @user
    else
      render 'new'
    end
  end

  private

  def user_params
    params.require(:user).permit(:name, :email, :password, :password_confirmation)
  end
end
