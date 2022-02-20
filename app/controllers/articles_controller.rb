class ArticlesController < ApplicationController
  def index
    @blog = Blog.find_by(id:params[:blog_id])
    @articles = Article.where(blog_id: params[:blog_id]).published
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

  def edit
    @article = Article.find_by(id:params[:id])
  end

  def update
    @article = Article.find_by(id:params[:id])
    if @article.update(article_params)
      redirect_to blog_articles_path(@article.blog)
    else
      render :edit
    end
  end
  
  def show
    @article = Article.find_by(id:params[:id])
  end

  def destroy
    @blog = Blog.find_by(id:params[:blog_id])
    @article = Article.find_by(id:params[:id])
    @article.destroy
    redirect_to blog_articles_path(@article.blog)
  end
  
  private
  def article_params
    params.require(:article).permit(:title, :content, :publish)
  end
end
