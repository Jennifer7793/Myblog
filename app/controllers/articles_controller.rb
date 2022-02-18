class ArticlesController < ApplicationController
  def index
    @articles = Article.all

  def new
    @article = Article.new
  end

  def create
    @article = Article.new(article_params)
    if @article.save
      redirect_to articles_path
    else
      render :new
    end
  end
  
  def destroy
    @article = Article.find_by(id:params[:id])
    @article.destroy
    redirect_to articles_path
  end
  
  private
  def article_params
    params.require(:article).permit(:title, :content, :blog_id)
  end
end
