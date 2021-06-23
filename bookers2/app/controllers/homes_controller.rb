class HomesController < ApplicationController
  def top
  end

  def about
  end

  def index
    @book = Book.new
    @Book.find(params[:id])
  end

  def create
    @book = Book.new(book_params)
    @book.user_id = current_user.id
    if @book.save
    redirect_to book_path(@book.id)
    else
    @books = Book.all
    render :index
    end
  end

  def book_params
    params.require(:book).permit(:title,:body)
  end

end
