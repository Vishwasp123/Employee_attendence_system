class UsersController < ApplicationController
before_action :find_user, only: %i[show edit update destroy]

  def index
    @users = User.all
  end

  def new
    @user = User.new
  end

  def create
    @user = User.create(user_params)
    if @user.valid?
      flash[:errors] = 'User Created Successfully'
      redirect_to root_path
    else
      flash[:errors] = @user.errors.full_messages
      render :new
    end
  end

  def show; end

  def edit; end

  def update
    if @user.update(user_params)
      flash[:errors] = 'User Updated Successfully'
      redirect_to users_path(@user)
    else
      flash[:errors] = @user.errors.full_messages
      redirect_to edit_user_path
    end
  end

  def destroy
    if @user.destroy
      flash[:errors] = 'User Deleted Successfully'
      redirect_to root_path(@user)
    else
      flash[:errors] = @user.errors.full_messages
      redirect_to destroy_user_path
    end
  end

  private

  def find_user
    @user = User.find(params[:id])
  end

  def user_params
    params.require(:user).permit(:name, :user_name, :email, :phone_number, :gender, :active, :password)
  end

end