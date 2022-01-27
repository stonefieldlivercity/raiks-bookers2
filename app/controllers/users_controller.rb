class UsersController < ApplicationController

  def new
    @book=Book.new
  end

  def create
    @book=Book.new(params_path)
    @book.user_id=current_user.id
    if@book.save
      redirect_to user_path
    else
      render :index
    end
  end

  def index
    @user = current_user
    @users = User.all
    @book = Book.new
  end

  def show
   @book = Book.new
   @user = User.find(params[:id])
   @books = @user.books
  end

  def edit
    @user = User.find(params[:id])
    if @user == current_user
      render :edit
    else
      redirect_to user_path(current_user)
    end
  end

  def update
   @user = User.find(params[:id])
   if @user.update(user_params)
     redirect_to user_path(@user), notice: 'You have updated user successfully.'
   else
     render :edit
   end
  end

  private

  def user_params
   params.require(:user).permit(:name, :introduction, :profile_image)
  end
end
