class UsersController < ApplicationController

  before_action :authenticate_user!

  def index
  @users =User.all
  @book = Book.new
  @user = current_user
  end

  def show
    @new_book = Book.new
    @user =User.find(params[:id])
    @books =@user.books
    @book =Book.new

  end

  def edit
   @user = User.find(params[:id])
   if @user != current_user
   redirect_to user_path(current_user)
   end
  end

  def update
   @user = User.find(params[:id])
    if @user.update(user_params)
      flash[:notice] = "You have updated user successfully."
      redirect_to user_path(@user.id)
    else
      render :edit
    end
  end

  private
  # ストロングパラメータ
  def user_params
    params.require(:user).permit(:name, :profile_image, :introduction)
  end


end
