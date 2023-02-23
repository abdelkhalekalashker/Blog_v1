class UsersController < ApplicationController
  def index
    @pagy, @users = pagy(User.all,items: 2)
  end

  def show
    @user = User.find(params[:id])
    @pagy , @user_articles = pagy(@user.articles,items:2)
   end

  def update
    @user = current_user
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
    @user = current_user
  end

  def create
    unless current_user
      @user = User.new(user_params)
      if @user.save!
        flash[:notice] = "user was created"
        redirect_to root_path
      else
        flash[:notice] = "user was not created"
        render new
      end
    end
  end

  def destroy
    current_user.destroy
    flash[:notice] = "user was deleted"
    redirect_to root_path

  end

  private

  def user_params
    params.require(:user).permit(:email,:username,:password)

  end


end
