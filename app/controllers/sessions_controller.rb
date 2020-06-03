class SessionsController < ApplicationController
  def new; end

  def create
    @user = User.find_by(name: params[:session][:name])
    if @user
      log_in @user
      redirect_to root_url
    else
      @error = true
      render :new
    end
  end

  def destroy
    log_out
    redirect_to root_url
  end
end
