class UsersController < ApplicationController

  before_action :logged_in?, only: [:edit, :update]
  #before_action :set_user, only: [:show, :edit, :update]

  def index
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
    @user = current_user
    @books = Book.find_by_user_id(current_user.id)
    
  end

  def edit
    @user = current_user
  end

  def update
    @user = current_user
    current_params = params.require(:user).permit(:name, :email)
    @user.update_attributes(current_params)
    redirect_to user_path
  end

  def destroy
  end


  private

  def user_params
    params.require(:user).permit(:name, :email, :password)
  end

end
