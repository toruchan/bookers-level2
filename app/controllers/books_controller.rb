class BooksController < ApplicationController
  def index
    @user = User.find(current_user.id)
    @book = Book.new
    @books = Book.all
  end
  
  def create
    @book = Book.new(book_params)
    @book.user_id = current_user.id
    if @book.save
      redirect_to book_path(@book.id), notice: 'successfully'
    else
      # redirect_to books_path
      @user = User.find(@book.user_id)
      render 'users/show'
    end
  end

  def show
    @book = Book.find(params[:id])
    @user = User.find(@book.user_id)
    if @book.user_id != current_user.id
      redirect_to books_path
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
      redirect_to book_path(@book.id), notice: 'successfully'
    else
      render :edit
    end
  end

  private
  def book_params
    params.require(:book).permit(:title, :body)
  end

end
