module SessionsHelper
  def sign_in?
    if current_user.nil?
      false
    else
      true
    end
  end

  def log_out
    session.delete(:user_id)
    @current_user = nil
  end

  def log_in(user)
    session[:user_id] = user.id
  end

  def current_user
    current_user ||= User.find_by(id: session[:user_id])
    current_user
  end
end
