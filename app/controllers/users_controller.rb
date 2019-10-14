class UsersController < ApplicationController
  def home
  end
  def about
  end
  def index
  	@users = User.all
   	@book = Book.new
   	# @user = User.find(params[:id])
  end
  def show
  	@user = User.new
  	@user = User.find(params[:id])
  	@books = Book.where(user_id: params[:id])
  	# @books = current_user.books.all
   	# @books = Book.find(params[:id])
  	@book = Book.new
  end
  def edit
  	@user = User.find(params[:id])
  end
  def update
  	@user = User.find(params[:id])
  	if @user.update(user_params)
  		flash[:notice] = "You have updated user successfully."
  	    redirect_to user_path(@user.id)
  	else
  	 	render "edit"
  	end
  end
  private
  def user_params
    params.require(:user).permit(:name, :introduction, :profile_image, :user_id) #user_id不要？
  end
  def correct_user
    user = User.find(params[:id])
  	if current_user != user
      redirect_to user_path(current_user.id)
    end
  end
end
