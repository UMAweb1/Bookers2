class BooksController < ApplicationController
    def index
    	@books = Book.all
    	@book = Book.new
       	# @book = Book.find(params[:id])
       	# @user = User.find(params[:id])
    end
    def create
  		@book = Book.new(book_params)
  		@book.user_id = current_user.id
  		if @book.save
  		   flash[:notice] = "You have creatad book successfully."
  	   	   redirect_to book_path(@book)
  	   	else
  	   	   @books = Book.all
  	   	   render "index"
  	   	end
    end
    def show
    	@book = Book.find(params[:id])
    	@newbook = Book.new
      @post_comment = PostComment.new
      # @favorite = Favorite.new
      # @comments = @book.comments
    	# @user = User.find(params[:id])
    end
    def edit
  		@book = Book.find(params[:id])
      # @comment = Comment.find(params[:id])
  	end
  	def update
  		@book = Book.find(params[:id])
  		if @book.update(book_params)
  		   flash[:notice] = "You have updated book successfully."
  		   redirect_to book_path(@book)
  		else
  			render "edit"
  		end
  	end
    def destroy
    	@book = Book.find(params[:id])
    	if @book.destroy
    	   redirect_to books_path
    	else
    		render "show"
    	end
    end
  	private
  	def book_params
  		params.require(:book).permit(:title, :body, :user_id, :name, :profile_image) #:user_id不要？
  	end
    def correct_user
     @book = Book.find(params[:id])
     if current_user != @book.user
     	redirect_to books_path
	   end
    end
end
