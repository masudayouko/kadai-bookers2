class UsersController < ApplicationController
  before_action :authenticate_user!
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
    if @user != current_user
      redirect_to user_path(current_user)
    end

   end

  def update
    @user = User.find(params[:id])
    if @user.update(user_params)
       redirect_to user_path(@user), notice: 'User was successfully updated.'
    else #def editの代わり
      render action: :edit
    end
  end


  def user_params
  	params.require(:user).permit(:profile_image,:name,:introduction)
  end
end

