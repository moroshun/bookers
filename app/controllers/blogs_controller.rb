class BlogsController < ApplicationController
  def index
  	@blogs = Blog.all
  	@blog = Blog.new
  end
  def show
  	@blog = Blog.find(params[:id])
    @b=Blog.new
  end

  def new
  	 @blog = Blog.new
  end

  def create
        @blog = Blog.new(blog_params)
        @blog.user_id = current_user.id

        if @blog.save
          flash[:success] = 'Book was successfully created.'
          redirect_to blog_path(@blog.id)
        else
          @blogs = Blog.all
          render 'index'
        end

  end

  def edit
  	@blog = Blog.find(params[:id])
  end

  def update
    blog = Blog.find(params[:id])
    blog.update(blog_params)
    redirect_to blog_path(blog)
  end

  def destroy
        blog = Blog.find(params[:id])
        blog.destroy
        redirect_to blogs_path
  end

  def blog_params
        params.require(:blog).permit(:title, :category, :body)
  end

end
