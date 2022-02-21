class BlogsController < ApplicationController
  before_action :find_blog, only: %i[edit update destroy]
  before_action :authenticate_user!

  def index
    @blogs = Blog.all
  end
  
  def new
    @blog = Blog.new
  end
  
  def create
    @blog = Blog.new(blog_params)
    if @blog.save
      redirect_to blogs_path
    else
      render :new
    end
  end
  
  def show
    @blog = Blog.find_by(id:params[:id])
    @articles = Article.where(blog_id: params[:blog_id]).published
    if params[:search]
    @search_result = User.where("email LIKE ?", "%#{params[:search]}%")
    else
      #
    end 
  end

  def edit
  end
  
  def update
    if @blog.update(blog_params)
      redirect_to blogs_path
    else
      render :edit
    end
  end
  
  def destroy
    @blog.delete
    redirect_to blogs_path, notice: 'blog deleted!'
  end

  def search
    @user = User.where("email LIKE ?", "%#{params[:search]}%")
  end
  
  private
  def find_blog
    @blog = current_user.blogs.find_by(id:params[:id])
  end

  def blog_params
    params.require(:blog).permit(:title, :content, :author, :user_id).merge(user_id: current_user.id)
  end
end
