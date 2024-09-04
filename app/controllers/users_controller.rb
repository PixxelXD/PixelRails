class UsersController < ApplicationController
  def index
    # For get all users
    @users = User.all
    @user = User.new
  end

  def create
  end

  def update
  end

  def destroy
  end
end
