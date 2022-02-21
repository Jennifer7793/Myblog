class ArticlesController < ApplicationController
  before_action :find_article, only: %i[edit update show destroy]
  before_action :find_blog, only: %i[index new create destroy]
  before_action :authenticate_user!

  def index
    @articles = Article.where(blog_id: params[:blog_id]).published
  end

  def new
    @article = Article.new
  end

  def create
    @article = @blog.articles.create(article_params)
    if @article.save
      redirect_to blog_articles_path
    else
      render :new
    end
  end

  def edit
  end

  def update
    if @article.update(article_params)
      redirect_to blog_articles_path(@article.blog)
    else
      render :edit
    end
  end
  
  def show
  end

  def destroy
    @article.destroy
    redirect_to blog_articles_path(@article.blog)
  end
  
  private
  def find_blog
    @blog = Blog.find_by(id:params[:blog_id])
  end

  def find_article
    @article = Article.find_by(id:params[:id])
  end

  def article_params
    params.require(:article).permit(:title, :content, :publish)
  end
end
