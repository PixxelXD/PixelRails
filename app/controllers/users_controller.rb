class UsersController < ApplicationController
  def index
    @users = User.all
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      respond_to do |format|
        format.turbo_stream do
          render turbo_stream: [
            turbo_stream.replace('user_form', partial: 'users/form', locals: { user: User.new }),
            turbo_stream.append('users_list_tbody', partial: 'users/user', locals: { user: @user })
          ]
        end
        format.html { redirect_to users_path, notice: 'User was successfully created.' }
      end
    else
      @users = User.all
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
