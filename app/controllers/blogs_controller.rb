class BlogsController < ApplicationController
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
    @user = User.where("email LIKE ?", "%#{params[:search]}%")
  end

  def edit
    @blog = Blog.find_by(id:params[:id])
  end
  
  def update
    @blog = Blog.find_by(id:params[:id])
    if @blog.update(blog_params)
      redirect_to blogs_path
    else
      render :edit
    end
  end
  
  def destroy
    @blog = Blog.find_by(id:params[:id])
    @blog.destroy
    redirect_to blogs_path, notice: 'blog deleted!'
  end

  def search
    @user = User.where("email LIKE ?", "%#{params[:search]}%")
  end
  
  private
  def blog_params
    params.require(:blog).permit(:title, :content, :author)
  end
end
