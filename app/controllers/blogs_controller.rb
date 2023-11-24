class BlogsController < ApplicationController
  before_action :authenticate_user

  def index
    @blogs = current_user.blogs
  end

  def new
    @blog = Blog.new
  end

  def create
    @blog = current_user.blogs.new(blog_params)

    if @blog.save
      redirect_to root_path, notice: 'Blog created successfully'
    else
      render :new
    end
  end

  private

  def blog_params
    params.require(:blog).permit(:title, :content)
  end
end
