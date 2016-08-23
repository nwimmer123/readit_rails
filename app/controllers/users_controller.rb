class UsersController < ApplicationController

  def index
    @users = User.all
    render :index
  end

  def new
  end

  def create
    user = User.new(user_params)
    if user.save
      login(user)
      redirect_to root_path
    else
      flash[:error] = "Email has already been taken"
      redirect_to '/signup'
    end
  end

  def show
    @user = User.find_by_id(params[:id])
    render :show
  end

  private

  def user_params
    params.require(:user).permit(:name, :email, :password)
  end

end
