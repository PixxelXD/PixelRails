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
            turbo_stream.append('users_list_box', partial: 'users/user', locals: { user: @user })
          ]
        end
        format.html { redirect_to users_path, notice: 'User was successfully created.' }
      end
    else
      @users = User.all
      render :index
    end
  end  

  def edit
    @users = User.all
    @user = User.find(params[:id])
    if @user == nil
      redirect_to users_path
    end
    
    respond_to do |format|
      format.turbo_stream do
        render turbo_stream: turbo_stream.replace('user_form', partial: 'users/form', locals: { user: @user })
      end
      format.html { render :edit }
    end
  end

  def update
    @user = User.find(params[:id])
    if @user.update(user_params)
      respond_to do |format|
        format.turbo_stream do
          redirect_to users_path, notice: 'User was successfully updated.'
        end
        format.html { redirect_to users_path, notice: 'User was successfully updated.' }
      end
    else
      render :index
    end
  end
  
  
  def destroy
    @user = User.find(params[:id])
    @user.destroy
    @users = User.all
    respond_to do |format|
      format.turbo_stream { render turbo_stream: turbo_stream.remove(@user) }
      format.html { redirect_to users_path, notice: 'User was successfully destroyed.' }
    end
  end

  def user_params
    params.require(:user).permit(:first_name, :last_name, :birth_date, :gender, :email, :phone_number, :subject)
  end
end
