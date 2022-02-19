class ArticlesController < ApplicationController
  def index
    @articles = Article.published
  end

  def new
    @blog = Blog.find_by(id:params[:blog_id])
    @article = Article.new
  end

  def create
    @blog = Blog.find_by(id:params[:blog_id])
    @article = @blog.articles.create(article_params)
    if @article.save
      redirect_to blog_articles_path
    else
      render :new
    end
  end
  
  def show
    @article = Article.find_by(id:params[:id])
  end

  def destroy
    @blog = Blog.find_by(id:params[:blog_id])
    @article = Article.find_by(id:params[:id])
    @article.destroy
    redirect_to blog_articles_path
  end
  
  private
  def article_params
    params.require(:article).permit(:title, :content)
  end
end
