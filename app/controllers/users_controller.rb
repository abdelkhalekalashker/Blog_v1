class UsersController < ApplicationController
  def index
    @users = User.all
  end

  def show  
    @user = User.last
  end

  def update
    @user = User.last
    if @user.update(user_params)
      flash[:notice] = "user was updated"
      redirect_to user_path(@user)
    else
      flash[:notice] = "user was not updated"
      render edit
    end
  end

  def new
    @user = User.new
  end

  def edit
    @user = User.last
  end

  def create
    
    @user = User.new(user_params)
    if @user.save!
      flash[:notice] = "user was created"
      redirect_to root_path
    else
      flash[:notice] = "user was not created"
      render new
    end
  end

  def destroy
    @user.destroy
    flash[:notice] = "user was deleted"
    redirect_to root_path

  end

  private

  def user_params
    params.require(:user).permit(:email,:username,:password)

  end

  def set_user
      @user = User.find(params[:id])
  end

end
