class ArticlesController < ApplicationController
  def index
    @articles = Article.all
  end

  def new
    @blog = Blog.find_by(id:params[:blog_id])
    @article = Article.new
  end

  def create
    blog = Blog.find_by(id:params[:id])
    @article = blog.articles.build(article_params)
    if @article.save
      redirect_to blog_articles_path
    else
      render :new
    end
  end
  
  def destroy
    @article = Article.find_by(id:params[:id])
    @article.destroy
    redirect_to blog_articles_path
  end
  
  private
  def article_params
    params.require(:article).permit(:title, :content)
  end
end
