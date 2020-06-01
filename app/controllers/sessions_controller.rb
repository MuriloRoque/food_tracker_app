class SessionsController < ApplicationController
  def new; end

  def create
    @user = User.find_by(name: params[:session][:name])
    log_in @user if @user
    redirect_to root_url
  end

  def destroy
    log_out
    redirect_to root_url
  end
end
