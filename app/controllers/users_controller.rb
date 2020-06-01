class UsersController < ApplicationController
  def create
    @user = User.new(user_params)
    if @user.save
      log_in(@user)
      redirect_to root_path
    else
      render :new
    end
  end

  def new
    @user = User.new
  end

  def show
    if sign_in?
      @user = current_user
      @total = user_injection
    else
      @user = nil
    end
  end

  private

  def user_params
    params.require(:user).permit(:name, :age, :gender, :weight, :height, :activity, :email)
  end
end
