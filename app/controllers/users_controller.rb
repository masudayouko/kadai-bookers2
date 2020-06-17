class UsersController < ApplicationController
  def show
  	@user = User.find(params[:id])
  	#@books = Book.where(user_id: @user.id)
  	@books = @user.books
  end
  def index
  end

end
