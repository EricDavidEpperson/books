class BooksController < ApplicationController
  before_action :authenticate_user!, :except => [:index, :show]#, :new, :edit, :update, :create, :destroy]
  respond_to :html

  def index
    @books = Book.query(params).page(params[:page])
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
    params.require(:book).permit(:title,
                                 :format,
                                 :length,
                                 :release_year,
                                 :rating,
                                 :photo,
                                 :author_first_name,
                                 :author_last_name,
                                 :description,
                                 :reverse_font)
  end

end
