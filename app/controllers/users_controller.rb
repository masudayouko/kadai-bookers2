class UsersController < ApplicationController
  def show
  	@user = User.find(params[:id])
  	#@books = Book.where(user_id: @user.id)
  	@books = @user.books
  	@book = Book.new
  end

  def index

  end


  def create
  	@book = Book.new(book_params)
  	
    @book.save
    redirect_to user_path(params[:id]), notice: 'Book was successfully created.'
  end

end
