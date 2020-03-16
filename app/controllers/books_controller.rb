class BooksController < ApplicationController
  def index
    @book = Book.new
    @books = Book.all
  
  end

  def new
    @book = Book.new
    redirect_to '/show'
  end

  def show
    @book = Book.find(params[:id])
  end

  
  def edit
    @book = Book.find(params[:id])
  end

  def create
     book = Book.new(book_params)
     book.save
     redirect_to books_path
  end
  def destroy
    book = Book.find(params[:id])
    book.destroy
    redirect_to books_path
  end

  private

  def book_params
    params.require(:book).permit(:title, :body)
  end
end
