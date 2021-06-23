class UsersController < ApplicationController

    def index
        @users = User.all
        @book = Book.new
    end

    def show
       @book = Book.new
       @user = User.find(params[:id])
       @books = @user.books.all

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

    def edit
        @user = User.find(params[:id])
        if current_user == @user
        render :edit
        else
        redirect_to user_path(current_user.id)
        end
    end

    def update
        @user = User.find(params[:id])
        if @user.update(user_params)
        flash[:notice] = "You have updated user successfully."
        redirect_to user_path(@user.id)
        else
        render :edit
        end
    end


    def user_params
    params.require(:user).permit(:name,:introduction, :profile_image)
    end

end
