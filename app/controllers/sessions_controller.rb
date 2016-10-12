class SessionsController < ApplicationController

  before_action :logged_in?, only: [:destroy]
  before_action :logged_out?, only: [:new, :create]
  
  def new
    @user = User.new
    render :new
  end

  def create
    @user = User.create(user_params)
    if @user
      login(@user)
      flash[:notice] = "Succesfully logged in."
      redirect_to root_path
    else
      flash[:error] = "Incorrect email or password."
      redirect_to login_path
    end
  end

  def destroy
    logout
    flash[:notice] = "Succesfully logged out."
    redirect_to root_path
  end

  private

  def user_params
    params.require(:user).permit(:email, :password)
  end

end
