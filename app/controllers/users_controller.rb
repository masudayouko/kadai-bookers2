class UsersController < ApplicationController
  def show
  	@user = User.find(params[:id])
  	#@books = Book.where(user_id: @user.id)
  	@books = @user.books
  	@book = Book.new
  end

  def index
    @book = Book.new
    @users = User.all
    
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])
    @user.update(user_params)
    redirect_to user_path(@user)
  end


  def user_params
  	params.require(:user).permit(:profile_image,:name,:introduction)
  end
end

