class BooksController < ApplicationController
  respond_to :html

  def index
    @books = Book.query(params)#.page(params[:page])-for pagination
    respond_with @books
  end

  def show
    @book = Book.find(params[:id])
  end

  def new
    @book = Book.new
  end

  def edit
    @book = Book.find(params[:id])
  end

  def update
    @book = Book.find(params[:id])
    if @book.update book_params
      redirect_to @book
    else
      render :edit
    end
  end

  def create
    @book = Book.new(book_params)
    if @book.save
      redirect_to books_path
    else
      render :new
    end
  end

  def destroy
    @book = Book.find(params[:id])
    @book.destroy
    redirect_to books_path
  end

  private
  def book_params
    params.require(:book).permit(:title, :format, :length, :release_year, :rating, :photo, :author, :description)
  end

end
