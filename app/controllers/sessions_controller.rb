class SessionsController < ApplicationController
  def new
  end

  def create
    user = User.find_by(email: params[:session][:email].downcase)
    if user && user.authenticate(params[:session][:password])
      session[:user_id] = user.id
      flash[:success] = "You are logged in"
      redirect_to user_path(user)
    else
      flash[:danger] = "check your password or email"
      render 'new'
    end
  end

  def destroy
    session[user_id] = nil
    flash[:sucess] = "You are logged out"
    redirect_to root_path
  end
end
