class UsersController < ApplicationController
	def new
    end
    def create
    end
    def index
    	@users = User.all
  		@user = current_user
  		@blog = Blog.new
  		@blogs = Blog.all

    end
    def show
        @user = User.find(params[:id])
        @blog = Blog.new
    end
    def edit
      @user = current_user
    end
    def update
       @user = User.find(params[:id])
    if @user.update(user_params)
        redirect_to user_path(@user)
     else
       render "edit"
    end
  end
    def user_params
        params.require(:user).permit(:name, :image, :body)
  end
end
