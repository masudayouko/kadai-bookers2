class BooksController < ApplicationController
  before_action :authenticate_user!
  def index
    @book = Book.new
  	@books = Book.all
    

  end

  def show
  	@book = Book.find(params[:id])
    @newbook = Book.new

  end


  def create
    
  	@book = Book.new(book_params)
  	@book.user_id = current_user.id
    if @book.save
    redirect_to book_path(@book.id), notice: 'Book was successfully created.'
    else
    @books = Book.all
    render action: :index
    end
  end

  def edit
  	 @book = Book.find(params[:id])
     if @book.user_id != current_user.id
      redirect_to books_path
    end


  end

  def update
    @book = Book.find(params[:id])
    if @book.update(book_params)
       redirect_to book_path(@book), notice: 'Book was successfully updated.'
    else #def editの代わり
      render action: :edit
    end
end

   def destroy
    @book = Book.find(params[:id])
    @book.destroy
    redirect_to books_path, notice: 'Book was successfully destroyed.'
  end

  private
  def book_params
    params.require(:book).permit(:title, :body)
  end
  end
