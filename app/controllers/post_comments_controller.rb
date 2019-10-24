class PostCommentsController < ApplicationController
	def create
		book = Book.find(params[:book_id])
		comment = current_user.post_comments.new(post_comment_params)
		comment.user_id = current_user.id
		comment.book_id = book.id
		# user = User.find_by(id: @book.user_id)
		comment.save
		redirect_to book_path(book)
	end
	def edit
		@book = Book.find(params[:book_id])
		@comment = @book.post_comments.find(params[:id])
		# @comment = Post_comment.find(params[:id])
		@comment.user_id = current_user.id
	end
	def update
		@book = Book.find(params[:book_id])
		@comment = @book.post_comments.find(params[:id])
		@comment.update(post_comment_params)
		redirect_to book_path(@book)
	end
	def destroy
		@book = Book.find(params[:book_id])
		@comment = @book.post_comments.find(params[:id])
		@comment.destroy
		redirect_to book_path(@book)
	end
	private
	def post_comment_params
		params.require(:post_comment).permit(:user_id, :book_id, :comment)
	end
    def correct_user

	end
end
