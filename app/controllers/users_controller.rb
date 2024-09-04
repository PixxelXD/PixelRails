class UsersController < ApplicationController
  def index
    # For get all users
    @users = User.all
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      redirect_to users_path, notice: 'User was successfully created.'
    else
      render :index
    end
  end

  def update
  end

  def destroy
  end

  def user_params
    params.require(:user).permit(:first_name, :last_name, :birth_date, :gender, :email, :phone_number, :subject)
  end
end
